parse_bib_to_md_pages <- function(folder = file.path('bib', 'searches')) {
	file <- 'test.bib'
	system(paste('pandoc', file, '-s -f biblatex -t markdown'))

}
