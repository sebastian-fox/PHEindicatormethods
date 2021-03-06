% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Rates.R
\name{phe_rate}
\alias{phe_rate}
\title{phe_rate}
\usage{
phe_rate(data, x, n, type = "standard", confidence = 0.95,
  multiplier = 1e+05)
}
\arguments{
\item{data}{the data.frame containing the data to calculate rates for; unquoted string; no default}

\item{x}{field name from data containing the rate numerators (eg observed number of events); unquoted string; no default}

\item{n}{field name from data containing the rate denominators (eg populations); unquoted string; no default}

\item{type}{type of output; can be "value", "lower", "upper", "standard" (for all 3 previous fields) or "full"; quoted string; default standard}

\item{confidence}{the required level of confidence expressed as a number between 0.9 and 1
or 90 and 100; numeric; default 0.95}

\item{multiplier}{the multiplier used to express the final values (eg 100,000 = rate per 100,000); numeric; default 100,000}
}
\value{
When type = "full", returns the original data.frame with the following appended:
        rate, lower confidence limit, upper confidence limit, confidence level, statistic and method
}
\description{
Calculates rates with confidence limits using Byar's [1] or exact [2] CI method.
}
\section{Notes}{
 For numerators >= 10 Byar's method [1] is applied using the \code{\link{byars_lower}}
 and \code{\link{byars_upper}} functions.  For small numerators Byar's method is less accurate and so
 an exact method [2] based on the Poisson distribution is used.
}

\examples{
df <- data.frame(area = rep(c("Area1","Area2","Area3","Area4"), 2),
                 year = rep(2015:2016, each = 4),
                 obs = sample(100, 2 * 4, replace = TRUE),
                 pop = sample(100:200, 2 * 4, replace = TRUE))
phe_rate(df, obs, pop)
phe_rate(df, obs, pop, type="full", confidence=99.8, multiplier=100)

}
\references{
[1] Breslow NE, Day NE. Statistical methods in cancer research,
 volume II: The design and analysis of cohort studies. Lyon: International
 Agency for Research on Cancer, World Health Organisation; 1987. \cr
[2] Armitage P, Berry G. Statistical methods in medical research (4th edn).
  Oxford: Blackwell; 2002.
}
\seealso{
Other PHEindicatormethods package functions: \code{\link{byars_lower}},
  \code{\link{byars_upper}}, \code{\link{phe_dsr}},
  \code{\link{phe_isr}}, \code{\link{phe_mean}},
  \code{\link{phe_proportion}}, \code{\link{phe_smr}},
  \code{\link{wilson_lower}}, \code{\link{wilson_upper}}
}
