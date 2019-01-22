#!/usr/bin/env bash

# Written by Soren Rasmussen
# University of Oregon
# 2016

STRATEGOXTDIR=strategoxt-0.17
STRATEGOXTTAR=${STRATEGOXTDIR}.tar.gz
STRATEGOXTURL=http://ftp.strategoxt.org/pub/stratego/StrategoXT/strategoxt-0.17/${STRATEGOXTTAR}
ATERMDIR=aterm-2.5
ATERMTAR=${ATERMDIR}.tar.gz
ATERMURL=http://releases.strategoxt.org/strategoxt-0.17/aterm/aterm-2.5pre21238-26ra85lr/${ATERMTAR}
ATERMURLALT=http://ftp.strategoxt.org/pub/stratego/sdf2/sdf2-bundle-2.3.3/sdf2-bundle-2.3.3.tar.gz
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

# Installing in 32 bit is important!
CFLAGS="-m32"
for key in "$@"; do
    case $key in
        # TO DO: help section
        -h|--help)
	    echo "--prefix=/install/dir"
            echo "-h, --help", $key
            ;;
        --prefix=*)
            PREFIX="${key#*=}"
            ;;
        # TO DO
        # cflags=*)
        #    cflags = "-m 32" + "USER STRING"
        #    ;;
    esac
    shift
done

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

# untar files if they aren't there
if [ ! -d ${STRATEGOXTDIR} ] ; then
    cmd="tar zxf ${STRATEGOXTTAR}"
    echo $cmd
    eval $cmd
fi
if [ ! -d ${ATERMDIR} ] ; then
    cmd="tar zxf ${ATERMTAR}"
    echo $cmd
    eval $cmd
fi
if [ ! -d ${SDF2DIR} ] ; then
    cmd="tar zxf ${SDF2TAR}"
    echo $cmd
    eval $cmd
fi

# install aterm
install_aterm=false
if [ "$install_aterm" = true ] ; then
    cd ${ATERMDIR}
    cmd="./configure --prefix=${PREFIX}/aterm CFLAGS=$CFLAGS"
    echo $cmd
    eval $cmd
    echo "make"
    make
    echo "make install"
    make install
    echo ; echo "---------------ATERM INSTALLED---------------" ; echo
    cd ..
fi


# install sdf2-bundle
install_sdf2=false
if [ "$install_sdf2" = true ] ; then
    cd ${SDF2DIR}
    cmd="./configure --prefix=${PREFIX}/sdf2-bundle --with-aterm=${PREFIX}/aterm CFLAGS=$CFLAGS"
    echo $cmd
    eval $cmd
    echo "make"
    make
    echo "make install"
    make install
    echo ; echo "---------------SDF2 INSTALLED---------------" ; echo
    cd ..
fi

# install strategoxt
install_stratego=true
if [ "$install_stratego" = true ] ; then
    cd ${STRATEGOXTDIR}
    cmd="./configure --prefix=${PREFIX}/strategoxt --with-aterm=${PREFIX}/aterm --with-sdf=${PREFIX}/sdf2-bundle CFLAGS=$CFLAGS"
    echo $cmd
    eval $cmd
    echo "make"
    make
    echo "make install"
    make install
    echo ; echo "---------------STRATEGOXT INSTALLED---------------" ; echo
    cd ..
fi

exit 1
