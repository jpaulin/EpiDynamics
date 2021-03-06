% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MultiStrainPartialImmunity.R
\name{MultiStrainPartialImmunity}
\alias{MultiStrainPartialImmunity}
\title{Partial immunity model that cycles (P 4.2).}
\usage{
MultiStrainPartialImmunity(pars = NULL, init = NULL, time = NULL, ...)
}
\arguments{
\item{pars}{\code{\link{vector}} with 2 vectors and 2 values in the following order: beta, gamma, mu and a. The first element of each vector corresponds to the first strain, the second element to the second strain and so on. mu is the per capita death rate and alpha is the modified transmission rate due to partial immunity.}

\item{init}{\code{\link{vector}} with 3 vectors in the following order: S, P and L. The first element of each vector corresponds to the first strain, the second element to the second strain and so on. Si + Pi + Li = 1 but sum(Si) could be greater than 1.}

\item{time}{time sequence for which output is wanted; the first value of times must be the initial time.}

\item{...}{further arguments passed to \link[deSolve]{ode} function.}
}
\value{
\code{\link{list}}. The first element, \code{*$model}, is the model function. The second, third and fourth elements are the vectors (\code{*$pars}, \code{*$init}, \code{*$time}, containing the \code{pars}, \code{init} and \code{time} arguments of the function. The fifth element \code{*$results} is a \code{\link{data.frame}} with up to as many rows as elements in time. First column contains the time. Second, third and fourth columns contain the proportion of susceptibles, infectious and recovered.
}
\description{
Solves multi-strain where the strains are arranged in a circle and each strain offers partial immunity (in terms of reduced transmission) to its neighbours.
}
\details{
This is the R version of program 4.2 from page 123 of "Modeling Infectious Disease in humans and animals" by Keeling & Rohani.
}
\examples{
# Parameters and initial conditions.
parameters <- c(beta = rep(40, 4), gamma = rep(9.98, 4),
                       mu = 0.02, a = 0.4 )

initials <- c(S = c(0.08, 0.1, 0.1, 0.11),
                       P = c(0.4, 0.3, 0.3, 0.29),
                       L = c(0.15, 0.02, 0.1, 0.01))

# Solve and plot.
mlti.strain.pi <- MultiStrainPartialImmunity(pars = parameters, 
                                             init = initials, 
                                             time = 0:200)
PlotMods(mlti.strain.pi, variables = c('L1', 'L2', 'L3', 'L4'), grid = FALSE)
                                 
}
\references{
Keeling, Matt J., and Pejman Rohani. Modeling infectious diseases in humans and animals. Princeton University Press, 2008.
\href{http://www.modelinginfectiousdiseases.org/}{Modeling Infectious Diseases in Humans and Animals}
}
\seealso{
\link[deSolve]{ode}.
}

