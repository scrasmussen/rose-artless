#!/usr/bin/env bash

# Written by Soren Rasmussen
# University of Cranfield
# s.rasmussen@cranfield.ac.uk
# 2019

function run() {
    echo $@
    eval $@
}

ANTLRDIR=antlr-3.5.2
ANTLRZIP=${ANTLRDIR}.zip
ANTLRURL=https://github.com/antlr/antlr3/archive/3.5.2.zip
JAR=antlr-3.5.2-runtime.jar
JAR=antlr-3.5.2-complete.jar
JARURL=http://www.antlr3.org/download/${JAR}
OFPDIR=ofp-0.8.5
OFPZIP=${OFPDIR}.zip
OFPURL=https://github.com/OpenFortranProject/open-fortran-parser/archive/master.zip

# PREFIX is the import variable. Defines where to install files
# Currently user needs PREFIX=path/to/install manually here in this script
ANTLRPREFIX=~/local/antlr
PREFIX=$HOME/local

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
    # if [ ! -f ${ANTLRZIP} ] ; then
    # 	run "wget ${ANTLRURL} -O ${ANTLRZIP}"
    # fi
    if [ ! -f ${OFPZIP} ] ; then
	run "wget ${OFPURL} -O ${OFPZIP}"
    fi
    if [ ! -f ${JAR} ] ; then
	run "wget ${JARURL}"
    fi

fi

# unzip files if they aren't there
if [ "$unzip" = true ] ; then
    # if [ ! -d ${ANTLRDIR} ] ; then
    # 	run "unzip -q ${ANTLRZIP}"
    # 	run "mv antlr3-3.5.2 ${ANTLRDIR}"
    # fi
    if [ ! -d ${OFPDIR} ] ; then
	run "unzip -q ${OFPZIP}"
	run "mv open-fortran-parser-master ${OFPDIR}"
    fi
fi

# install files
if [ "$install" = true ] ; then
    # install antlr
    install_antlr=false
    if [ "$install_antlr" = true ] ; then
	run "cd ${ATERMDIR}/aterm"
	CFLAGS+=-DAT_64BIT
	run 'sed -i "1s/^/CFLAGS=-DAT_64BIT \n/" aterm.pc.in'

	run "export CFLAGS=$CFLAGS"
	run "./configure --prefix=${PREFIX}/aterm CFLAGS=$CFLAGS"
	run "make"
	run "make install"
	run "mkdir -p ${PREFIX}/aterm/lib/pkgconfig"
	run "cp aterm.pc ${PREFIX}/aterm/lib/pkgconfig"
	run "cd ../.."
	echo ; echo "---------------ATERM INSTALLED---------------" ; echo
    fi

    # install ofp
    install_ofp=true
    if [ "$install_ofp" = true ] ; then
	cp ${JAR} ${PREFIX}
	run "cd ${OFPDIR}"
	run "./configure --prefix=${PREFIX}/${OFPDIR} --with-antlr=${PREFIX}/${JAR}"
	run "make"
	run "make install"
	cd ..
	echo ; echo "---------------OFP INSTALLED---------------" ; echo
    fi
fi

if [ "$clean_dir" = true ] ; then
    run "rm -rf ${ANTLRDIR} ${OFPDIR}"
fi
if [ "$clean" = true ] ; then
    run "rm -rf ${ANTLRDIR} ${OFPDIR}"
    run "rm -f ${ANTLRZIP} ${OFPZIP}"
fi

exit 1
