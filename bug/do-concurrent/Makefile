FC=$(ROSE_BLD)/exampleTranslators/defaultTranslator/defaultTranslator
FFLAGS=-rose:experimental_fortran_frontend
FILE=do_concurrent_0.f90

all: build buildexp

build:
	@echo "------------- TEST: regular Fortran frontend  -------------"
	$(FC) $(FILE)

buildexp:
	@echo "------------- TEST: experimental Fortran frontend -------------"
	$(FC) $(FILE) $(FFLAGS)

pp:
	pp-aterm -i $(FILE).aterm
p: build
	cat rose_$(FILE)

clean:
	rm -f *~ a.out *.o
	rm -f rose_* *.aterm
