fread.osc <- function (file, dropIdCoords=FALSE, replaceIdCoords=TRUE, drop.norm=TRUE) {

oscHeaderLength <- length(read.oscheader(file)) -1

if (grepl('.gz$', file))
  file <- paste('zcat <', file)

osctable <- fread( file
                 , skip = oscHeaderLength )

if (drop.norm)
  osctable <- osctable[, -grep("norm\\.", colnames(osctable)), with=FALSE]

coords <- c("chrom", "start.0base", "end", "strand", "pos")
idCoords <- c("id", coords)

if (dropIdCoords) {
  osctable <- osctable[, setdiff(colnames(osctable), idCoords), with=FALSE] 
  replaceIdCoords <- FALSE
}

if (replaceIdCoords) {
  osctable$id <- ChromosomeCoordinates(osctable[, idCoords, with=FALSE])
  osctable <- osctable[, setdiff(colnames(osctable), coords), with=FALSE]
}

return(osctable)
}
