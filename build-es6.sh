#!/bin/bash
sed -e 's/var b2_/const b2_/g' -e 's/var _malloc=//' liquidfun.js
echo "export {"
grep -Po "var b2_\K[a-zA-Z0-9_.-]+" liquidfun.js | awk '{print "b2_" $1 " as " $1 ","}'
grep -Po "function b2\K[a-zA-Z0-9_.-]+" liquidfun.js | awk '{print "b2" $1 " as " $1 ","}'
echo "}"
