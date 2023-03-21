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
		data.table(
			drive_get('literature-comprehensive-exam') |>
				read_sheet('producer-scrounger-wos-scopus-bioab')),
		cue = tar_cue('always')
	),
	tar_target(
		table_1_ps_literature_compared,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet(sheet = 'table 1')),
		cue = tar_cue('always')
	),
	tar_target(
		table_2_ps_literature_compared,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet(sheet = 'table 2')),
		cue = tar_cue('always')
	),
	tar_target(
		table_3_ps_literature_compared,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
			read_sheet(sheet = 'table 3')),
		cue = tar_cue('always')
	)
)




# Targets: literature -----------------------------------------------------
targets_literature <- c(
	tar_target(
		n_by_species,
		sort(strsplit(literature$empirical, ',') |> unlist() |> table(), TRUE) |>
			data.table() |> setnames(new = c('Species', 'Count'))
	),
	tar_target(
		n_by_type,
		data.table(
			Approach = c(
				'Producer scrounger model',
				'Empirical test or experiment',
				'Simulation',
				'Other model type'
			),
			Count = c(
				literature[ps_model == 'y', .N],
				literature[!is.na(empirical), .N],
				literature[simulation == 'y', .N],
				literature[!is.na(other_model), .N]
			)
		)
	)
)



# Targets: figures --------------------------------------------------------
targets_figures <- c(
	tar_target(
		figure_1,
		{}
	),
	tar_target(
		figure_2,
		{}
	),
	tar_target(
		figure_3,
		{}
	)
)




# Targets: graphviz -------------------------------------------------------
targets_graphviz <- c(
	tar_file_read(why_in_space, 'gv/why-space-use.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(term_cloud, 'gv/term-cloud.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(fundamental_realized, 'gv/fundamental-realized-niche.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(resources_risks_conditions, 'gv/resources-risks-conditions.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(resources_risks_conditions_plants, 'gv/resources-risks-conditions-plants.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(habitat_and_producer, 'gv/habitat-and-producer.gv', DiagrammeR::grViz(!!.x)),
	tar_file_read(decision_tree, 'gv/decision-tree.gv', DiagrammeR::grViz(!!.x))
	tar_file_read(producer_scrounger_extensions, 'gv/producer-scrounger-extensions.gv', DiagrammeR::grViz(!!.x))
)



# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(site)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

