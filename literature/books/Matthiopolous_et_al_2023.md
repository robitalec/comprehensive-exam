# Matthiopolous_et_al_2023

Matthiopoulos, Jason; Fieberg, John; Aarts, Geert. (2023). Species-Habitat Associations: Spatial data, predictive models, and ecological insights, 2nd edition. University of Minnesota Libraries Publishing. Retrieved from the University of Minnesota Digital Conservancy, http://hdl.handle.net/11299/217469.

---

## C1: The ecology behind species-habitat association models

### 1.2 How do living beings "see" the world around them?

Priority for an organism's fitness and distribution is whether it has a positive, negative or ambivalent relationship with aspects of its environment

Environment = resources + risks + conditions

#### 1.2.1 [resources](../topics/resources.md)

[resources](../topics/resources.md) are substances, objects or places in the environment required by an organism for normal growth, maintenance and reproduction 

Generally, [resources](../topics/resources.md) have a positive effect on fitness:

- (for plants) sunlight, carbon dioxide, minerals, water
- (for animals) prey, water, nesting spaces, resting spaces

In overabundance of [resources](../topics/resources.md) or high density of individuals, [resources](../topics/resources.md) can turn into risk with negative effects on fitness:

- large quantity of food consumed where food is poisonous at high doses
- excess light damaging photosynthetic machinery
- reduced resources due to intraspecific competition (conspecifics) or interspecific competition (heterospecifics)

#### 1.2.2 [risks](../topics/risks.md)

[risks](../topics/risks.md) are environmental variables lower the actual or perceived chances of individual survival or reproduction and have a negative effect on [fitness](../topics/fitness.md)

[risks](../topics/risks.md) shape distributions by influencing demographic rates ([predation](../topics/predation.md), ultimately death). Perception of risk may be just as influential, see Landre_et_al_2010. 

Presence of risks may limit actual presence of species, eg. where hosts are missing where parasites exist. 

[risks](../topics/risks.md) are often dynamic processes that are difficult to quantify. See Palmer_et_al_2017. 

#### 1.2.3 [conditions](../topics/conditions.md)

[conditions](../topics/conditions.md) are environmental variables that surround the organism and influence its functioning. 

- ambient temperature
- salinity
- humidity

[conditions](../topics/conditions.md) can have positive, negative or ambivalent effects on [fitness](../topics/fitness.md). Eg. outside of limits of ambient temperature, organisms can die or stop functioning properly. 

See Oddling_Smee_et_al_2013 for modification of [conditions](../topics/conditions.md) by organisms. 

#### 1.2.4 Interactions between [resources](../topics/resources.md), [risks](../topics/risks.md) and [conditions](../topics/conditions.md)

- [resources](../topics/resources.md) - [risks](../topics/risks.md)
	- "Is it worth the risk?" (Brown_and_Kotler_2004)
	- eg. [predation](../topics/predation.md) risks causing organisms to avoid high resource density areas (McNammara_and_Houston_1987)
	- Surviving individuals in areas of high risk will have lower resource competition which may lead to an increase in overall population fitness (Van_Leeuwen_et_al_2008)
- [resources](../topics/resources.md) - [conditions](../topics/conditions.md)
	- Environmental conditions influence on detection and intake of resources
	- eg. depth and sediment type on accessibility of marine invertebrates to predators (De_Goeij_and_Honkoop_2022)
- [risks](../topics/risks.md) - [conditions](../topics/conditions.md)
	- eg. detection risk of prey by predator given canopy cover (Brown_and_Koetler_2004)
- [resources](../topics/resources.md) - [risks](../topics/risks.md) - [conditions](../topics/conditions.md)
	- eg. warm blooded marine mammals in polar environments, balancing risk of hypothermia with prey resource under cold temperature conditions (Grady_et_al_2019)

### 1.3 What is a [habitat](../topics/habitat.md)?

Recommendation is at the outset of an analysis, define [habitat](../topics/habitat.md) as a point in environmental space whose dimensions are environmental variables ([resources](../topics/resources.md), [risks](../topics/risks.md), [conditions](../topics/conditions.md)). This [habitat](../topics/habitat.md) is aspatial and species agnostic but can be used to map onto geographic space and/or determine species specific associations. 

1. Is habitat a place or a set of circumstances?

A region in space intuitively captures the environmental variables. However this perspective has methodological disadvantages:
- requires space to be divided apriori into parts which presents challenges given nested spatial scales
- scale depends on species' mobility and perception
- environment is dynamic, changing seasonally or abruptly given anthropogenic or natural drivers
- models specific to one location can be challenging to use for predictions to new locations

2. Should habitat comprise just conditions or also include resources and risks?

For distribution of moving animals, resource selection functions (Manly_et_al_2002) initially included only food selection, later also incorporated conditions and risks. 

