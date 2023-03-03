#' Read in values smaller, smaller-equal, exactly, greater-equal, greater than in specific column
#' Description: This function reads in a file, but only loads specific rows of data based on minimum, exact, or maximum thresholds. This is useful if a file has many rows, but a specific column of importance, like if column seven has p-values you can only load rows where column seven is less than 0.2. Or other data types where specific categorical values, names must match, Or greater than some specific threshold, like temperature minimums in a list of measurements.
#'
#' @param x A/file/to/read/in/from/a/directory/filename.txt
#' @param colnms if you want to read in column names colnms = T/F or TRUE/FALSE
#' @param rownms if you want to read in row names colnms = T/F or TRUE/FALSE
#' @param threshold A numeric value to set filtering upon before a file is actually loaded into memory.
#' @param sep Set for delimter of the file you're reading in from, sep = "[delimiter]"
#' @param method The type of thresholding filter method: "smaller" = max value, "smaller-equal" = min equal value, "greater-equal" = max or equal value, "greater" = minimum value, "exactly" = exact values (ideal for loading categorical constraints), 
#'
#' @returns A filtered version of a file based on specified column and column filtering conditions during data loading of a large file.
#'
#' @export
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
