#' Simplified write file function
#' Description: This function will write a table of data to file using space delimitation without quotes
#'
#' @param x data frame to output to file
#' @param y data frame check rowname order with
#' @param name = "[your_desired_outut_name.ext]"
#' @param rownms output rownames T/F TRUE/FALSE
#' @param colnms output colnames T/F TRUE/FALSE
#'
#' @returns Returns data frame x after ordering shared rows with data frame y
#'
#' @export
bd_spacewrite <- function(x, name, rownms, colnms){
  write.table(x, nm, row.names = rownms, col.names = colnms, quote = F, sep = " ")
}

