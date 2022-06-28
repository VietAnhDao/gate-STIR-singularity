#!/bin/bash
# Compile GATE including all dependencies.
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
set -e

# Each subproject has 
# - a configure.sh calling CMake
# - a build.sh (mostly) calling make
# You need to call the configure.sh before the build.sh for every project,
# and respect the following dependencies:
# - geant4/configure.sh depends on clhep/build.sh
# - gate/configure.sh depends on geant4/build.sh and root-cern/build.sh

$GATE_ROOT_DIR/clhep/configure.sh
$GATE_ROOT_DIR/clhep/build.sh
$GATE_ROOT_DIR/geant4/configure.sh
$GATE_ROOT_DIR/geant4/build.sh
$GATE_ROOT_DIR/ITK/configure.sh
$GATE_ROOT_DIR/ITK/build.sh
$GATE_ROOT_DIR/root-cern/configure.sh
$GATE_ROOT_DIR/root-cern/build.sh
$GATE_ROOT_DIR/gate/configure.sh
$GATE_ROOT_DIR/gate/build.sh
$GATE_ROOT_DIR/STIR/configure.sh
$GATE_ROOT_DIR/STIR/build.sh
