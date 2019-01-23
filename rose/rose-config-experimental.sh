#!/bin/bash
## installed strategoxt toolchain in
#
#/nfs/casc/overture/ROSE/opt/rhel7/i386/stratego
#/nfs/casc/overture/ROSE/opt/rhel7/x86_64/stratego

# Intel Fortran
#source /nfs/apps/intel/16.0.210/compilers_and_libraries_2016.3.210/linux/bin/iccvars.sh intel64
#source /nfs/casc/overture/ROSE/opt/rhel7/x86_64/rose_environment.sh
#export ROSE_INFO=$HOME/ROSE/rose-info
#export BOOST_HOME=/nfs/casc/overture/ROSE/opt/rhel7/x86_64/boost/1_60_0/gcc/4.8.4
#export JAVA_HOME=/nfs/casc/overture/ROSE/opt/rhel6/x86_64/java/jdk/1.7.0_51
## these should go in /nfs/casc/overture/ROSE/opt/rhel7/x86_64/rose_environment.sh
#
# - but NOTE x86_64
#
stratego=$HOME/local/stratego
export ATERM_HOME=$stratego/aterm
export SDF2_HOME=$stratego/sdf2-bundle
export SXT_HOME=$stratego/strategoxt
export OFP_HOME=$HOME/local/ofp/ofp-0.8.5
export PATH=$ATERM_HOME/bin:$SDF2_HOME/bin:$SXT_HOME/bin:$PATH
#export PATH=$PATH:/nfs/casc/overture/ROSE/aterm_for_rose_bin
export LD_LIBRARY_PATH=$ATERM_HOME/lib:$SDF2_HOME/lib:$SXT_HOME/lib:$LD_LIBRARY_PATH
config="--enable-experimental_fortran_frontend \
--with-aterm=${ATERM_HOME} --with-stratego=${SXT_HOME}" # \
#--with-ofp-bin=${OFP_HOME}/bin"
## ONLY FOR Mac is -rpath needed
#
#FC=gfortran CC=gcc CXX=g++ LDFLAGS="-Xlinker -rpath ${JAVA_HOME}/jre/lib/amd64/server" "${ROSE_SRC}/configure" $config
#FC=gfortran CC=gcc CXX=g++ "$ROSE_SRC/configure" $config
#FC=gfortran CC=gcc CXX=g++ CXXFLAGS="-std=c++11" "$ROSE_SRC/configure" --with-CXX_DEBUG=-g --with-C_OPTIMIZE=-O0 --with-CXX_OPTIMIZE=-O0 $config
# export hack="--with-boost-regex=${BOOST_HOME}/lib/libboost_regex.so \              # -I${BOOST_HOME}/include/boost \


# -----------------------------------------------------------------------------#
## require boost and autoconf on nic's delphi cluster
# ml boost autoconf

export BOOST_HOME=$BOOST
export ROSE_SRC=$HOME/src/rose/rose-git
export ROSE_BLD=$HOME/src/ROSE/rose-012119-boost-1.61-src
export ROSE_INSTALL=$HOME/local/ROSE/trunk-012119-ofp-boost-1.61-java-1.7

config+=" --with-boost=${BOOST_HOME} \
--prefix=${ROSE_INSTALL} \
--enable-languages=c,c++,fortran \
--with-gfortran=gfortran \
--with-alternate-backend-fortran-compiler=gfortran "

# HACK="-I${BOOST_HOME}/lib "
HACK="--with-boost-regex=${BOOST_HOME}/lib "
HACK=""

mkdir -p $ROSE_BLD
cd $ROSE_BLD

echo "=START="
export RUN="FC=gfortran CC=gcc CXX=g++\
  ${ROSE_SRC}/configure\
   --with-CXX_DEBUG=-g\
   --with-C_OPTIMIZE=-O0\
   --with-CXX_OPTIMIZE=-O0\
   ${HACK}\
   ${config}"
echo "${RUN}"
eval "${RUN}"
