#' Get range of columns
#' Description: Like bd_subsetRow, this function will get a random subset of columns to assess data structure and properties. Ideal if samples are encoded column wise.
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
#' @export
