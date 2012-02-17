osc.namespace.genomic_coordinate <- c("chrom", "start.0base", "start.1base", "end", "strand")
# To do: check for the genome_assembly paramter value in the header.

osc.namespace.is.genomic_coordinate <- function (osctable) {
  any(osc.namespace.genomic_coordinate %in% colnames(osctable))
}

osc.namespace.expression <- c("raw\\.", "norm\\.", "exp\\..+\\.")

osc.namespace <- function (osctable) {
  if (osc.namespace.is.genomic_coordinate(osctable))
    return("genomic_coordinate")
  return("Not Found")
}
