% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bigDataFunctions.R
\name{bd_colSpec}
\alias{bd_colSpec}
\title{Get Specific Ranges of Columns
Description: This function loads data from file, but allows the user to call specific columns of data and skipping others. The cols variable is input between quotes. Dashes between numbers indicates ranges, single values are specific columns, separate each type with a comma, all between quotes. Example: cols = "1-6,8,12,14,19-65,85-102", returns Columns 1 through 6, col 8, col 12, col 14, columns 19 through 85 through 102.}
\usage{
bd_colSpec(x, colnms, sep, cols)
}
\description{
Get Specific Ranges of Columns
Description: This function loads data from file, but allows the user to call specific columns of data and skipping others. The cols variable is input between quotes. Dashes between numbers indicates ranges, single values are specific columns, separate each type with a comma, all between quotes. Example: cols = "1-6,8,12,14,19-65,85-102", returns Columns 1 through 6, col 8, col 12, col 14, columns 19 through 85 through 102.
}
