read.osc <- function (file, ...) {

osctable <- read.table(file, header=TRUE, ...)

# Inspect the metadata
#filehandle <- file(file)
#open(filehandle)
#metadata         <- readLines(filehandle, n=1)
#metadata.name    <- gsub("##(.+) +?= +?(.+)", "\\1", metadata, perl=TRUE)
#metadata.content <- gsub("##(.+) +?= +?(.+)", "\\2", metadata, perl=TRUE)
#close(filehandle)
#return(x)

LocationToName <- function(osctable) {

  if ( osc.namespace(osctable) != "genomic_coordinate")
    stop("This OSC table dos not have genomic coordinates")
  
  with(osctable,
    paste(chrom, ":", start.0base, "-", end, strand ,sep='')
  )
}

rownames(osctable) <- LocationToName(osctable)
return(osctable)
}