All three types of environmental variables ([resources](../topics/resources.md), [risks](../topics/risks.md) and [conditions](../topics/conditions.md)) ultimately influence fitness and distribution. Complex interactions between them prevent considering them in total isolation. Therefore, the definition of [habitat](../topics/habitat.md) necessarily includes all three. 

3. Is habitat specific specific or independent?

Problems with specific specific definitions of habitat:

- it is unknown apriori which environmental variables will be relevant to any focal species
- the inferred relationship between species and habitat is not binary and models must allow for gradients of suitability

### 1.4 What is a species-habitat association?

A species-habitat association connects habitats to observations of a species (at the individual, group or population levels). 

#### Associations between [habitat](../topics/habitat.md) and [fitness](../topics/fitness.md)

Habitat-associated fitness is the contribution of each unit of [habitat](../topics/habitat.md), X,  to the populations long term log-rate of change. Partial fitness (Matthiopolous_et_al_2015) can be interpreted as the fitness of population living in an environment of entirely habitat X.  

Mechanisms of habitat-associated fitness:

- sub-organismal
- level of physiological capabilities
- anatomy
- life history strategies

#### Associations between [[habitat]] and changes in species density
Organisms experiencing low [fitness](../topics/fitness.md) must relocate or face demographic consequences. Relation involves movement of individuals, groups or populations. Their movement trajectories are an indication animals response to environments. 

- movements that are localized, sinuous indicate high resource availability

The density of species that cannot relocate will be affected by habitat-mediated survival and reproduction. 

#### Associations between [habitat](../topics/habitat.md) and species density

Dynamics modify the relationship between [habitat](../topics/habitat.md) and species density. 

Spatial variation in density:

- does not reflect short term (minute/hour/day) mechanisms
- does reflect accumulated effects of processes operating at longer time scales (year/generations)


#### Fundamental and realized niche

Associations with fitness represent the fundamental niche of a species. The realized niche is represented by the eventual species distribution. The difference between these two are the dynamics represented by the associations between habitat and mechanisms of change in species distribution. Species distribution is not necessarily proportion to fitness. 

### 1.5 What mechanisms drive habitat-mediated changes in species density?

Dynamic mechanisms shape the relationship between [fitness](../topics/fitness.md) and species distribution

- individual level: relative use of habitats
- population level: demographic forces

#### 1.5.1 Behavioural selection

It is important to consider and incorporate the underlying mechanisms or emergent, accessibility constraints shaping individual movement into models. Voluntary movement is made up of decision to leave, and where to go. 

1. Stay or go, decision to leave. 

Patch departure rules, giving up times. See Charnov_1976, Brown_1988

[marginal-value-theorem](../topics/marginal-value-theorem.md) posits once an individual depletes local resources to a point where their intake is less than their average long term intake rate, they should leave the patch (Charnov_1976). 

Actual/perceived long term intake rate may change due to environmental change or learning abilities. Animal often cannot instantaneously determine what local intake rate is, so they need to learn.  Learning takes time and may lead to suboptimal decisions particularly if the environmental is unpredictable. 

See Ollason_1980, Biernaskie_et_al_2009, Kamil_et_al_2019, Riotte_Lambert_et_al_2019

2. Where to go

Animal may move:

- randomly, eg. isotropic or correlated random walks
- directed movement based on
	- sensory perception (Fagan_et_al_2013)
	- spatial memory (Bracis_2017)
	- information from conspecifics (Jesner_2018, Oliveira_Santos_2016, Merkle_2019)

Cognitive processes operate at several, widely different scales

#### 1.5.2 Demographic sorting

The distribution of all organisms (vs behavioural selection) is shaped by demographic processes highly dependent on spatially heterogeneous environmental variables. 

It is difficult to tease apart the contributions of demographic processes and animal mobility on distributions. Eg. selection bias of observations since animals tagged with eg. GPS trackers are alive in capture location and therefore demographic sorting has already taken place and we can only study their behavioural selection. 

### 1.6 When is species density a reliable reflection of habitat suitability?

Often we assume that high local density indicates that the local habitat is good for species. This is not necessarily the case, but if it is, the assumptions of the following null model can be used to related the intrinsic fitness of a habitat with species distribution. 

#### 1.6.1 Why do we need a null model for species-habitat associations?

Null models are mathematical constructs derived from sets of assumptions that form the basis for discussion on a physical process. Eg.

- logistic model of population dynamics
- model of perfect mixing in predator prey dynamics
- [marginal-value-theorem](../topics/marginal-value-theorem.md)
- neutral theory of biodiversity

For species-habitat associations, there has historically been an implicit null model without explicit mathematical formulation or assumptions. 

#### 1.6.2 Null model for habitat-driven demographic sorting

Assumptions

- highly mobile dispersal stage, all space is equally accessible to all of its propagules
- completely sessile reproductive stage, local density results from local habitat quality
- intrinsic population growth solely driven by habitat, with positive values everywhere
- local population growth declines with local density
- no interspecific competition

See the book for full derivation of these formulas

