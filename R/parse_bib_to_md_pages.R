parse_bib_to_md_pages <- function(folder = file.path('bib', 'searches')) {
	bibs <- dir(folder, 'bib', full.names = TRUE)
	lapply(bibs, function(x) dir.create(xfun::sans_ext(bibs)))


	file <- 'test.bib'
	system(paste('pandoc', file, '-s -f biblatex -t markdown'))

}
