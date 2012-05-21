read.osc <- function (file, drop.id=FALSE, drop.norm=FALSE, ...) {

osctable <- read.table(
	file,
	header		=	TRUE,
	skip		=	length(read.oscheader(file)) -1,
	comment.char	=	'',
	...)

rownames(osctable) <- ChromosomeCoordinates(osctable)

if (drop.id)   osctable <- osctable[, -grep("^id$",    colnames(osctable))]
if (drop.norm) osctable <- osctable[, -grep("norm\\.", colnames(osctable))]

return(osctable)
}
