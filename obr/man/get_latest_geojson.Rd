\name{get_latest_geojson}
\alias{get_latest_geojson}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Return the latest geojson file of a city.
}
\description{
This function calls an Openbikes API endpoint to retrieve the latest geojson for a city.
}
\usage{
get_latest_geojson(city = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{city}{
\code{city} slug
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
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
Axel Bellec
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
geojson <- get_latest_geojson(city="toulouse")
geojson$features
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
