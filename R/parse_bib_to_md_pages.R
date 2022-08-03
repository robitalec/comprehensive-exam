parse_bib_to_md_pages <- function(folder = file.path('bib', 'searches')) {
	bibs <- xfun::sans_ext(dir(folder, 'bib', full.names = TRUE))
	lapply(bibs, dir.create)


	file <- 'test.bib'
	system(paste('pandoc', file, '-s -f biblatex -t markdown'))

}
