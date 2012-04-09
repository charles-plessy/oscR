read.osc <- function (file, drop.norm=FALSE, drop.id=FALSE, ...) {

osctable <- read.table(file, header=TRUE, ...)

rownames(osctable) <- ChromosomeCoordinates(osctable)

if (drop.id)   osctable <- osctable[, -grep("^id$",    colnames(osctable))]
if (drop.norm) osctable <- osctable[, -grep("norm\\.", colnames(osctable))]

return(osctable)
}
