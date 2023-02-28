#' Order x rows by y rows from two specific columns
#' Description: Like bd_2MatrixColMatch, this funciton takes two matrices, x and y, but orders an x-specific column by a y-specific column.
bd_orderByCol <- function(x, xc, y, yc){
  x.o <- match(x[,xc], y[,yc])
  x.s <- x[order(x.o), ]
  return(x.s)
}

