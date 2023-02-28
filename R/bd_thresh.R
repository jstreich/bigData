#' Read in values smaller, smaller-equal, exactly, greater-equal, greater than in specific column
#' Description: This function reads in a file, but only loads specific rows of data based on minimum, exact, or maximum thresholds. This is useful if a file has many rows, but a specific column of importance, like if column seven has p-values you can only load rows where column seven is less than 0.2. Or other data types where specific categorical values, names must match, Or greater than some specific threshold, like temperature minimums in a list of measurements.
bd_thresh <- function(x, column, colnms, rownms, threshold, sep, method){
  if(method == "smaller"){
    system(paste("awk '{ if ($",column, " < ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "smaller-equal"){
    system(paste("awk '{ if ($",column, " <= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "exactly"){
    system(paste("awk '{ if ($",column, " == ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "greater-equal"){
    system(paste("awk '{ if ($",column, " >= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(method == "greater"){
    system(paste("awk '{ if ($",column, " >= ", threshold, ") { print } }' ", x, " > bd_thresh.jcs", sep = ""))
    output <- read.delim("bd_thresh.jcs", header = colnms, sep = sep)
    system("rm bd_thresh.jcs")
  }
  if(rownms == "T"){
    rownames(output) <- output[,1]
    output <- output[,-1]
  }
  return(output)
}

