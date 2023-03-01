#' List of Functions
#'
#' Intersection Name Match- Name-based Cropping
#' Description: crop matrix x by matching rownames in matrix y
bd_nameMatch <- function(x, y){
  n.m <- match(rownames(x), rownames(y))
  n.b <- cbind(n.m, x)
  n.c <- n.b[complete.cases(n.b[,1]), ]
  n.c <- n.c[,2:ncol(n.c)]
  return(n.c)
}
