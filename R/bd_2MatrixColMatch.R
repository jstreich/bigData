#' Get x from y based on two specific columns
#' Description: If two matrices share data information, especially categorical, then matrix x can be cropped down using a specific x-column by shared data in matrix y's y-column.
bd_2MatrixColMatch <- function(x, xc, y, yc){
  n.m <- match(x[,xc], y[,yc])
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}
#' @export