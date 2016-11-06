\name{get_cities}
\alias{get_cities}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Return the list of cities.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get_cities(slug = NULL, country = NULL, provider = NULL, predictable = NULL, active = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{slug}{
%%     ~~Describe \code{slug} here~~
}
  \item{country}{
%%     ~~Describe \code{country} here~~
}
  \item{provider}{
%%     ~~Describe \code{provider} here~~
}
  \item{predictable}{
%%     ~~Describe \code{predictable} here~~
}
  \item{active}{
%%     ~~Describe \code{active} here~~
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
cities <- get_cities(country="France")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
