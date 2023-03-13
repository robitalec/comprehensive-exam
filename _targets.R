# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)





# Targets: formulas -------------------------------------------------------
targets_formulas <- c(
	tar_target(
		formula_files,
		dir('formulas', full.names = TRUE)
	),
	tar_target(
		formula_pngs,
		write_equation_to_png(formula_files),
		pattern = map(formula_files)
	)
)



# Targets: graphviz -------------------------------------------------------
targets_graphviz <- c(
	tar_target(why_in_space, DiagrammeR::grViz('gv/why-space-use.gv')),
	tar_target(term_cloud, DiagrammeR::grViz('gv/term-cloud.gv')),
	tar_target(fundamental_realized, DiagrammeR::grViz('gv/fundamental-realized-niche.gv')),
	tar_target(resources_risks_conditions, DiagrammeR::grViz('gv/resources-risks-conditions.gv')),
	tar_target(habitat_and_producer, DiagrammeR::grViz('gv/habitat-and-producer.gv'))
)



# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(site)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

