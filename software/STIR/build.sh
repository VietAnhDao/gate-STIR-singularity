source $GATE_ROOT_DIR/scripts/pre-build.sh

cd $GATE_ROOT_DIR/STIR/bin && \
  source $PWD/../../geant4/install/bin/geant4.sh && \
  source $PWD/../../root-cern/install/bin/thisroot.sh && \
  make -j $MAX_NUM_BUILD_THREADS