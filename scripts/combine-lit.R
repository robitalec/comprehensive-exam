library(data.table)
DT <-  dir('data/literature/', full.names = TRUE) |>
	lapply(function(x) fread(x)) |>
	rbindlist(fill = TRUE)

DT[!is.na(DI) & !is.na(DOI)]

DT[!is.na(DI), DOI := DI]
DT[is.na(DOI)]


DT[, n_by_doi := .N, DOI]
DT[, seq_by_doi := seq.int(.N), DOI]

DT[, uniqueN(DOI)]
DT[seq_by_doi == 1]

DT[is.na(PY), PY := Year]
DT[is.na(AU), AU := Authors]
DT[is.na(TI), TI := Title]
DT[is.na(SO), SO := `Source title`]

out_cols <- c('PY', 'AU', 'TI', 'SO', 'DOI')

out <- DT[seq_by_doi == 1, .SD, .SDcols = out_cols]


lit <- tar_read(literature)
setDT(lit)
setnames(lit, 'DI', 'DOI')

m <- merge(
	lit[, .SD, .SDcols = -first(out_cols, n = length(out_cols) - 1)],
	out,
	by = 'DOI',
	all.y = TRUE
)
