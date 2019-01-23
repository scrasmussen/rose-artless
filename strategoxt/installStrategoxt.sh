#!/usr/bin/env bash

# Written by Soren Rasmussen
# University of Oregon
# 2016

function run() {
    echo $@
    eval $@
}

STRATEGOXTDIR=strategoxt-0.17
STRATEGOXTTAR=${STRATEGOXTDIR}.tar.gz
STRATEGOXTURL=http://ftp.strategoxt.org/pub/stratego/StrategoXT/strategoxt-0.17/${STRATEGOXTTAR}
ATERMDIR=aterm-3.0
ATERMTAR=${ATERMDIR}.tar.gz
ATERMURL=https://github.com/rasmussn/aterms/releases/download/v3.0/aterm-3.0.tar.gz
# Unmodified Aterm files that require 32 bit -m32 install
ATERMURLALT32_1=http://releases.strategoxt.org/strategoxt-0.17/aterm/aterm-2.5pre21238-26ra85lr/${ATERMTAR}
ATERMURLALT32_2=http://ftp.strategoxt.org/pub/stratego/sdf2/sdf2-bundle-2.3.3/sdf2-bundle-2.3.3.tar.gz
SDF2DIR=sdf2-bundle-2.4
SDF2TAR=${SDF2DIR}.tar.gz
SDF2URL=http://releases.strategoxt.org/strategoxt-0.17/sdf2-bundle/sdf2-bundle-2.4pre212034-37nm9z7p/${SDF2TAR}
SDF2URLALT=http://ftp.strategoxt.org/pub/stratego/sdf2/sdf2-bundle-2.3/sdf2-bundle-2.3.tar.gz

# PREFIX is the import variable. Defines where to install files
# Currently user needs PREFIX=path/to/install manually here in this script
PREFIX=~/opt
ATERMPREFIX=${PREFIX}/aterm
SDF2PREFIX=${PREFIX}/sdf2-bundle
STRATEGOXTPREFIX=${PREFIX}/strategoxt

# # Installing in 32 bit is important!
# CFLAGS="-m32"

all=true
for key in "$@"; do
    case $key in
        # TO DO: help section
        -h|--help)
	    echo "--prefix=/install/dir"
            echo "-h, --help", $key
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
	-u|--untar)
	    untar=true
	    all=false
	    ;;
	*)
	    echo "INVALID COMMAND LINE ARGUMENT: $key"
	    exit 1
        # TO DO
        # cflags=*)
        #    cflags = "-m 32" + "USER STRING"
        #    ;;
    esac
    shift
done

if [ "$all" = true ] ; then
    download=true
    install=true
    untar=true
fi

if [ "$download" = true ] ; then
    # download files if they aren't in current directory
    if [ ! -f ${STRATEGOXTTAR} ] ; then
	wget ${STRATEGOXTURL}
    fi
    if [ ! -f ${ATERMTAR} ] ; then
	wget ${ATERMURL}
    fi
    if [ ! -f ${SDF2TAR} ] ; then
	wget ${SDF2URL}
    fi
fi

# untar files if they aren't there
if [ "$untar" = true ] ; then
    if [ ! -d ${STRATEGOXTDIR} ] ; then
	run "tar zxf ${STRATEGOXTTAR}"
    fi
    if [ ! -d ${ATERMDIR} ] ; then
	run "tar zxf ${ATERMTAR}"
    fi
    if [ ! -d ${SDF2DIR} ] ; then
	run "tar zxf ${SDF2TAR}"
    fi
fi

# install files
if [ "$install" = true ] ; then
    # install aterm
    install_aterm=true
    if [ "$install_aterm" = true ] ; then
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

    # install sdf2-bundle
    install_sdf2=true
    if [ "$install_sdf2" = true ] ; then
	run "cd ${SDF2DIR}"
	run "./configure --prefix=${PREFIX}/sdf2-bundle --with-aterm=${PREFIX}/aterm CFLAGS=$CFLAGS"
	run "make"
	run "make install"
	cd ..
	echo ; echo "---------------SDF2 INSTALLED---------------" ; echo
    fi

    # install strategoxt
    install_stratego=true
    if [ "$install_stratego" = true ] ; then
	run "cd ${STRATEGOXTDIR}"
	run "./configure --prefix=${PREFIX}/strategoxt --with-aterm=${PREFIX}/aterm --with-sdf=${PREFIX}/sdf2-bundle CFLAGS=$CFLAGS"
	run "make"
	run "make install"
	cd ..
	echo ; echo "---------------STRATEGOXT INSTALLED---------------" ; echo
    fi
fi

if [ "$clean_dir" = true ] ; then
    run "rm -rf ${ATERMDIR} ${SDF2DIR} ${STRATEGOXTDIR}"
fi
if [ "$clean" = true ] ; then
    run "rm -rf ${ATERMDIR} ${SDF2DIR} ${STRATEGOXTDIR}"
    run "rm ${ATERMTAR} ${SDF2TAR} ${STRATEGOXTTAR}"
fi

exit 1
