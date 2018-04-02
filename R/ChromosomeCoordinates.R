#' Coordinates that can be pasted in a genome browser
#' 
#' `ChromosomeCoordinates`` takes a data frame that contains chromosomal
#' coordinates dispatched in several columns (chromosome, strand, etc.), and
#' returns a character vector of chromosomal coordinates that can be used for
#' instance as row names.
#' 
#' @param osctable A data frame where each row contain chromosomal coordinates
#' @param system Coordinate system: `phosphate` (0-based) or `nucleotide` (1-based).
#' 
#' @details Notes about chromosomal coordinates
#' 
#' **Phosphate-based (_0-based_)**
#' 
#' Popular format including [BED](http://genome.ucsc.edu/FAQ/FAQformat.html#format1)
#' are said to be _zero-based_ and open, numbering the first base of a
#' chromosome as zero and not including the end position of the coordinates in
#' the feature.
#' 
#' A biological interpretation is that they number the phosphates.
#' 
#' ```
#'  0                  1                  2                  3
#' Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
#'            1                   2                  3                  4
#' ```
#' 
#' In the above example, the coordinate 1-2 indicates base 1.
#' 
#' **Nucleotide-based (_1-based_)**
#' 
#' Other popular formats, in particular [GFF](http://www.sequenceontology.org/gff3.shtml),
#' are said to be _1-based_ and inclusice, numbering the first base of a
#' chromomsome as 1 and including the end position of the coordinates in the
#' feature.
#' 
#' ```
#'  1                  2                  3                  4
#' Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
#' ```
#' 
#' In the above example, the coordinate 1-2 indicates bases 1 and 2.
#' 
#' **Conversions between the systems**
#' 
#' ```
#'  1                  2                  3                  4
#' Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
#'           1                   2                  3                  4
#' ```
#' 
#' * From phosphates to nucleotides: add 1 to the start position.
#' * From nucleotides to phosphates: subtract 1 to the start position.
#' 
#' @return A character vector of chromosomal coordinates, like `chr1:1397306-1397353+`.
#' 
#' @author Charles Plessy
#' 
#' @seealso [`read.osc`]

ChromosomeCoordinates <- function(osctable, system="phosphate") {

  if ( osc.namespace(osctable) != "genomic_coordinate")
    stop("This OSC table dos not have genomic coordinates")

  if ( ! system %in% c("phosphate", "nucleotide"))
    stop('Unknown coordinate system: chose "phoshphate" or "nucleotide"')
  
  if ( "start.0base" %in% colnames(osctable) & system == "phosphate" )
    return ( with(osctable, paste(chrom, ":", start.0base    , "-", end, strand ,sep='') ) )

  if ( "start.0base" %in% colnames(osctable) & system == "nucleotide" )
    return ( with(osctable, paste(chrom, ":", start.0base + 1, "-", end, strand ,sep='') ) )

  if ( "start.1base" %in% colnames(osctable) & system == "phosphate" )
    return ( with(osctable, paste(chrom, ":", start.1base - 1, "-", end, strand ,sep='') ) )

  if ( "start.1base" %in% colnames(osctable) & system == "nucleotide" )
    return ( with(osctable, paste(chrom, ":", start.1base    , "-", end, strand ,sep='') ) )

  stop('No coordinates found')
}
