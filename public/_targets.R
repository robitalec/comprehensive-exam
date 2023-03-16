# === Comps ---------------------------------------------------------------
# Alec L. Robitaille



# Functions ---------------------------------------------------------------
lapply(dir('R', '*.R', full.names = TRUE), source)





# Targets: formulas -------------------------------------------------------
targets_formulas <- c(
	tar_target(
		example_formula,
		write_equation_to_png('formulas/_example.qmd')
	)
)



# Targets: drive ----------------------------------------------------------
gs4_auth(email = 'robit.alec@gmail.com')
targets_drive  <- c(
	tar_target(
		literature,
		drive_get('literature-comprehensive-exam') |>
			read_sheet('producer-scrounger-1970-2023_wos'),
		cue = tar_cue('always')
	),
	tar_target(
		table_ps_models_compared,
		drive_get('producer-scrounger-models-compared') |>
			read_sheet(sheet = 'table 1'),
		cue = tar_cue('always')
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

