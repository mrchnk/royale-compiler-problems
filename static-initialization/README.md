static-initialization
=====================

Problems with lazy initialization code for static members referencing other classes.

Simple ActionScript3 code

```
public class Enum {
  
  private static const _registry:EnumRegistry = new EnumRegistry();
  public function Enum(name:String) {
    _name = name;
    _registry.add((this as Object).constructor, this);
  }
  // ...
}
```

Will generate lazy-initialization const using properties (JSDoc was omitted):
```
Enum.get___registry = function() {
  var value = new EnumRegistry();
  Object.defineProperty(Enum, '_registry', { 
    value: value, 
    writable: false 
  });
  return value;
};

Object.defineProperties(Enum, {
  _registry: {
    get: Enum.get___registry,
    configurable: true
  }
});
```

Looks OK. Even with property redefinition, that code runs correctly.

But after minimization process by Closure Compiler problem pops up.
```
// Enum becomes `v`, EnumRegistry becomes `x`, _registry becomes `m`
Object.defineProperties(v, {
  m: {
    get: function () {
      var a = new x;
      // '_registry' is not renamed, because it is a string value
      Object.defineProperty(v, '_registry', {
        value: a,
        writable: !1
      });
      return a
    },
    configurable: !0
  }
});
```

That will cause `TypeError: Cannot redefine property: _registry` on second access of `v.m`;

That is not a problem on references to itself:
```
Target.JSRoyale = new Target('JSRoyale');
Target.JS = new Target('JS');
Target.JSNode = new Target('JSNode');
Target.JSNodeModule = new Target('JSNodeModule');
Target.SWF = new Target('SWF');
```

That was not a problem on 0.9.6 since `static const` and `static var` was initialized without properties, just like regular members:

```
Enum._registry = new EnumRegistry();
```

I wanted to mention one more problem with such initialization on larger codebases.
Seems like that lazy-initialization reference to EnumRegistry is not counted properly during compilation. 
And that can cause EnumRegistry class is not fully initialized during another static initialization (like Target.* consts)

How to run this example
-----------------------

Checkout repository. Run scripts in order: `npm install`, `npm run build`, `npm run start`.
That will build ActionScript code into JSNode application and run it.

```
static-initialization> npm install
npm WARN static-initialization@1.0.0 No repository field.
npm WARN static-initialization@1.0.0 No license field.

audited 1 package in 0.421s
found 0 vulnerabilities

static-initialization> npm run build

> static-initialization@1.0.0 build static-initialization
> asjsc -targets=JSNode -source-path=src -output=out +configname=royale src/Main.as

MXMLJSC
-js-output-type=jsc
+configname=js
-targets=JSNode
-source-path=src
-output=out
+configname=royale
src/Main.as
Dec 16, 2020 1:45:05 PM com.google.javascript.jscomp.LoggerErrorManager printSummary
INFO: 0 error(s), 0 warning(s), 96.7% typed
The project 'Main' has been successfully compiled and optimized.
5.6499513 seconds

static-initialization> npm run start

> static-initialization@1.0.0 start static-initialization
> node out/bin/js-release/index.js

TypeError: Cannot redefine property: _registry
    at Function.defineProperty (<anonymous>)
    at Function.get (static-initialization\out\bin\js-release\Main.js:3:613)
    at F.v (static-initialization\out\bin\js-release\Main.js:3:498)
    at new F (static-initialization\out\bin\js-release\Main.js:8:424)
    at Object.<anonymous> (static-initialization\out\bin\js-release\Main.js:8:476)
    at Module._compile (internal/modules/cjs/loader.js:1147:30)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1167:10)
    at Module.load (internal/modules/cjs/loader.js:996:32)
    at Function.Module._load (internal/modules/cjs/loader.js:896:14)
    at Module.require (internal/modules/cjs/loader.js:1036:19)
```