See Matthiopolous_et_al_2015 where population growth rate relates to fitness of a population

$N_{s, t+1} = N_{s, t} exp(F_{0}(x) - b N_{s, t})$

- $N_{s, t+1}$: local population density at t + 1
- $N_{s, t}$: local population density at t
- $F_{0}(x)$: intrinsic fitness value of habitat 
- $b$: attrition on population growth of an added individual

Where the population density is very small, growth rate is equal to the intrinsic growth rate. 

Where the population density is at an equilibrium local density, attrition caused by density dependence annuls the benefits of habitat and the equilibrium distribution is proportional to intrinsic growth rate. 

#### 1.6.3 A null model for habitat selection
Building on [Fretwell_and_Lucas_1969](../papers/Fretwell_and_Lucas_1969.md) who consider the distribution of an ideal free species a purely behavioural phenomenon without demographic sorting. 

Assumptions

- individuals are ideal, aware of the value of all patches and make rational ideal choices
- individuals are free, they can select any patch and all individual are identical

The first individual will select the patch with the highest baseline suitability rate. By using this patch, the suitability with decrease. This is repeated for all individuals and eventually all patches will have equal suitability.  

See the book for full derivation of these formulas

$S(x, N_{s, t}) = B_{x} - f(N_{s, t})$

- $S$: suitability of a given location
- $x$: set of environmental variables
- $N_{s, t}$: density 
- $B_{x}$: baseline suitability
- $f$: growth rate/fitness

Mechanisms: [interference](../topics/interference.md) and [scramble-competition](../topics/scramble-competition.md) (Krivan_et_al_2008)

Under the first assumption, the baseline suitability is approximately the intrinsic value of the habitat (at low density) and the suitability is approximately the fitness/growth rate. 

For each population there will be a unique [ideal-free-distribution](../topics/ideal-free-distribution.md) M. Where fitness declines linearly with local population size and where the population size M is at carrying capacity, we can set the equation equal to 0 and solve. 

$N_{S}^{*}  = F_{0} / b$

The  relationship between density and habitat suitability or fitness is identical to that for the ideal life history organism when the total population size is at carrying capacity. 


#### 1.6.4 Is population size or population growth a better proxy for [fitness](../topics/fitness.md)?

Data on intrinsic growth rate are difficult to collect and observe since they require small population sizes. At equilibrium, "bad" patches will have locally extinct populations. If a limiting resource driving fitness is depletable, the abundance and distribution will differ between low and high densities. 

At earlier stages of population growth and resource depletion, the correlation between food distribution and growth rates delivers an informative species-habitat association. At equilibrium distribution, depletion distorts inferences. Equilibrium density of the consumer will yield no relationship with food density but a strong positive relationship with food production/replenishment/productivity. 

### 1.7 When are assumptions of null models violated?

Proportional relationships between distribution and density is violated by 

1. Non linear relationships
2. Equilibrium never reached due to demography, mobility and changing environments

#### 1.7.1 When relationship between species density and fitness is non linear

Observations only capture occupancy/vacancy rather than continuous measures of suitability

Species density and fitness can also be positively related eg. where increasing group size results in decreased [predation](../topics/predation.md) risks, increases information transfer and services and allee effects (see Allee_1951, Stephens_and_Sutherland_1999). 

#### 1.7.2 When species occur at places with negative fitness

Organisms are often encountered in poor quality habitats 

- transient state (Matthiopolous_et_al_2020)
- extinction debt where individuals are pushed to poor quality habitats, time lag as population declines

Zero niche paradox: viable animal populations in landscapes with no points of positive fitness. This can occur due to transient resources or conditions, or movement to enture overall positive fitness considering resources, risks and conditions. 

#### 1.7.3 When species do not occur at places of positive fitness

- Colonization credit (Watts_et_al_2020)
- Mismatches may be due to imperfect [information](../topics/information.md) or dynamic environments
- Site fidelity (Matthiopolous_et_al_2005)
- Eltonian viewpoint (Soberon_2007)
- Landscapes of fear

### 1.8 The species-habitat association model we wish for and the species-habitat association model we have

Key desire to assume: pseudo equilibrium assumption where presence is suitable and absence is unsuitable. 

Guisan_and_Huiller_2005
Gallion_et_al_2012

Mechanisms that violate null models:

- species abundance not consistently indicative of habitat suitability gradients
- species survive in areas of negative fitness
- extinction debts
- colonization credits

So far, species distribution models inferences are only valid under the assumptions of the null model. Next, 

1. difference between [fitness](../topics/fitness.md) and distribution
2. what mechanisms make them different and violate the assumptions of the null model
3. add model features to correct for these differences

### 1.9 A puritan taxonomy of species distribution models

Species distribution models
- Mechanistic
- Empirical
	- Spatial interpolation
	- Habitat based
		- Use only
		- Use availability
			- Counts
			- Presence/absence
			- Point process

See citations