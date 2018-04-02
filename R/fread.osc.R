#' Read and return an OSC table.
#' 
#' Reads an OSC table from a file and returns a data table.
#' 
#' This function is still experimental and backwards compatibility may be broken
#' without much notice.
#' 
#' @param file File name of the OSC table.  If its name finishes with `gz`, it
#'        will be uncompressed with the `zcat` command.
#'        
#' @param dropIdCoords `id`, `chrom`, `start.0base`, `end` and `strand` columns.
#' 
#' @param replaceIdCoords Replaces the contents of the `id` column with a
#'        browser-friendly genomic coordinate, and drops the `chrom`,
#'        `start.0base`, `end` and `strand` columns.
#'        
#' @param drop.norm  Drops the normalised expression values (any column whose
#'        name contains `norm.`).
#' 
#' When IDs can be reconstituted from the OSC header and the feature coordinates,
#' the data table can be made lighter by dropping the "id" column with the
#' `replaceIdCoords` option.
#' 
#' @return Returns a data table.  With OSCTables output by the `level1` program,
#' the combiation `drop.norm` and `dropIdCoords` will produce a data table that
#' only contains numeric values.
#' 
#' @author Charles Plessy
#' 
#' @seealso [`data.table`], [`read.osc`]

fread.osc <- function (file, dropIdCoords=FALSE, replaceIdCoords=TRUE, drop.norm=TRUE) {

oscHeaderLength <- length(read.oscheader(file)) -1

if (grepl('.gz$', file))
  file <- paste('zcat <', file)

osctable <- fread( file
                 , skip = oscHeaderLength )

if (drop.norm) {
  keep <- !grepl("norm\\.", colnames(osctable))
  osctable <- osctable[, keep, with=FALSE]
}

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
