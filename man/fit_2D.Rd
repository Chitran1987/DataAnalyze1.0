\name{fit_2D}
\alias{fit_2D}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Iteratively fits 2D regression models to a dataset using the function \code{fit_2D(func, dat, it, op_v)}
}
\description{
The function, \code{fit_2D}, takes four arguments, \code{func}, \code{dat}, \code{it}, \code{op_v} and fits the 2D model described by the argument \code{func} into the data described by the argument \code{dat}. The parameter \code{it} describes the number of iterations that the code generates before it decides to declare that the starting/intial values of the vector to be iterated, \code{op_v}, is a bad starting point to search for a local minima within the given number of iterations, \code{it}. In such cases the message \code{solution did not converge} will be displayed. \code{op_v} is a vector comprising the initial values/guess point from where the vector will iterate itself to look for a local minima. It must however be remembered that the function, \code{fit_2D}, does not have pre-defined default values attached to its arguments and also that the function \code{does not} under present circumstances support optimization algorithms with \code{constraints} defined on them. This however is a work in progress and will be taken care of in future contexts.
}
\usage{
fit_2D(func, dat, it, op_v)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{func}{
The argument \code{func} is a R function. It defines the model that the user wants to fit to his data defined in the argument \code{dat}. The argument has certain rules and restrictions.
1. The argument \code{func} has to be a user-defined function itself
2. The function that the user passes to the argument \code{func} must itself be a function that accepts only one argument. This argument must be the vector that needs to be iterated, \code{op_v}.
3. The vector \code{op_v} must be defined after the definition of the function that is to be passed in \code{func}, failing which, the argument passed in \code{func} ceases to be a function and this would throw an error. \code{See example below}
4. The function has to return a value, \code{y}. \code{See example below}
}
  \item{dat}{
The argument \code{dat} has to be a matrix of size \code{2Xn}, where, \code{n<-length(x)}. The first row of \code{dat}(\code{dat[1,]}) should be the \code{y} values whereas the second row \code{\code{dat[2,]}} should be the \code{x} values. \code{See example below}
}
  \item{it}{
%%     ~~Describe \code{it} here~~
}
  \item{op_v}{
%%     ~~Describe \code{op_v} here~~
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
library(DataAnalyze1.0)
x<-seq(-10,10, by=0.02)
g<-function(v){
  y<-v[1]*exp(-1*(((x-v[2])/(v[3]))^2))+2*v[1]*exp(-1*(((x-v[4])/(v[5]))^2))
  return(y)
}
y<-3*exp(-1*(((x-4)/(5))^2))+6*exp(-1*(((x-4.5)/(4))^2))
y_d<-y+runif(length(x))
plot(x,y_d)
m<-matrix(c(y_d,x), byrow = T, nrow = 2)
v<-c(2.2,3.5,4.7,4.8,5)
fit_2D(func=g, dat=m, op_v = v, it=20000)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
