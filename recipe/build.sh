#!/bin/bash
export DISABLE_AUTOBREW=1
# https://github.com/nx10/httpgd/commit/efc56d4b6510438842ea36e3ee987a046671ff05
sed -i.bak "s/CXX17/CXX14/g" src/Makevars.in
${R} CMD INSTALL --build . ${R_ARGS}
