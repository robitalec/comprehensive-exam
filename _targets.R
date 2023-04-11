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
		fwrite(literature, 'data/literature/literature.csv')
	),
	tar_target(
		write_table_lit_results_ps,
		fwrite(table_lit_results_ps, 'data/literature/table_lit_results_ps.csv')
	),
	tar_target(
		write_table_lit_results_empirical,
		fwrite(table_lit_results_empirical, 'data/literature//table_lit_results_empirical.csv')
	),
	tar_target(
		write_table_lit_results_other,
		fwrite(table_lit_results_other, 'data/literature/table_lit_results_other.csv')
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
		fwrite(rrc_results, 'data/literature/rrc_results.csv')
	)
)




# Targets: literature -----------------------------------------------------
targets_literature <- c(
	tar_target(
		n_by_species,
		sort(strsplit(literature$Species, ', ') |> unlist() |> table(), TRUE) |>
			data.table() |> setnames(new = c('Species', 'Count'))
	),
	tar_target(
		n_by_class,
		sort(strsplit(literature$Class, ', ') |> unlist() |> table(), TRUE) |>
			data.table() |> setnames(new = c('Class', 'Count'))
	),
	tar_target(
		n_by_type,
		sort(strsplit(literature$Type, ', ') |> unlist() |> table(), TRUE) |>
			data.table() |> setnames(new = c('Type', 'Count'))
	)
)



# Targets: graphviz -------------------------------------------------------
targets_graphviz <- c(
	tar_file(
		into_prop_scrounger,
		'gv/into-prop-scrounger.gv'
	),
	tar_file(
		full_relationships,
		'gv/full-relationships.gv'
	),
	tar_file(
		habitat_and_producer,
		'gv/habitat-and-producer.gv'
	),
	tar_file(
		group_level,
		'gv/group-level-effects.gv'
	),
	tar_file(
		resources_risks_conditions,
		'gv/archive/resources-risks-conditions.gv'
	),

	tar_file(
		into_prop_scrounger_png,
		{system(paste('dot', into_prop_scrounger, '-Tpng -Gdpi=300  -o figures/into-prop-scrounger.png'));
			'figures/into-prop-scrounger.png'}
	),
	tar_file(
		full_relationships_png,
		{system(paste('dot', full_relationships, '-Tpng -Gdpi=300  -o figures/full-relationships.png'));
			'figures/full-relationships.png'}
	),
	tar_file(
		habitat_and_producer_png,
		{system(paste('dot', habitat_and_producer, '-Tpng -Gdpi=300  -o figures/habitat-and-producer.png'));
			'figures/habitat-and-producer.png'}
	),
	tar_file(
		group_level_png,
		{system(paste('dot', group_level, '-Tpng -Gdpi=300  -o figures/group-level.png'));
			'figures/group-level.png'}
	),
	tar_file(
		resources_risks_conditions_png,
		{system(paste('dot', resources_risks_conditions, '-Tpng -Gdpi=300  -o figures/resources-risks-conditions.png'));
			'figures/resources-risks-conditions.png'}
	)
)


# Targets: slides ---------------------------------------------------------
targets_slides <- c(
	tar_target(
		landscape_long,
		{
			landscape <- nlm_randomcluster(
				ncol = 30,
				nrow = 30,
				p = 0.4,
				ai = c(0.05, 0.45, 0.5),
				rescale = FALSE
			)
			as.data.frame(landscape, xy = TRUE)
		}
	)
)


# Targets: render ---------------------------------------------------------
targets_render <- c(
	tar_quarto(site)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)

