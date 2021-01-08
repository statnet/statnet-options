#' @export
sctrl <- function(...){
  control <- list(...)
  formal.args<-formals(sys.function())
  formal.args[["..."]] <- NULL
  for(arg in names(formal.args))
    if(!do.call(missing, list(arg)))
      control[arg]<-list(get(arg))
  control
}

argnames <- local({
  cache <- list()

  delpkg <- function(pkgname,pkgpath){
    cache[[pkgname]] <<- NULL
    update_sctrl()
  }

  function(pkg, arglist){
    if(missing(pkg)) cache
    else{
      cache[[pkg]] <<- arglist
      setHook(packageEvent(pkg, "onUnload"), delpkg)
    }
  }
})


callbacks <- local({
  cache <- list()

  delpkg <- function(pkgname,pkgpath){
    cache[[pkgname]] <<- NULL
  }

  function(pkg, callback){
    if(missing(pkg)) cache
    else{
      cache[[pkg]] <<- callback
      setHook(packageEvent(pkg, "onUnload"), delpkg)
    }
  }
})

  

#' @export
update_sctrl <- function(myname, arglist=alist(), callback=NULL){
  ## pkgAenv <- as.environment("package:pkgA")
  # Make a copy and replace the arglist.
  tmp <- sctrl

  if(!missing(myname)){
    argnames(myname, arglist)
    if(!is.null(callback)) callbacks(myname, callback)
  }

  arglist <- c(list(formals(tmp)[1]), argnames())
  argnames <- unlist(lapply(arglist, names))
  arglist <- do.call(c, arglist)
  names(arglist) <- argnames
  formals(tmp) <- arglist

  # Replace the original function with the copy.
  unlockBinding("sctrl", environment(sctrl))
  sctrl <<- tmp
  lockBinding("sctrl", environment(sctrl))

  for(callback in callbacks()) callback()

  invisible()
}
