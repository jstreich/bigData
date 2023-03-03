#' Get Specific Ranges of Columns
#' Description: This function loads data from file, but allows the user to call specific columns of data and skipping others. The cols variable is input between quotes. Dashes between numbers indicates ranges, single values are specific columns, separate each type with a comma, all between quotes. Example: cols = "1-6,8,12,14,19-65,85-102", returns Columns 1 through 6, col 8, col 12, col 14, columns 19 through 85 through 102.
<<<<<<< HEAD
=======
#'
#' @param x a filename possibly with directory, example "/dir/to/file/filename.txt"
#' @param colnms column names T/F
#' @param rownms rown names T/F
#' @param sep set the delimter sep = "[delimiter]"
#' @param cols a range of columns in a variable, example variable: set.cols <- c(1:20,45:235,545:997)
#'
#' @returns Reads in a file with specified column ranges as variables
#'
#' @export
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
bd_colSpec <- function(x, colnms, sep, cols){
  system(paste("grep '/bin/bash' ", x, "| cut -d'", sep, "' -f", cols, " ", x, " > bd_colRange.jcs", sep = ""))
  output <- read.delim("bd_colRange.jcs", header = colnms, sep = sep)
  system("rm bd_colRange.jcs")
  return(output)
}
<<<<<<< HEAD

=======
>>>>>>> 599d12203e94021ff53ec25ee1eb88ccfc238bdc
