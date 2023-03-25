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
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet('lit_results')),
		cue = tar_cue('always')
	),
	tar_target(
		table_lit_results_ps,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet(sheet = 'lit_results_ps')),
		cue = tar_cue('always')
	),
	tar_target(
		table_lit_results_empirical,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet(sheet = 'lit_results_empirical')),
		cue = tar_cue('always')
	),
	tar_target(
		table_lit_results_other,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
			read_sheet(sheet = 'lit_results_other')),
		cue = tar_cue('always')
	),
	tar_target(
		write_literature,
		fwrite(literature, 'tables/literature.csv')
	),
	tar_target(
		write_table_1_ps_literature_compared,
		fwrite(table_1_ps_literature_compared, 'tables/table_1_ps_literature_compared.csv')
	),
	tar_target(
		write_table_2_ps_literature_compared,
		fwrite(table_2_ps_literature_compared, 'tables/table_2_ps_literature_compared.csv')
	),
	tar_target(
		write_table_3_ps_literature_compared,
		fwrite(table_3_ps_literature_compared, 'tables/table_3_ps_literature_compared.csv')
	),
	tar_target(
		rrc_results,
		data.table(
			drive_get('producer-scrounger-literature-compared') |>
				read_sheet(sheet = 'rrc_results')),
		cue = tar_cue('always')
	),
	tar_target(
		write_rrc_results,
		fwrite(rrc_results, 'tables/rrc_results.csv')
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
	tar_file_read(
		into_prop_scrounger,
		'gv/into-prop-scrounger.gv',
		DiagrammeR::grViz(!!.x)
	),
	tar_file_read(
		full_relationships,
		'gv/full-relationships.gv',
		DiagrammeR::grViz(!!.x)
	),
	tar_file_read(
		habitat_and_producer,
		'gv/habitat-and-producer.gv',
		DiagrammeR::grViz(!!.x)
	),
	tar_file_read(
		group_level,
		'gv/group-level-effects.gv',
		DiagrammeR::grViz(!!.x)
	),
	tar_file_read(
		resources_risks_conditions,
		'gv/archive/resources-risks-conditions.gv',
		DiagrammeR::grViz(!!.x)
	)
)



# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(site)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

