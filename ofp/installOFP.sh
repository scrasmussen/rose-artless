#!/usr/bin/env bash

# Written by Soren Rasmussen
# University of Cranfield
# s.rasmussen@cranfield.ac.uk
# 2019

function run() {
    echo $@
    eval $@
}

JAR=antlr-3.5.2-complete.jar
JARURL=http://www.antlr3.org/download/${JAR}
OFPDIR=ofp-0.8.5
OFPZIP=${OFPDIR}.zip
OFPURL=https://github.com/OpenFortranProject/open-fortran-parser/archive/master.zip

# PREFIX is the import variable. Defines where to install files
# Currently user needs PREFIX=path/to/install manually here in this script
PREFIX=$HOME/local/ofp

all=true
for key in "$@"; do
    case $key in
        # TO DO: help section
        -h|--help)
	    echo "--clean"
	    echo "--clean-dir"
	    echo "-d, --download"
	    echo "-i, --install"
            echo "-h, --help", $key
	    echo "--prefix=/install/dir"
	    echo "-u,--unzip"
	    exit 1
            ;;
	--clean)
	    clean=true
	    all=false
	    ;;
	--clean-dir)
	    clean_dir=true
	    all=false
	    ;;
	-d|--download)
	    download=true
	    all=false
	    ;;
	-i|--install)
	    install=true
	    all=false
	    ;;
        --prefix=*)
            PREFIX="${key#*=}"
            ;;
	-u|--unzip)
	    unzip=true
	    all=false
	    ;;
	*)
	    echo "INVALID COMMAND LINE ARGUMENT: $key"
	    exit 1
    esac
    shift
done

if [ "$all" = true ] ; then
    download=true
    install=true
    unzip=true
fi

if [ "$download" = true ] ; then
    # download files if they aren't in current directory
    if [ ! -f ${OFPZIP} ] ; then
	run "wget ${OFPURL} -O ${OFPZIP}"
    fi
    if [ ! -f ${JAR} ] ; then
	run "wget ${JARURL}"
    fi

fi

# unzip files if they aren't there
if [ "$unzip" = true ] ; then
    if [ ! -d ${OFPDIR} ] ; then
	run "unzip -q ${OFPZIP}"
	run "mv open-fortran-parser-master ${OFPDIR}"
    fi
fi

# install files
if [ "$install" = true ] ; then
    # mv JAR to proper place
    run "mkdir -p ${PREFIX}"
    cp ${JAR} ${PREFIX}

    # install ofp
    run "cd ${OFPDIR}"
    run "./configure --prefix=${PREFIX}/${OFPDIR} --with-antlr=${PREFIX}/${JAR}"
    run "make"
    run "make install"
    cd ..
    echo ; echo "---------------OFP INSTALLED---------------" ; echo
fi

if [ "$clean_dir" = true ] ; then
    run "rm -rf ${OFPDIR}"
fi
if [ "$clean" = true ] ; then
    run "rm -rf ${OFPDIR}"
    run "rm -f ${JAR} ${OFPZIP}"
fi

exit 1
