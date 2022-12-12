Compile GATE+dependencies in a Singularity container
----------------------------------------------------

```
gate-singularity@local$ sudo singularity build cont.simg singularity.def
gate-singularity@local$ ... # Upload cont.simg and ./software to the cluster, and login
gate-singularity@cluster$ singularity shell --bind software:/software cont.simg
Singularity> /software/scripts/download-all.sh
# ...
Singularity> /software/scripts/build-all.sh
# ...
```

- `singularity.def` is used to create a Singularity image with the necessary build tools, 
  and some convenient debugging tools. The image must probably be built on your local machine 
  because you need root privileges.
- GATE and the dependencies (CLHEP, Geant4, a CMake version, ...) can then be
  downloaded and compiled in the container running on the cluster. 
- The container can read the respective scripts because the directory `software` 
  of the repository on the host system has been mounted to `/software` in the container.
  Likewise, the container puts the downloaded and compiled files into that directory.
  Subsequent compilations can skip unchanged files and should thus be faster.

Compare this to the approach in 
[`Gate/source/docker/`](https://github.com/OpenGATE/Gate/tree/develop/source/docker):  
Building the images from `DockerFileGeant`, `DockerFileGate` according to (e.g.) 
`Generate-9.1.sh` does already download and build Geant4(+further dependencies) and GATE.
The source files are part of the container's isolated file system. They can be edited and 
recompiled in the container, but they cannot be accessed from the host system.

Compile Miniconda3 in a Singularity container
----------------------------------------------------
Miniconda3 is downloaded and install inside the /software/PYTHON folder. The conda enviroment 
should do the same in the /software/PYTHON/env folder e.g. /software/PYTHON/env/python36. 
To activate enviroment (e.g. python36) using the following command:
```
Singularity>source activate /software/PYTHON/env/python36
```
users can then install other packages e.g. numpy, jupyter etc...

Compile STIR+dependencies in a Singularity container
----------------------------------------------------
STIR's download and comilation is built into the /software/scripts/download-all.sh and 
/software/scripts/build-all.sh. It will build and install inside /software/STIR/bin

Running Singularity container
----------------------------------------------------
it is recommended you set two folder path:
```
gate-singularity@local$export WORKDIR=/path/to/folder/to/workdir
gate-singularity@local$export SOFTWARE=/path/to/git/gate-STIR-singularity/software
gate-singularity@local$export IMAGE=/path/to/folder/with/sif/images/sont.sif
```

Before initial build choose which software you want to install e.g. (STIR only require root, clhep, ITK and maybe miniconda).
1. Edit ./software/scripts/download-all.sh
2. Edit ./software/scripts/build-all.sh

Initial build:
```
gate-singularity@local$singularity shell --bind $SOFTWARE:/software $IMAGEDIR/cont.sif
Singularity> /software/scripts/download-all.sh
Singularity> /software/scripts/build-all.sh
```

run command:
```
singularity exec --bind ./:/workdir,$SOFTWARE/:/software $IMAGE/STIR.sif bash -c "source /software/scripts/source-dep.sh && cd /workdir && YOUR_COMMAND_1 && YOUR_COMMAND_2 && etc" &> singularity.log
```

run scripts:
```
singularity exec --bind $WORKDIR:/workdir,$SOFTWARE/:/software $IMAGE/STIR.sif bash -c "source /software/scripts/source-dep.sh && cd /workdir && YOUR_SCRIPTS.sh" &> singularity.log
```
NOTE: WORKDIR can be which ever directory you like e.g. "./" which is current dir.