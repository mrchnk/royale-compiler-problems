conditional-compilation-block
=============================

Compiler omits any class-scoped conditional compilation blocks

```
class Main {

  CONFIG::DEBUG {
    private var _debug: int;
  }

}

```

No problem with conditional compilation "keywords" or function-scoped blocks

```
class Main {

  CONFIG::DEBUG
  private var _debug: int;

  function test(): void {
    CONFIG::DEBUG {
      trace(_debug);
    }
  }

}
```

How to run this example
-----------------------

Checkout repository, using your favorite node package manager run scripts in
order: `install`, `run build`, `run start`. That will build ActionScript code 
into JSNode application and run it.

```
conditional-compilation-block> npm install

added 1 package from 1 contributor and audited 1 package in 20.213s
found 0 vulnerabilities

conditional-compilation-block> npm run build

MXMLJSC
-js-output-type=jsc
+configname=js
-targets=JSNode
-debug=true
-source-path=src
-output=out
-library-path=${royalelib}/js/libs
-define+=CONFIG::DEBUG,true
src/Main.as

...

The project 'Main' has been successfully compiled and optimized.

conditional-compilation-block> npm run start

TypeError: this.Main_debugThis is not a function
```
