library(data.table)
library(ggplot2)



DT_ed <- CJ(id = 'A', obs = seq.int(3), rdm = seq.int(5))

DT_pt <- CJ(id = 'A', obs = seq.int(3))
DT_pt[, c('x', 'y') := .(c(-1, 0, 1), c(1, -1, 0))]

DT_pt_rdm <- DT_ed[DT_pt, on = .(id, obs)]
DT_pt_rdm[, c('x_rdm', 'y_rdm') := .(x + rnorm(.N, sd = 0.5), y + rnorm(.N, sd = 0.5))]


ggplot(DT_pt_rdm) +
	geom_point(aes(x, y), size = 2) +
	geom_segment(aes(x = x, y = y, xend = x_rdm, yend = y_rdm),
							 size = 0.2, arrow = arrow(length = unit(0.05, 'inches'))) +
	geom_line(aes(x, y), linewidth = 1)  +
	theme_void()




