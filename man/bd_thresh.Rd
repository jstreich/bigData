% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bigDataFunctions.R
\name{bd_thresh}
\alias{bd_thresh}
\title{Read in values smaller, smaller-equal, exactly, greater-equal, greater than in specific column
Description: This function reads in a file, but only loads specific rows of data based on minimum, exact, or maximum thresholds. This is useful if a file has many rows, but a specific column of importance, like if column seven has p-values you can only load rows where column seven is less than 0.2. Or other data types where specific categorical values, names must match, Or greater than some specific threshold, like temperature minimums in a list of measurements.}
\usage{
bd_thresh(x, column, colnms, rownms, threshold, sep, method)
}
\description{
Read in values smaller, smaller-equal, exactly, greater-equal, greater than in specific column
Description: This function reads in a file, but only loads specific rows of data based on minimum, exact, or maximum thresholds. This is useful if a file has many rows, but a specific column of importance, like if column seven has p-values you can only load rows where column seven is less than 0.2. Or other data types where specific categorical values, names must match, Or greater than some specific threshold, like temperature minimums in a list of measurements.
}
