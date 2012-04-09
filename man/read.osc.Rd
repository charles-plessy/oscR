\name{read.osc}
\alias{read.osc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read and return an OSC table.}
\description{Reads an OSC table from a file and returns a data frame.}
\usage{
read.osc(file, drop.id=FALSE, drop.norm=FALSE, ...)
}
\arguments{
  \item{file}{File name of the OSC table.}
  \item{drop.id}{Drops the "id" column.}
  \item{drop.norm}{Drops the normalised expression values (any column whose name contains "norm.".}
  \item{\dots}{
Other arguments are passed to read.table.
}
}
\details{
When IDs can be reconstituted from the OSC header and the feature coordinates,
the data frame can be made lighter by dropping the "id" column with  drop.id=TRUE.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (...) 
{
    read.table(...)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
