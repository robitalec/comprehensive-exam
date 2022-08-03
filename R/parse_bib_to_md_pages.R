parse_bib_to_md_pages <- function(bib) {
	folder <- xfun::sans_ext(bibs)
	dir.create(folder)

	DT <- as.data.table(bib2df::bib2df(bib))

	DT[, writeLines(bib2df::df2bib(.SD),
									file.path(folder, paste0(.BY[[1]], '.bib'))),
		 by = UNIQUE.ID]

	lapply(dir(folder), function(file) {
		system(paste('pandoc', file, '-s -f biblatex -t markdown'))
	})
}
