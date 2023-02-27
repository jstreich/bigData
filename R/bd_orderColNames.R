#' Order by colnames
#' Description: Order maxtrix x by matrix y's columns
bd_orderColNames <- function(x,y){
  x.t <- t(x)
  y.t <- t(y)
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(t(x.s))
}
#' @export
