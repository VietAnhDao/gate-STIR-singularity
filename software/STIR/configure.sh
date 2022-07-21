#!/bin/bash

source $GATE_ROOT_DIR/scripts/pre-configure.sh

cd $GATE_ROOT_DIR/STIR/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  cmake ../src/ -DGeant4_DIR=$PWD/../../geant4/install \
                  -DBUILD_SWIG_PYTHON=ON \
                  -DSTIR_OPENMP=ON \
                 # uncomment if using homebrew 
                 # -DPython_EXECUTABLE=/opt/homebrew/bin/python3 \
                 # -DPython_INCLUDE_DIRS=/opt/homebrew/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/include \
                 # -DPython_LIBRARIES=/opt/homebrew/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/lib/libpython3.9.dylib \
                 # -DPython_NumPy_INCLUDE_DIRS \
                  -DGEANT4_USE_SYSTEM_CLHEP=ON \
                  -DITK_DIR=$PWD/../../ITK/bin \
                  -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
                  -DCMAKE_CXX_STANDARD=17  \
                  -DCMAKE_INSTALL_PREFIX=$GATE_ROOT_DIR/STIR/install \
                  -DSTIR_CONFIG_DIR=$GATE_ROOT_DIR/STIR/install/share/stir/config
