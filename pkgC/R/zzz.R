#' @export sctrl
sctrl <- pkgA::sctrl

.onLoad <- function(libame, pkgname){
  pkgA::update_sctrl(pkgname, alist(C1=5, C2=6), update_my_sctrl)
}

update_my_sctrl <- function(){
  unlockBinding("sctrl", environment(update_my_sctrl))
  sctrl <<- pkgA::sctrl
  lockBinding("sctrl", environment(update_my_sctrl))
}

