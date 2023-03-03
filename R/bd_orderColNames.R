#' Order by colnames
#' Description: Order maxtrix x by matrix y's columns
<<<<<<< HEAD
=======
#' @param x data frame X
#' @param y data frame Y
#'
#' @returns Data frame x where shared columns with y are ordered by data frame y
#' @export
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
bd_orderColNames <- function(x,y){
  x.t <- t(x)
  y.t <- t(y)
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(t(x.s))
}
