#' @export sctrl
sctrl <- pkgA::sctrl

#' @export
control.BF1 <- function(B1=3, B2=4, ...){}
#' @export
control.BF2 <- function(B3=13, B4=14){}

.onLoad <- function(libame, pkgname){
  pkgA::update_sctrl(pkgname, pkgA::collate_controls(control.BF1, control.BF2), update_my_sctrl)
}

update_my_sctrl <- function(){
  unlockBinding("sctrl", environment(update_my_sctrl))
  sctrl <<- pkgA::sctrl
  lockBinding("sctrl", environment(update_my_sctrl))
}
