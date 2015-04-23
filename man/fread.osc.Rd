\name{fread.osc}
\alias{fread.osc}
\title{Read and return an OSC table.}

\description{
Reads an OSC table from a file and returns a data table.

This function is still experimental and backwards compatibility may
be broken without much notice.
}

\usage{
fread.osc(file, dropIdCoords=FALSE, replaceIdCoords=TRUE, drop.norm=TRUE)
}

\arguments{
  \item{file}{File name of the OSC table.  If its name finishes with sQuote(gz), it
    will be uncompressed with the sQuote(zcat) command.}
  \item{dropIdCoords}{
    Drops the sQuote(id), sQuote(chrom), sQuote(start.0base), sQuote(end) and
    sQuote(strand) columns.} 
  \item{replaceIdCoords}{
    Replaces the contents of the sQuote(id) column with a browser-friendly genomic
    coordinate, and drops the sQuote(chrom), sQuote(start.0base), sQuote(end) and
    sQuote(strand) columns.}
  \item{drop.norm}{
    Drops the normalised expression values (any column whose name contains
    dQuote(norm.).}
}

\details{
When IDs can be reconstituted from the OSC header and the feature coordinates,
the data table can be made lighter by dropping the "id" column with the dQuote(replaceIdCoords)
option.
}

\value{
Returns a data table.  With OSCTables output by the dQuote(level1) program, the combiation
of dQuote(drop.norm) and dQuote(dropIdCoords) will produce a data table that only contains
numeric values.
}

\references{
%% ~put references to the literature/web site here ~
}

\author{
Charles Plessy <plessy@riken.jp>
}

\seealso{
\code{\link{data.table}}, \code{\link{read.osc}}
}

\examples{
%%##---- Should be DIRECTLY executable !! ----
%%##-- ==>  Define data, use random,
%%##--	or do  help(data=index)  for the standard data sets.
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~OSCTable }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
