FC=$(ROSE_BLD)/exampleTranslators/defaultTranslator/defaultTranslator
build_dir=$(ROSE_BLD)/tools/checkFortranInterfaces
tool=$(build_dir)/checkFortranInterfaces
FFLAGS=-rose:experimental_fortran_frontend
FILE=do_0.f90

all: build

build: fc
	$(tool) $(FILE)

exp: fc
	$(FC) $(FILE) $(FFLAGS)

fc:
	make -C $(build_dir)
pp:
	pp-aterm -i $(FILE).aterm
p: build
	cat rose_$(FILE)

clean:
	rm -f *~ a.out *.o
	rm -f rose_* *.aterm
