FC=$(ROSE_BLD)/exampleTranslators/defaultTranslator/defaultTranslator
FFLAGS=-rose:experimental_fortran_frontend
FILE=do_0.f90

all: build

build:
	$(FC) $(FILE) $(FFLAGS)
pp:
	pp-aterm -i $(FILE).aterm
p: build
	cat rose_$(FILE)

clean:
	rm -f *~ a.out *.o
	rm -f rose_* *.aterm
