#' Convert character values to numeric values
#' Description: This will take a matrix with values encoded as "characters" and return them as numeric, if any.
<<<<<<< HEAD
=======
#'
#' @param x converts a variable 2D matrix/array into numeric values sometimes changed by file encoding
#'
#' @returns a 2D array as an all numeric data set. Ideal for changing encoding from data of multiple file encoding types.
#'
#' @export
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
bd_matrixNumeric <- function(x){
  r.nms <- rownames(x)
  c.nms <- colnames(x)
  for(i in 1:nrow(x)){
    x.i <- as.numeric(as.character(as.matrix(x[i,])))
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
