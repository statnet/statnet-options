lib=lib

install:
	mkdir -p $(lib)
	R CMD INSTALL -l $(lib) pkgA
	R CMD INSTALL -l $(lib) pkgB
	R CMD INSTALL -l $(lib) pkgC

R:
	R_LIBS=$(lib) R
