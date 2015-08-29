\name{GAVoting}
\alias{GAVoting}
\docType{data}
\title{Voting Data for Counties in Georgia, for the 2000 U.S. Presidential Election
}
\description{Voting data by county, for the 150 counties in the state of Georgia, in the Bush vs Gore 2000 presidential election. 
}
\usage{data("GAVoting")}
\format{
  A data frame with 159 observations on the following 9 variables.
  \describe{
    \item{\code{county}}{the county name}
    \item{\code{method}}{the voting method: \code{OS-CC} (optical scan, central count); \code{OS-PC} (optical scan, precinct count); \code{LEVER} (lever); \code{PUNCH} (punch card); \code{PAPER} (paper ballot)}
    \item{\code{econ}}{the economic level of the county according to OneGeorgia: \code{poor}; \code{middle}; \code{rich}}
    \item{\code{percent.black}}{proportion of registered voters who are black}
    \item{\code{gore}}{number of votes recorded for Mr Gore}
    \item{\code{bush}}{number of votes recorded for Mr Bush}
    \item{\code{other}}{number of votes recorded for a third candidate}
    \item{\code{votes}}{number of votes recorded}
    \item{\code{ballots}}{number of ballots received}
  }
}
\details{The uncounted votes in the 2000 presidential election were a concern in the state of Florida, where 2.9 percent of the ballots did not have vote for president recorded.   Because the election was close in that state, the voting methods and other issues were scrutinized.   In the state of Georgia, 3.5 percent of the votes were uncounted.   This data set gives votes by county, along with other data including voting method.  A properly weighted ANOVA will show that proportions of uncounted votes are significantly higher with counties using the punch card method.
}
\references{Meyer, M.C. (2002).  Uncounted Votes: Does Voting Equipment Matter?  Chance Magazine, 15(4), pp33-38.
}
\examples{
data(GAVoting)
obs1=1:5
obs2=1:3
meth=1:159
econ=1:159
types=unique(GAVoting$method)
econs=unique(GAVoting$econ)
for(i in 1:159){
	meth[i]=obs1[GAVoting$method[i]==types]
	econ[i]=obs2[GAVoting$econ[i]==econs]
}
punc=100*(1-GAVoting$votes/GAVoting$ballots)
par(mar=c(4,4,1,1))
plot(GAVoting$percent.black,punc,xlab="Proportion of black voters",
  ylab="percent uncounted votes",col=meth,pch=econ)
legend(0,18.5,pch=1:3,legend=c("poor","middle","rich"))
legend(.63,18.5,pch=c(1,1,1,1,1),col=1:5,
  legend=c("lever","OS-CC","OS-PC","punch","paper"))

zmat=matrix(0,ncol=4,nrow=159)
for(i in 1:4){zmat[meth==i+1,i]=1}

ans1=conspline(punc,GAVoting$percent.black,1,zmat,wt=GAVoting$ballots)
lines(sort(GAVoting$percent.black),
   ans1$fhat[order(GAVoting$percent.black)],col=1)
for(i in 1:4){
	lines(sort(GAVoting$percent.black),
	ans1$fhat[order(GAVoting$percent.black)]+ans1$zcoef[i],col=i+1)
}
}
\keyword{datasets}
