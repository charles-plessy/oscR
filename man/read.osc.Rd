% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read.osc.R
\name{read.osc}
\alias{read.osc}
\title{Read and return an OSC table.}
\usage{
read.osc(file, drop.id = FALSE, drop.coord = FALSE, drop.norm = FALSE,
  simplify = FALSE, ...)
}
\arguments{
\item{file}{File name of the OSC table.}

\item{drop.id}{Deprecated, use \code{drop.coord} instead.  Drops the \code{id} column.}

\item{drop.coord}{Drops the coordinate columns column (by keeping all
columns that have \code{raw} or \code{norm} in their name.}

\item{drop.norm}{Drops the normalised expression values (any column whose
name contains \code{norm.}).}

\item{simplify}{Text to be remove from column names.}

\item{\dots}{Other arguments are passed to \code{\link{read.table}}.

When IDs can be reconstituted from the OSC header and the feature
coordinates, the data frame can be made lighter by dropping the \code{id} column
with \code{drop.id = TRUE}.}
}
\description{
Reads an OSC table from a file and returns a data frame.
}
\author{
Charles Plessy
}
