parse_bib_to_md_pages <- function(folder = file.path('bib', 'searches')) {
	bibs <- dir(folder, 'bib', full.names = TRUE)
	lapply(bibs, function(x) dir.create(xfun::sans_ext(bibs)))

	DT <- as.data.table(bib2df::bib2df(file))

	DT[, writeLines(bib2df::df2bib(.SD), paste0(.BY[[1]], '.bib')), by = UNIQUE.ID]
	file <- 'test.bib'
	system(paste('pandoc', file, '-s -f biblatex -t markdown'))

}
