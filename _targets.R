# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)




# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto('docs/notes.qmd'),
	tar_quarto('slides/slides.qmd')
)




# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

