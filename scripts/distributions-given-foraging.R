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


ggplot(data.table(
	x = as.integer(rvonmises(1e5, circular(0), 1, control.circular=list(units="degrees"))))[, .N, x][, .(x, N, density = N / sum(N))]) +
	geom_area(aes(x, density), size = 1, fill = 'black', alpha = 0.5) +
	coord_polar() +
	theme_minimal() +
	theme(axis.text.y = element_blank())


ggplot(data.table(
	x = as.integer(c(
		rvonmises(3e5, circular(0), 1, control.circular=list(units="degrees")),
		rnorm(0.5e5, rad(90), 0.2),
		rnorm(0.5e5, rad(210), 0.2)
	)))[, .N, x][, .(x, N, density = N / sum(N))]) +
	geom_area(aes(x, density), size = 1, fill = 'black', alpha = 0.5) +
	coord_polar() +
	theme_minimal() +
	theme(axis.text.y = element_blank())



ggplot(data.table(
	x = rvonmises(1e5, circular(0), 1, control.circular=list(units="degrees")) |> as.integer() |> cut(breaks = 120))[, .N, x][, .(x, density = N / .N)]) +
	geom_count(aes(x, density), size = 0.1, fill = 'grey') +
	# geom_area(aes(x, density), size = 1, fill = 'darkgrey') +
	coord_polar() +
	theme_minimal()




ggplot(data.table(
	x = as.integer(rvonmises(1e5, circular(0), 3, control.circular=list(units="degrees"))))[, .N, x]) +
	geom_point(aes(x = x, y = N)) +
	coord_polar() +
	labs(x = '', y = '') +
	scale_x_continuous(n.breaks = 20) +
	theme_minimal() +
	theme(axis.text.y = element_blank())


ggplot(data.table(
	x = as.integer(c(rvonmises(5e2, circular(0), 3, control.circular=list(units="degrees")),
				rnorm(3e2, rad(90), 0.2),
				rnorm(3e2, rad(210), 0.2))))[, .N, x]) +
	geom_density(aes(x = x, y = N)) +
	coord_polar() +
	labs(x = '', y = '') +
	scale_x_continuous(n.breaks = 20) +
	theme_minimal() +
	theme(axis.text.y = element_blank())



ggplot(data.table(
	x = as.integer(c(
		rvonmises(5e1, circular(0), 1, control.circular=list(units="degrees")),
		rnorm(0.5e5, rad(75), 0.2),
		rnorm(0.5e5, rad(170), 0.3),
		rnorm(0.5e5, rad(320), 0.2)
	)))[, .N, x][, .(x, N, density = N / sum(N))][x < 360]) +
	geom_area(aes(x, density), size = 1, fill = 'black', alpha = 0.5) +
	coord_polar() +
	labs(x = 'turn angle', y = 'density') +
	theme_minimal(base_size = 22) +
	theme(axis.text.y = element_blank())

