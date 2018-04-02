#' Reads and returns an OSC header without reading the whole file.
#' 
#' Opens the file and reads the first line.  If it started with `#`, read the
#' two first lines.  If they both start with `#`, read the three first lines,
#' and so on until a line that does not start with `#` is found.
#' 
#' @param file Path to the OSCTable to read.
#' 
#' @return Returns the header of the OSCTable, including the line indicating
#' the column names, which is the first one to not start with `#`.
#' 
#' @author Charles Plessy
#' 
#' The head of the file is read again and again, with one more line each time,
#' until the first character of the last line is not a comment character `#`
#' anymore.  There must be a more efficient way.
#' 
#' @seealso [`read.osc`], [`fread.osc`]

read.oscheader <- function (file) {

# Inspect the metadata
#filehandle <- file(file)
#open(filehandle)
#metadata         <- readLines(filehandle, n=1)
#metadata.name    <- gsub("##(.+) +?= +?(.+)", "\\1", metadata, perl=TRUE)
#metadata.content <- gsub("##(.+) +?= +?(.+)", "\\2", metadata, perl=TRUE)
#close(filehandle)
#return(x)

n <- 1
oscheader <- '#'

while (substr(oscheader[n] ,1 ,1) == '#') {
  n <- n + 1
  oscheader <- readLines(file, n=n)
}

return(oscheader)
}
