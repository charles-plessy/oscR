read.osc <- function (file, drop.norm=FALSE, drop.id=FALSE, ...) {

osctable <- read.table(file, header=TRUE, ...)

LocationToName <- function(osctable) {

  if ( osc.namespace(osctable) != "genomic_coordinate")
    stop("This OSC table dos not have genomic coordinates")
  
  with(osctable,
    paste(chrom, ":", start.0base, "-", end, strand ,sep='')
  )
}

rownames(osctable) <- LocationToName(osctable)

if (drop.id)   osctable <- osctable[, -grep("^id$",    colnames(osctable))]
if (drop.norm) osctable <- osctable[, -grep("norm\\.", colnames(osctable))]

return(osctable)
}
