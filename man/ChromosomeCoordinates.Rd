\name{ChromosomeCoordinates}
\alias{ChromosomeCoordinates}
\title{Coordinates that can be pasted in a genome browser}
\description{
ChromosomeCoordinates takes a data fram that contains chromosomal coordinates
dispatched in several columns (chromosome, strand, etc.), and returns a character
vector of chromosomal coordinates that can be used for instance as row names.
}
\usage{
ChromosomeCoordinates(osctable, system = "phosphate")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{osctable}{A data frame where each row contain chromosomal coordinates}
  \item{system}{Coordinate system: "phosphate" (0-based) or "nucleotide" (1-based).}
}
\details{

\section{Notes about chromosomal coordinates}{

\section{Phosphate-based (\sQuote(0-based))}{

Popular format including [http://genome.ucsc.edu/FAQ/FAQformat.html#format1
BED] are said to be sQuote(zero-based) and open, numbering the first base of a
chromosome as zero and not including the end position of the coordinates in the
feature.

A biological interpretation is that they number the phosphates.

\samp{
  0                  1                  2                  3
Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
          1                   2                  3                  4
}

In the above example, the coordinate 1-2 indicates base 1.

}

\section{Nucleotide-based (sQuote(1-based))}{

Other popular formats, in particular [http://www.sequenceontology.org/gff3.shtml GFF], are said to be 1-based and inclusice, numbering the first base of a chromomsome as 1 and including the end position of the coordinates in the feature.

\samp{
  1                  2                  3                  4
Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
}

In the above example, the coordinate 1-2 indicates bases 1 and 2.

== Conversions between the systems ==

\samp{
  1                  2                  3                  4
Base - phosphate - Base - phosphate - Base - phosphate - Base - phosphate ...
          1                   2                  3                  4
}

\item{From phosphates to nucleotides: add 1 to the start position.}
\item{From nucleotides to phosphates: subtract 1 to the start position.}
}
}
}
\value{
A character vector of chromosomal coordinates, like \preformatted{chr1:1397306-1397353+}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Charles Plessy
}

\seealso{
\code{\link{read.osc}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## The function is currently defined as
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
