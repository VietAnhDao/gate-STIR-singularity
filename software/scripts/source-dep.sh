# Source this script inside the container to add paths.
# You need to source this script again after compiling Geant4 
# and/or ROOT.

if [[ -f $GATE_ROOT_DIR/geant4/install/bin/geant4.sh ]]; then
  # cd then source because zsh etc... requires this
  cd $GATE_ROOT_DIR/geant4/install/bin
  source geant4.sh
fi
if [[ -f $GATE_ROOT_DIR/root-cern/install/bin/thisroot.sh ]]; then
  source $GATE_ROOT_DIR/root-cern/install/bin/thisroot.sh 
fi
export PATH=$PATH:$GATE_ROOT_DIR/gate/bin
export PATH=$PATH:$GATE_ROOT_DIR/STIR/install/bin
