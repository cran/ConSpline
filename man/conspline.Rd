\name{conspline}
\alias{conspline}
\title{Partial Linear Least-Squares with Constrained Regression Splines
}
\description{Given a response variable y, a continuous predictor x, and a design matrix Z of parametrically modeled covariates, this function solves a least-squares regression assuming that y=f(x)+Zb+e, where f is a smooth function with a user-defined shape.   The shape is assigned with the argument type, where 1=increasing, 2=decreasing, 3=convex, 4=concave, 5=increasing and convex, 6=decreasing and convex, 7=increasing and concave, 8=decreasing and concave.}
\usage{
conspline(y,x,type,zmat=0,wt=0,knots=0,
   test=FALSE,c=1.2,nsim=10000)
}
\arguments{
  \item{y}{
A continuous response variable}
  \item{x}{A continuous predictor variable.  The length of x must equal the length of y.}
  \item{type}{An integer 1-8 describing the shape of the regression function in x.  1=increasing, 2=decreasing, 3=convex, 4=concave, 5=increasing and convex, 6=decreasing and convex, 7=increasing and concave, 8= decreasing and concave.
}
  \item{zmat}{An optional design matrix of covariates to be modeled parametrically.  The number of rows of zmat must be the length of y.}
  \item{wt}{Optional weight vector, must be positive and of the same length as y.}
  \item{knots}{Optional user-defined knots for the spline function.  The range of the knots must contain the range of x.}
  \item{test}{If test=TRUE, a test for the "significance" of x is performed.   For convex and concave shapes, the null hypothesis is that the relationship between y and x is linear, for any of the other shapes, the null hypothesis is that the expected value of y is constant in x.  }
  \item{c}{An optional parameter for the variance estimation.  Must be between 1 and 2 inclusive.}
  \item{nsim}{An optional specification of the number of simulated data sets to make the mixing distribution for the test statistic if test=TRUE.}
}
\details{A cone projection is used to fit the least-squares regression model.   The test for the significance of x is exact, while the inference for the covariates represented by the Z columns uses statistics that have approximate t-distributions.}
\value{
	\item{muhat}{The fitted values at the design points, i.e. an estimate of E(y).}
	\item{fhat}{The estimated regression function, evaluated at the x-values, describing the relationship between E(y) and x, see above description of the model.}
	\item{fslope}{The slope of fhat, evaluated at the x-values.}
	\item{knots}{The knots used in the spline function estimation.}
	\item{pvalx}{If test=TRUE, this is the p-value for the test involving the predictor x.  For convex and concave shapes, the null hypothesis is that the relationship between y and x is linear, versus the alternative that it has the assigned shape.  For any of the other shapes, the null hypothesis is that the expected value of y is constant in x, versus the assigned shape.    }
	\item{zcoef}{The estimated coefficients for the components of the regression function  given by the columns of Z.   An "intercept" is given if the column space of Z did not contain the constant vectors. }
	\item{sighat}{The estimate of the model variance.  Calculated as SSR/(n-cD), where SSR is the sum of squared residuals of the fit, n is the length of y, D is the observed degrees of freedom of the fit, and c is a parameter between 1 and 2.}
	\item{zhmat}{The hat matrix corresponding the columns of Z, to compute p-values for contrasts, for example.}
	\item{sez}{The standard errors for the Z coefficient estimates.   These are square roots of the diagonal values of zhmat, times the square root of sighat.}
	\item{pvalz}{Approximate p-values for the null hypotheses that the coefficients for the covariates represented by the Z columns are zero.}
}
\references{
Meyer, M.C. (2008) Shape-Restricted Regression Splines, \emph{Annals of Applied Statistics}, \bold{2(3)},1013-1033.
}
\author{
Mary C Meyer, Professor, Statistics Department, Colorado State University
}
\examples{
n=60
x=1:n/n
z=sample(0:1,n,replace=TRUE)
mu=1:n*0+4
mu[x>1/2]=4+5*(x[x>1/2]-1/2)^2
mu=mu+z/4
y=mu+rnorm(n)/4
plot(x,y,col=z+1)
ans=conspline(y,x,5,z,test=TRUE)
points(x,ans$muhat,pch=20,col=z+1)
lines(x,ans$fhat)
lines(x,ans$fhat+ans$zcoef, col=2)
ans$pvalz  ## p-val for test of significance of z parameter
ans$pvalx  ## p-val for test for linear vs convex regression function
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{splines}
\keyword{monotone}
\keyword{convex}
\keyword{concave}
\keyword{partial linear}
\keyword{semi-parametric}
