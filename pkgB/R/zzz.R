#' @export sctrl
sctrl <- pkgA::sctrl

.onLoad <- function(libame, pkgname){
  pkgA::update_sctrl(pkgname, alist(B1=3, B2=4), update_my_sctrl)
}

update_my_sctrl <- function(){
  unlockBinding("sctrl", environment(update_my_sctrl))
  sctrl <<- pkgA::sctrl
  lockBinding("sctrl", environment(update_my_sctrl))
}
