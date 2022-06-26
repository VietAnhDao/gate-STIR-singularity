export Gate_Version=v9.2

export ITK_Version=master

export STIR_Version=master
case "$Gate_Version" in

v8.1)
  export ROOT_Version=v6-19-02
# export ROOT_Version=v6-14-02 -> This version doesn't compile
  export CLHEP_Version=2.3.3.2
  export Geant4_Version=v10.4.2

  export USE_RTK=OFF
  ;;

v8.2)
  export ROOT_Version=v6-19-02
  # export ROOT_Version=v6-14-06 -> This version doesn't compile
  export CLHEP_Version=2.4.1.0
  export Geant4_Version=v10.5.1
  ;;
  
v9.0)
  export ROOT_Version=v6-19-02
  export CLHEP_Version=2.4.1.3
  export Geant4_Version=v10.6.1
  ;;

v9.1)
  export ROOT_Version=v6-19-02
  export CLHEP_Version=2.4.4.1
  export Geant4_Version=v10.7.1
  ;;

v9.2)
  export ROOT_Version=v6-24-06
  export CLHEP_Version=2.4.5.1
  export Geant4_Version=v11.0.0
  #export ITK_Version=v5.2.0
  ;;

*) 
  echo "Incorrect Gate_Version."
  ;;

esac

