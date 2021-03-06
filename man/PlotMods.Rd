% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlotMods.R
\name{PlotMods}
\alias{PlotMods}
\title{Plot results of capm model functions}
\usage{
PlotMods(model.out = NULL, variables = NULL, x.label = NULL,
  y.label = NULL, legend.title = "variable", line.size = 1,
  text.size = 14, grid = TRUE, bifur = FALSE)
}
\arguments{
\item{model.out}{output of aEpiDynamics' function.}

\item{variables}{column index for the variables in model.out to be plotted.}

\item{x.label}{string with the name of x axis.}

\item{y.label}{string with the name of y axis.}

\item{legend.title}{string with the legend title.}

\item{line.size}{scalar to define the thick of the lines (points for bifurcations) to be plotted.}

\item{text.size}{scalar to define the size of axis texts and titles.}

\item{grid}{logical to indicate if each variable must be plotted in a separated panel.}

\item{bifur}{logical to indicate if \code{model.out} represent a bifurcation.}
}
\description{
Plot results of EpiDynamics' functions.
}
\examples{
# Parameters and initial conditions.
parameters <- list(beta0 = 17 / 13, beta1 = 0.1, gamma = 1 / 13,
                   omega = 2 * pi / 365, mu = 1 / (50 * 365))

initials <- c(S = 1 / 17, I = 1e-4, 
              R = 1 - 1 / 17 - 1e-4)

# Solve the system.
sir.sinusoidal.forcing <- SIRSinusoidalForcing(pars = parameters, 
                                               init = initials, 
                                               time = 0:(60 * 365))
PlotMods(sir.sinusoidal.forcing)                                          
                                               
# Solve bifurcation dynamics for 20 years.
# If max(time) < 3650, bifurcation dynamics are solved for 3650 time-steps.
parameters2 <- list(beta0 = 17 / 13, beta1 = seq(0.001, 0.251, by = 0.001),
                   gamma = 1 / 13, omega = 2 * pi / 365, mu = 1 / (50 * 365))
# Uncomment the following lines:
# bifur <- SIRSinusoidalForcing(pars = parameters2, 
#                               init = initials,
#                               time = 0:(20 * 365))
# PlotMods(bifur, bifur = TRUE)

}

