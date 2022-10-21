#!/bin/bash
case ${target_platform} in osx-64 )
  # TODO: Remove once r-bh uses Boost >=1.80.
  # std::aligned_alloc only available from macOS SDK version 10.15 onward.
  # Boost <=1.79 erroneously wants to use std::aligned_alloc in older SDKs, too.
  # https://www.boost.org/doc/libs/1_80_0/doc/html/boost_asio/history.html#boost_asio.history.asio_1_24_0___boost_1_80
  export CXXFLAGS="${CXXFLAGS} -DBOOST_ASIO_DISABLE_STD_ALIGNED_ALLOC"
esac
export DISABLE_AUTOBREW=1
${R} CMD INSTALL --build . ${R_ARGS}
