#' Order by colnames
#' Description: Order maxtrix x by matrix y's columns
#' @param x data frame X
#' @param y data frame Y
#'
#' @returns Data frame x where shared columns with y are ordered by data frame y
#' @export
bd_orderColNames <- function(x,y){
  x.t <- t(x)
  y.t <- t(y)
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(t(x.s))
}
