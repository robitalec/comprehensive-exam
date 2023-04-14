library(ggplot2)
library(circular)


prod_sl <- data.frame(x = rgamma(1e3, 3, 2)) |>
	ggplot(aes(x)) + geom_density(fill = '#cec4c4') + 
	labs(x = 'step length', y = 'density') + 
	theme_minimal(base_size = 22)
prod_sl

scr_sl <- data.frame(x = c(
	rgamma(1e3, 3, 2),
	rnorm(1e2, 2.5, 0.1),
	rnorm(1e2, 3.2, 0.1),
	rnorm(1e2, 4, 0.1))) |>
	ggplot(aes(x)) + geom_density(fill = '#cec4c4') + 
	geom_label(data = data.frame(x = c(2.5, 3.2, 4), y = rep(0.4, 3), id = LETTERS[seq.int(3)]), aes(x, y, label = id)) + 
 	labs(x = 'step length', y = 'density') + 
	theme_minimal(base_size = 22)
scr_sl




rvonmises(1e3, circular(0), 3, control.circular=list(units="degrees")) |>
	plot(stack=TRUE, bins=1.4e3, xlim=c(-1,1), ylim=c(-1,1.3), zero = rad(90))

c(rvonmises(5e2, circular(0), 3, control.circular=list(units="degrees")),
	rnorm(3e2, rad(90), 0.2),
	rnorm(3e2, rad(210), 0.2)) |>
	plot(stack=TRUE, bins=1.4e3, xlim=c(-1,1), ylim=c(-1,1.3), zero = rad(90))

