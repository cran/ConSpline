\name{ConSpline-package}
\alias{ConSpline-package}
\alias{ConSpline}
\docType{package}
\title{Partial Linear Least-squares Regression with Constrained Splines}
\description{Given a continuous response y and a continuous predictor x, and a design matrix Z of parametrically-modeled covariates, the model y=f(x)+Zb+e is fit using least-squares cone projection.   The function f is smooth and has one of eight user-defined shapes: increasing, decreasing, convex, concave, or combinations of monotonicity and convexity.   Quadratic splines are used for increasing and decreasing, while cubic splines are used for the other six shapes.
}
\details{
\tabular{ll}{
Package: \tab ConSpline\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2015-08-27\cr
License: \tab GPL-2 | GPL-3\cr
}
The function \code{conspline} fits the partial linear model.   Given a response variable y, a continuous predictor x, and a design matrix Z of parametrically modeled covariates, this function solves a least-squares regression assuming that y=f(x)+Zb+e, where f is a smooth function with a user-defined shape.   The shape is assigned with the argument type, where 1=increasing, 2=decreasing, 3=convex, 4=concave, 5=increasing and convex, 6=decreasing and convex, 7=increasing and concave, 8= decreasing and concave.
}
\author{
Mary C. Meyer

Maintainer: Mary C. Meyer <meyer@stat.colostate.edu>
}
\references{
Meyer, M.C. (2008) Shape-Restricted Regression Splines, \emph{Annals of Applied Statistics}, \bold{2(3)},1013-1033.
}
\keyword{Partial Linear Least-Squares}
\keyword{splines}
\keyword{shape constraint}
\keyword{monotone}
\keyword{ package }
\examples{
data(WhiteSpruce)
plot(WhiteSpruce$Diameter,WhiteSpruce$Height)
ans=conspline(WhiteSpruce$Height,WhiteSpruce$Diameter,7)
lines(sort(WhiteSpruce$Diameter),ans$muhat[order(WhiteSpruce$Diameter)])
}
