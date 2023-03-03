#' bd_colRange
#'
#' Get range of columns
#' Like bd_subsetRow, this function will get a random subset of columns to assess data structure and properties. Ideal if samples are encoded column wise.
#'
#' @param x Dataframe X
#' @param start Dataframe Start Column
#' @param end Dataframe End Column
#' @param colnms column names present T/F
#' @param sep sep = "" set delimiter
#' @param rownms rowumn names present T/F
#'
#' @returns Reads in a file's specific column range specified by the user.
#'
#' @export
bd_colRange <- function(x, start, end, colnms, sep, rownms){
  system(paste("cut -d'", sep, "' -f", start, "-", end, " ", x, "> bd_colRange.jcs", sep = ""))
  output <- read.delim("bd_colRange.jcs", header = colnms, sep = sep)
  system("rm bd_colRange.jcs")
  if(rownms == T){
    rownames(output) <- output[,1]
    output <- output[,2:ncol(output)]
  }
  return(output)
}
