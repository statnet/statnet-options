if(!dir.exists("lib")) dir.create("lib")
install.packages("pkgA", lib="lib", repos = NULL, type = "source")
install.packages("pkgB", lib="lib", repos = NULL, type = "source")
install.packages("pkgC", lib="lib", repos = NULL, type = "source")
