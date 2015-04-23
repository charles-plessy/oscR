\name{read.oscheader}
\alias{read.oscheader}
\title{Reads and returns an OSC header without reading the whole file.}

\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.oscheader(file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{Path to the OSCTable to read.}
}
\details{
Opens the file and reads the first line.  If it started with '#', read the two
first lines.  If they both start with '#', read the three first lines, and so
on until a line that does not start with '#' is found.
}
\value{
Returns the header of the OSCTable, including the line indicating the column
names, which is the first one to not start with '#'.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Charles Plessy <plessy@riken.jp>
}
\note{
The head of the file is read again and again, with one more line each time,
until the first character of the last line is not a comment character '#'
anymore.  There must be a more efficient way.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{read.osc}}
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
\keyword{ ~OSCTable }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
