#' Read and return an OSC table.
#' 
#' Reads an OSC table from a file and returns a data frame.
#' 
#' @param file File name of the OSC table.
#' @param drop.id Deprecated, use `drop.coord` instead.  Drops the `id` column.
#' @param drop.coord  Drops the coordinate columns column (by keeping all
#'        columns that have `raw` or `norm` in their name.
#' @param drop.norm Drops the normalised expression values (any column whose
#'        name contains `norm.`).
#' @param simplify Text to be remove from column names.
#' @param \dots Other arguments are passed to [`read.table`].
#' 
#' When IDs can be reconstituted from the OSC header and the feature
#' coordinates, the data frame can be made lighter by dropping the `id` column
#' with `drop.id = TRUE`.
#' 
#' @author Charles Plessy

read.osc <- function ( file
                     , drop.id     = FALSE
                     , drop.coord  = FALSE
                     , drop.norm   = FALSE
                     , simplify    = FALSE
                     , ...) {

osctable <- read.table(
	file,
	header		=	TRUE,
	colClasses	=	c('id'='character'),
	skip		=	length(read.oscheader(file)) -1,
	comment.char	=	'',
	...)

rownames(osctable) <- ChromosomeCoordinates(osctable)

if (drop.id)    osctable <- osctable[, -grep("^id$",    colnames(osctable))]
if (drop.coord) osctable <- osctable[, c(grep("raw\\.", colnames(osctable)), grep("norm\\.", colnames(osctable)))]
if (drop.norm)  osctable <- osctable[, -grep("norm\\.", colnames(osctable))]

if (! simplify == FALSE)
  colnames(osctable) <- sub( simplify
                           , ''
                           , colnames(osctable))

return(osctable)
}
