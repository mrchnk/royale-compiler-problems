dynamic-object-access
=====================

Compiler omits expression with both "." and "[]" access to dynamic `Object`.

```
var object: Object = { coordinate: [10, 20] };
var x: Number = object.coordinate[0];
```

That producing
```
var /** @type {Object} */ object = {coordinate:[10, 20]};
var /** @type {number} */ x = ;
```

How to run this example
-----------------------

Checkout repository, using your favorite node package manager run scripts in
order: `install`, `run build`, `run start`. That will build ActionScript code 
into JSNode application and run it.

```
dynamic-object-access> npm install

added 1 package from 1 contributor and audited 1 package in 20.213s
found 0 vulnerabilities

dynamic-object-access> npm run build

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

The project 'Main' has been successfully compiled and optimized.

dynamic-object-access> npm run start

  var /** @type {number} */ x = ;
                                ^
SyntaxError: Unexpected token ;
```
