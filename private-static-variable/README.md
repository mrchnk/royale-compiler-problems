private-static-variable
=======================

Inconsistent problems with initialized private static variables:

ActionScript3 code (SomeClass.as):

```
class SomeClass {

  private static var x = new AnotherClass();

  public function someMethod() {
    x.anotherMethod();
  }

}
```

Private accessor prefix for static variable `x` is missed in initialization code.
Everywhere else that prefix is present.

Javascript code (SomeClass.js):

```
pac.kage.SomeClass.x = new pac.kage.AnotherClass();
```

Expected javascript code  (SomeClass.js):

```
pac.kage.SomeClass.pac_kage_SomeClass_x = new pac.kage.AnotherClass();
```

How to run this example
-----------------------

Checkout repository, using your favorite node package manager run scripts in
order: `install`, `run build`, `run start`. That will build ActionScript code 
into JSNode application and run it.

```
private-static-variable> npm install

added 1 package from 1 contributor and audited 1 package in 20.213s
found 0 vulnerabilities

private-static-variable> npm run build

MXMLJSC
-js-output-type=jsc
+configname=js
-targets=JSNode
-debug=true
-source-path=src
-output=out
-library-path=node_modules/@apache-royale/royale-js/royale-asjs/frameworks/js/libs
src/Main.as

...

INFO: 0 error(s), 0 warning(s), 96.8% typed
The project 'Main' has been successfully compiled and optimized.

private-static-variable> npm run start

TypeError: Cannot read property 'parseId' of undefined
```
