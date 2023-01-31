
###  ***** This is a beta version, and is still under construction ***** ###


################################################################################
# bigData
################################################################################

################################################################################
# About
################################################################################

This package is designed to simplify data loading and processing in places
where other data processing types are memory intensive. In many cases, but not
always command line tools can be just as fast (or nearly) as many C++ data 
parsers, but updating C++ libraries across operating systems can fail, even 
temporarily at times. I created this list of functions to do my large data work 
at ORNL, but now it's being converted into a package to manage data using common 
commandline functions and tools. This is also my first R package release, so 
it's a work and learning process.

About half of the tools use commandline bash, awk, head-cut, etc, processes to 
simplify installation and lessen the backend installation requirements. Also,
exceptionally large files or files larger than memory can be parsed and filtered
iteratively using temporary files. Many common data preview or profiling 
techniques are replicated with R functions and command line queries, an example
would be the summary() function, but without actually loading the file to memory.
Much of the ongoing development of this package's backend will be parallelized,
likely with GNU parallel, rather than internal parallelization to prevent any
non-concurence processes, and perfect file/memory object recapitulation.

The second half of tools are within R functions that can work much the same as
other packages such as dplyr, etc. However, I find these functions much more
user friendly, taking a one-liner long command, and making it much simpler in
function form.

The easiest and preferred way to use this package is to create a directory or
R project to operate in. Like the Raster package it uses lots of temporary files
to process data. Unlike many temporary file packages, sometimes temp files may 
not get deleted between sessions and slowly fills your hard drive, or require
specific temporary file removal commands [which is just good habit]. Within set 
directories/projects means you can see and delete any residual temporary files,
and/or archive them if needed later.


################################################################################
# Caveats
################################################################################

Current form is Unix/Linux only. A separate Windows version is under development



