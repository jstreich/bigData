#' Convert numeric values to vector values
<<<<<<< HEAD
#' Description: This function returns x as vector encoded strings row-wise
=======
#'
#' Description: This function returns x as vector encoded strings row-wise
#' @param x converts a variable 2D matrix/array into vector encoding values.
#'
#' @returns a 2D array as an all vector data set.
#'
#' @export
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
bd_matrixVector <- function(x){
  r.nms <- rownames(x)
  c.nms <- colnames(x)
  for(i in 1:nrow(x)){
    x.i <- as.vector(as.character(as.matrix(x[i,])))
    if(i == 1){
      x.i.p <- x.i
    }
    else{
      x.i.p <- rbind(x.i.p, x.i)
    }
  }
  rownames(x.i.p) <- r.nms
  colnames(x.i.p) <- c.nms
  return(x.i.p)
}
<<<<<<< HEAD

=======
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
