\name{get_stations}
\alias{get_stations}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Return the list of stations.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get_stations(slug = NULL, city_slug = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{slug}{
%%     ~~Describe \code{slug} here~~
}
  \item{city_slug}{
%%     ~~Describe \code{city_slug} here~~
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
stations <- get_stations(city_slug="toulouse")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
