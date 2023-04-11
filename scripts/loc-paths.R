library(data.table)
library(ggplot2)



DT_ed <- CJ(id = 'A', obs = seq.int(3), rdm = seq.int(5))

DT_pt <- CJ(id = 'A', obs = seq.int(3))
DT_pt[, c('x', 'y') := .(rnorm(.N), rnorm(.N))]

DT_pt_rdm <- DT_ed[DT_pt, on = .(id, obs)]
DT_pt_rdm[, c('x_rdm', 'y_rdm') := .(x + rnorm(.N, 0.01), y + rnorm(.N, 0.01))]


ggplot(DT_pt_rdm) +
	geom_point(aes(x_rdm, y_rdm), shape = 4, size = 0.5) +
	geom_point(aes(x, y), size = 2) +
	geom_line(aes(x, y), size = 1)  +
	geom_segment(aes(x = x, y = y, xend = x_rdm, yend = y_rdm), size = 0.5) +
	theme_minimal()


