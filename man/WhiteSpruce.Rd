\name{WhiteSpruce}
\alias{WhiteSpruce}
\docType{data}
\title{Height and Diameter of 36 White Spruce Trees.
}
\description{A standard scatterplot example from various statistics text books, representing height versus diameter of White Spruce trees.
}
\format{
  A data frame with 36 observations on the following 2 variables.
  \describe{
    \item{\code{Diameter}}{Diameter at "breast height" of tree}
    \item{\code{Height}}{Height of tree}
  }
}
\examples{
data(WhiteSpruce)
plot(WhiteSpruce$Diameter,WhiteSpruce$Height)
}
\keyword{datasets}
