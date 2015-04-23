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
