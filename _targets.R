# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)




# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(notes, 'manuscript/notes.qmd'),
	tar_quarto(slides, 'slides/slides.qmd'),
	tar_quarto(lit_base, 'lit')
)




# Targets: read -----------------------------------------------------------
targets_read <- c(
	tar_target(parse_sna,
						 parse_bib_to_md_pages('bib/searches/animal-social-networks-2022-2017-sort-by-cite-sel-from-n100.bib'))
)




# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

