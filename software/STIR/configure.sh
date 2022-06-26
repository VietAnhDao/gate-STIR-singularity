#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/STIR/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  cmake ../src/ -DGeant4_DIR=$PWD/../../geant4/install \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DITK_DIR=$PWD/../../ITK/bin \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DCMAKE_CXX_STANDARD=17  \
                  -DCMAKE_INSTALL_PREFIX=$GATE_ROOT_DIR/STIR/bin \
                  -DBOOST_ROOT:PATH=$GATE_ROOT_DIR/Boost/src \
                  -DSTIR_CONFIG_DIR=$GATE_ROOT_DIR/STIR/bin/share/stir/config