parse_bib_to_md_pages <- function(bib) {
	folder <- xfun::sans_ext(bib)
	dir.create(folder)

	DT <- as.data.table(bib2df::bib2df(bib))

	DT[, RESEARCHERID.NUMBERS := NULL]
	DT[, ORCID.NUMBERS := NULL]
	setnames(DT, colnames(DT), tolower(colnames(DT)))
	DT[, journal := stringr::str_to_title(journal)]
	DT[, author := lapply(author, function(x) gsub('and', '', x))]
	DT[, auth_yr := paste0(gsub('-', '_', tstrsplit(author[[1]][[1]], ',')[[1]]),
												 '_', year),
		 by = unique.id]
	DT[, author := lapply(author, paste, collapse = ', ')]

	md_folder <- file.path('lit', 'papers', basename(folder))
	dir.create(md_folder)
	DT[, {
		p <- file.path(md_folder, xfun::with_ext(auth_yr, '.md'))
		y <- ymlthis::as_yml(.SD)
		ymlthis::use_rmarkdown(y, p, body = paste('\n#', auth_yr), open_doc = FALSE,

													 # TURN OFF
													 overwrite = TRUE)
	},
	by = unique.id,
	.SDcols = c('author', 'title', 'year', 'doi')
	]
	unlink(folder, recursive = TRUE)
}
