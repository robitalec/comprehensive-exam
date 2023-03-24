library(ggdag)
library(ggplot2)
library(dagitty)

dagify(
	prop_scroungers ~ predation_risk + time_of_day + dominance + movement_cost + patch_finding_rate + group_size + patch_density + patch_distribution + sex + age + reproductive_status + social_affiliation + energy_reserves + finders_share,
	vigilance ~ group_size + predation_risk,
	dominance ~ age + sex,
	reproductive_status ~ sex,
	finders_share ~ movement_cost + patch_density + handling_time,
	outcome = 'prop_scroungers'
) |> ggdag()  + theme_dag() + scale_fill_manual(values = c('grey'))



# There are arrow towards proportion of scroungers



dagify(
	worthwhihile_contest ~ cost_of_contest + patch_defendability + information + predation_risk + dominance + relatedness,
	outcome = 'worthwhihile_contest'
) |> ggdag_status(text_col = 'black', node_size = 20)  + theme_dag()


# Also there are arrows towards should i engage in this contest
# Tolerance of scroungers if related to producer
