# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)





# Targets: graphviz -------------------------------------------------------
targets_graphviz <- c(
	tar_target(why_in_space, DiagrammeR::grViz('gv/why-space-use.gv'))
)



# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(notes, 'manuscript/notes.qmd'),
	tar_quarto(slides, 'slides/slides.qmd'),
	tar_quarto(lit_base, 'lit')
)




# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

