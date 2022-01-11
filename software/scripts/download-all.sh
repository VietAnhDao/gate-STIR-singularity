#!/bin/bash
# Run the script once inside the container to download stuff into the $GATE_ROOT_DIR.
# Don't clone if directories already exist.

source $GATE_ROOT_DIR/scripts/versions.sh

cd $GATE_ROOT_DIR



# CMake
if [[ -e "cmake-3.18.4-Linux-x86_64" ]]
then 
  echo "cmake-... directory already exists, skipping download."
else
  wget https://github.com/Kitware/CMake/releases/download/v3.18.4/cmake-3.18.4-Linux-x86_64.tar.gz
  tar xzvf cmake-3.18.4-Linux-x86_64.tar.gz
  rm cmake-3.18.4-Linux-x86_64.tar.gz
fi
# CLHEP
if [[ -e clhep/src ]]
then 
  echo "clhep directory already exists, skipping download."
else
  export CLHEP_File=clhep-$CLHEP_Version.tgz
  export CLHEP_URL=https://proj-clhep.web.cern.ch/proj-clhep/dist1/$CLHEP_File
  mkdir -p clhep/src clhep/bin clhep/install
  wget $CLHEP_URL 
  tar -zxf $CLHEP_File -C clhep/src --strip-components=1
  rm $CLHEP_File
fi
# Geant4
if [[ -e geant4/src ]]
then 
  echo "geant4 directory already exists, skipping download."
else
  mkdir -p geant4/src geant4/bin geant4/install geant4/data
  git clone --branch $Geant4_Version https://github.com/Geant4/geant4.git geant4/src
fi
# ITK
if [[ -e ITK/src ]]
then 
  echo "ITK directory already exists, skipping download."
else
  mkdir -p ITK/src ITK/bin
  git clone https://github.com/InsightSoftwareConsortium/ITK.git ITK/src
fi
# ROOT
if [[ -e root-cern/src ]]
then 
  echo "root-cern directory already exists, skipping download."
else
  mkdir -p root-cern/src root-cern/bin root-cern/install
  git clone --branch $ROOT_Version https://github.com/root-project/root.git root-cern/src
fi
# GATE
if [[ -e gate/src ]]
then 
  echo "gate directory already exists, skipping download."
else
  mkdir -p gate/src gate/bin
  git clone --branch $Gate_Version https://github.com/OpenGATE/Gate.git gate/src
fi





