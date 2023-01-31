
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
parsers, but updating C++ libraries across operating systems. I created this
list of functions to do my large data work at ORNL, but now it's being converted
into a package to manage data using common commandline functions and tools.
This is also my first R package release, so it's a work and learning process.

About half of the tools use commandline bash, awk, head-cut, etc, processes to 
simplify the installation process and lessen the backend installation 
requirements. Much of the ongoing development of this package's backend will be 
pushing the limits of command line data processing. 

The second half of tools are within R functions that can work much the same as
other packages such as dplyr, etc. However, I find these functions much more
user friendly, taking a one-liner long command, and making it much simpler in
function form.

The easiest and preferred way to use this package is to create a directory or
R project to operate in. Like the Raster package it uses lots of temporary files
to process data. Unlike many temporary file packages, sometimes temp files may 
not get deleted between sessions and slowly fills your hard drive. Within set 
directories/projects means you can see and delete any residual temporary files,
and/or archive them if needed later.


################################################################################
# Caveats
################################################################################

Current form is Unix/Linux only. A separate Windows version is under development



