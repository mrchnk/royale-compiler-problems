named-closure
=============

https://github.com/apache/royale-compiler/issues/68

Named functions defined in method scope is not passed properly as arguments

```
var filteredArray: Array = array.filter(function isEven(element: int, index: int, arr: Array) : Boolean {
  return element % 2 == 0;
});
```

No problem with anonymous functions in that case

```
var filteredArray: Array = array.filter(function (element: int, index: int, arr: Array) : Boolean {
  return element % 2 == 0;
});
```

How to run this example
-----------------------

Checkout repository, using your favorite node package manager run scripts in
order: `install`, `run build`, `run start`. That will build ActionScript code 
into JSNode application and run it.

```
named-closure> npm install

added 1 package from 1 contributor and audited 1 package in 20.213s
found 0 vulnerabilities

named-closure> npm run build

MXMLJSC
-js-output-type=jsc
+configname=js
-targets=JSNode
-debug=true
-source-path=src
-output=out
-library-path=${royalelib}/js/libs
src/Main.as

...

The project 'Main' has been successfully compiled and optimized.

named-closure> npm run start

ReferenceError: __localFn0__ is not defined
```
