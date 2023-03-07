# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)





# Targets: graphviz -------------------------------------------------------
targets_graphviz <- c(
	tar_target(why_in_space, DiagrammeR::grViz('gv/why-space-use.gv')),
	tar_target(term_cloud, DiagrammeR::grViz('gv/term-cloud.gv')),
	tar_target(fundamental_realized, DiagrammeR::grViz('gv/fundamental-realized-niche.gv')),
	tar_target(resources_risks_conditions, DiagrammeR::grViz('gv/resources-risks-conditions.gv'))
)



# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(site)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

