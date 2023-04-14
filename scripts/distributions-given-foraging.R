library(rethinking)


rgamma(1e3, 3, 2) |>
	dens()


c(rgamma(1e3, 3, 2),
	rnorm(1e2, 2.5, 0.1),
	rnorm(1e2, 3, 0.1),
	rnorm(1e2, 4, 0.1)) |>
	dens()


library(circular)


rvonmises(1e3, circular(0), 3, control.circular=list(units="degrees")) |>
	plot(stack=TRUE, bins=1e3)

c(rvonmises(5e2, circular(0), 3, control.circular=list(units="degrees")),
	rnorm(3e2, rad(0), 0.2),
	rnorm(3e2, rad(90), 0.2),
	rnorm(3e2, rad(210), 0.2)) |>
	plot(stack=TRUE, bins=1e3)


