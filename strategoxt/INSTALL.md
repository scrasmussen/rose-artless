Three packages are needed to configure ROSE with the Jovial frontend:
the 64-bit ATerm library; the SDF2 bundle; and the StrategoXT library.

As I recollect, I slightly modified releases of the latter two to
configure and build correctly on 64-bit architectures at LLNL. It is
recommended that these modified versions be used. Copies can be found in,

  /nfs/casc/overture/ROSE/opt/rhel7/x86_64/stratego/


Build and install instructions
------------------------------

   1. The 64-bit ATerm library

      The source is at https://github.com/rasmussn/aterms/releases/tag/v3.0
      This library must be built as 64 bit because it is linked with the ROSE library.

      a. Download and uncompress aterm-3.0.tar.gz
      b. cd to aterm-3.0/aterm
      -  export CFLAGS=-DAT_64BIT
      c. ./configure --prefix=path_to_aterm_install
      d. make
      e. make install
      d. mkdir path_to_aterm_install/lib/pkgconfig
      f. cp aterm.pc path_to_aterm_install/lib/pkgconfig/.
      - make sure CFLAGS=-DAT_64BIT is set in aterm.pc

   2. The sdf2-bundle-2.4.1

      The original source for sdf2-bundle-2.4 is at
         - http://strategoxt.org/Stratego/StrategoDownload/

      It is recommended that it be copied from
         - /nfs/casc/overture/ROSE/opt/rhel7/x86_64/stratego/sdf2-bundle-2.4.1.tar.gz

      a. Download/copy and uncompress sdf2-bundle-2.4.1.tar.gz
      b. cd sdf2-bundle-2.4.1
      c. ./configure --with-aterm=path_to_aterm_install --prefix=path_to_sdf2_install
      d. make
      e. make install

   3. strategoxt-0.17.1

      The original source for strategoxt-0.17 is at
         - http://strategoxt.org/Stratego/StrategoDownload/

      It is recommended that it be copied from
         - /nfs/casc/overture/ROSE/opt/rhel7/x86_64/stratego/strategoxt-0.17.1.tar.gz

      a. Download/copy and uncompress strategoxt-0.17.1.tar.gz
      b. cd strategoxt-0.17.1
      c. ./configure --with-aterm=path_to_aterm_install --with-sdf=path_to_sdf2_install --prefix=path_to_strategoxt_install
      d. make
      e. make install
