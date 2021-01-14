#' @export sctrl
sctrl <- pkgA::sctrl

#' @export
control.CF1 <- function(C1=5, C2=6){}

.onLoad <- function(libame, pkgname){
  eval(pkgA::COLLATE_ALL_MY_CONTROLS_EXPR)
}

eval(pkgA::UPDATE_MY_SCTRL_EXPR)
