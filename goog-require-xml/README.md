goog-require-xml
================

https://github.com/apache/royale-compiler/issues/95

Unneeded dependency on XML in every JS file
-------------------------------------------

If a project has a dependency on XML in any class, that dependency is appended to every JS files.
option `-remove-circulars` should be set to `false` to reproduce that.

Also sometimes line with dependency `goog.require('XML');` placed wrongly at file tail (1 line before last)
That happened when `goog.provide` is not present in JS file (expected for files with `@externs`)

When `-remove-circulars` set to `true` dependencies on `XML` removed except wrongly placed.
In that case building with **closure compiler** for release will fail in most cases with messages:

```
SEVERE: .../out/bin/js-debug/ExternalWithoutDependency.js:18: ERROR - Closure primitive methods (goog.provide, goog.require, goog.define, etc) must be called  at file scope.
goog.require('XML');
^^^^^^^^^^^^^^^^^^^
```
