library(data.table)
library(ggplot2)



# Producer ----------------------------------------------------------------
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

ggplot(landscape_long,
			 aes(rescale(x, c(-2, 2)),
			 		rescale(y, c(-2, 2)))) +
	geom_tile(aes(fill = clumps), alpha = 0.6) +
	geom_point(aes(x, y), size = 2, data = DT_pt_rdm) +
	geom_segment(aes(x = x, y = y, xend = x_rdm, yend = y_rdm),
							 size = 0.2, arrow = arrow(length = unit(0.05, 'inches')),
							 data = DT_pt_rdm) +
	geom_line(aes(x, y), linewidth = 1, data = DT_pt_rdm)  +
	coord_equal() +
	guides(fill = 'none') +
	theme_void()


# Scrounger ---------------------------------------------------------------
DT_id <- CJ(id = c('A'), pr_id = c('C', 'D', 'E'), obs = seq.int(1))
DT_id[, c('x', 'y') := .(c(-1, 0.2, 1), c(1, -0.5, 0.4))]


DT_sc <- CJ(id = c('A'), obs = seq.int(1))
DT_sc[, c('x', 'y') := .(0, 0)]



ggplot(DT_sc[DT_id, on = 'id']) +
	geom_point(aes(x, y), size = 2) +
	geom_point(aes(i.x, i.y, color = pr_id), size = 2) +
	geom_segment(aes(x = x, y = y, xend = i.x, yend = i.y),
							 size = 0.2, arrow = arrow(length = unit(0.05, 'inches'))) +
	# geom_line(aes(x, y), linewidth = 1)  +
	theme_void()




# Conclusion - individuals can choose strategy
# So might survey conspecifics, then opt to produce
# DT_sc[, c('x_prod', 'y_prod') := .(x + rnorm(.N, sd = 0.5), y + rnorm(.N, sd = 0.5))]




# Raster ------------------------------------------------------------------
library(NLMR)
library(raster)
library(ggplot2)
library(scales)

landscape <- nlm_randomcluster(
	ncol = 30,
	nrow = 30,
	p = 0.4,
	ai = c(0.25, 0.25, 0.5),
	rescale = FALSE
)

landscape_long <- as.data.frame(landscape, xy = TRUE)

mDTsc <- DT_sc[DT_id, on = 'id']

ggplot(landscape_long,
			 aes(rescale(x, c(-1.2, 1.2)),
			 		rescale(y, c(-1.2, 1.2)))) +
	geom_tile(aes(fill = clumps), alpha = 0.6) +
	coord_equal() +
	geom_point(aes(i.x, i.y, color = pr_id), size = 5, data = mDTsc) +
	geom_point(aes(x, y), size = 5, data = mDTsc) +
	geom_segment(aes(x = x, y = y, xend = i.x, yend = i.y),
							 size = 1, arrow = arrow(length = unit(0.2, 'inches')),
							data = mDTsc) +
	guides(color = 'none', fill = 'none') +
	theme_void()
