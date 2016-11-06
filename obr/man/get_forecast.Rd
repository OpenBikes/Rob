\name{get_forecast}
\alias{get_forecast}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Return a forecast for a station at a given time.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
get_forecast(city_slug = NULL, station_slug = NULL, kind = NULL, moment = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{city_slug}{
%%     ~~Describe \code{city_slug} here~~
}
  \item{station_slug}{
%%     ~~Describe \code{station_slug} here~~
}
  \item{kind}{
%%     ~~Describe \code{kind} here~~
}
  \item{moment}{
%%     ~~Describe \code{moment} here~~
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
#forecast <- get_forecast(city_slug='toulouse', station_slug="00003-pomme", kind="bikes", moment="1477398413.144025")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
