#' Order by Rownames
#' Description: Order matrix rownames by matrix y's rowname order
bd_orderRowNames <- function(x,y){
  x.o <- match(rownames(x), rownames(y))
  x.s <- x[order(x.o), ]
  return(x.s)
}
#' @export
