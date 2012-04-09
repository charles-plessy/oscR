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
