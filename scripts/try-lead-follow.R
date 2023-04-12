library(spatsoc)

# Load data.table
library(data.table)

# Read example data
DT <- fread(system.file("extdata", "DT.csv", package = "spatsoc"))



# Pigeons -----------------------------------------------------------------
DT <- fread('~/Downloads/Use of visual familiar cues in anosmic pigeons.csv')
setnames(
	DT,
	c('individual-local-identifier',
	 	'utm-easting',
	 	'utm-northing',
	 	'study-local-timestamp'),
	c('ID', 'X', 'Y', 'datetime')
)

DT <- DT[ID %in% unique(ID)[1:5]]

# -------------------------------------------------------------------------






# Cast the character column to POSIXct
DT[, datetime := as.POSIXct(datetime)]

DT[, loc_id := seq_len(.N), by = ID]

DT_shift <- DT[, .(ID = paste0(ID, '_lag'),
									 X = shift(X, type = 'lag'),
									 Y = shift(Y, type = 'lag'),
									 datetime = shift(datetime, type = 'lag'),
									 loc_id = loc_id,
									 type = 'lag'),
							 by = .(ID_raw = ID)]

DT_m <- rbindlist(list(DT, DT_shift), fill = TRUE)

DT_m[is.na(ID_raw), ID_raw := ID]
DT_m[is.na(type), type := 'obs']

# Temporal grouping
group_times(DT_m, datetime = 'datetime', threshold = '1 minute')

DT_m[order(loc_id)]

# Spatial grouping with timegroup
group_pts(DT_m, threshold = 50, id = 'ID',
					coords = c('X', 'Y'), timegroup = 'timegroup')

DT_m[, n_by_group := .N, group]
DT_m[, n_raw_id_by_group := uniqueN(ID_raw), group]
DT_m[, n_id_by_group := uniqueN(ID), group]
DT_m[, n_type_by_group := uniqueN(type), group]

DT_m[n_by_group > 1][order(group)]
DT_m[n_by_group > 1 & n_raw_id_by_group > 1][order(group)]
DT_m[n_by_group > 1 & n_id_by_group == 3][order(group)]


# Drop self lag
lapply(DT_m[, unique(ID)], function(i) {
	DT_m[ID_raw == i, drop_self := ifelse(sum(ID_raw == i) == 2, TRUE, FALSE),
			 by = group]
})
DT_m[group == 1]


DT_wo_self <- DT_m[!(drop_self & type == 'lag')]
DT_wo_self[, n_by_group := .N, group]
DT_m[n_by_group > 1][order(group)]

