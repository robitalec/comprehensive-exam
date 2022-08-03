parse_bib_to_md_pages <- function(bib) {
	folder <- xfun::sans_ext(bib)
	dir.create(folder)

	DT <- as.data.table(bib2df::bib2df(bib))

	DT[, RESEARCHERID.NUMBERS := NULL]
	DT[, ORCID.NUMBERS := NULL]

	DT[, {
		p <- file.path(folder,
									 paste0(gsub('-', '_', tstrsplit(AUTHOR[[1]][[1]], ',')[[1]]),
									 			 '_', YEAR, '.bib'))
		bib2df::df2bib(.SD, p)
		}, by = UNIQUE.ID]

	lapply(dir(folder, full.names = TRUE), function(file) {
		p <- xfun::with_ext(file.path('lit', 'papers', xfun::sans_ext(basename(file))),
												'.md')
		system(paste('pandoc', file, '-s --citeproc -o ', p))
	})
}
