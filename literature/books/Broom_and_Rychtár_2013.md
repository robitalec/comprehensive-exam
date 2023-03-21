# Broom_and_Rychtár_2013

Broom, M. and Rychtár, J., 2013. Game-theoretical models in biology. CRC Press.

---

## Chapter 17 - Food competition

Animal often forage in groups. See more in [Krause_and_Ruxton_2002](Krause_and_Ruxton_2002.md)

- Advantages
	- antipredator vigilance
	- dilution effect
	- predator confusion
	- foraging benefits
	- finding mates
	- conserving heat
	- conserving energy
- Disadvantages
	- increased attack rate
	- kleptoparasitism
	- interference
	- reduced local food supply
	- increased rate of aggression

### 17.2 [ideal-free-distribution](../ideal-free-distribution.md) for a single species

See [Fretwell_and_Lucas_1969](../papers/Fretwell_and_Lucas_1969.md)

- n potential patches
- quality of patches differ ($B_{i}$)
- individuals are essentially identical
- within patch, individuals have equal forage rate
- payoff ($R_{i}$) is determined by patch area and density of conspecifics  ($d_{i}$)

$R_{i} (d_{i}) = B_{i} - f_{i}(d)_{i})$

$f_{i}$ is a non-negative, increasing and continuous function

Individuals are **ideal**:
- they can judge precisely which patch will maximize their survival and reproduction
- they are rational individuals with perfect information

Individuals area **free**: 
- there is no cost or restriction to move between patches

See Charnov_1976, DeAngelis_et_al_2011 for models with movement costs

See ESS for the ideal free distribution game in Cressman_et_al_2004 and Cressman_and_Krivan_2006

### 17.2 Multiple species

See Krivan_et_al_2008

### 17.3 Comparmental models of kleptoparasitism

See Iyengar_2008

### 17.6 Comparmental models of interference

Kleptoparasitism is direct steal. Interference is reduced foraging efficiency of an individual due to negative actions of other individuals, eg. aggressive territory defense. 

Interference does not have a direct benefit to the individual therefore there is no obvious strategic element and is not exactly a game. 

### 17.7 Producer-scrounger models

See Barnard_and_Sibly_1981, Caraco_and_Giraldeau_1991, Vickery_et_al_1991, Dubois_et_al_2003, Dubois_and_Giraldeau_2005

Kleptoparasitism and interference consider food as a single, indivisible item that can only be stolen not shared. 

Producer-scrounger models:
- finder discovers food
- finder can start eating right away with minimal handling time
- one or more individuals (scroungers) find the food after the finder
- individuals can steal, share or divide the food


#### 17.7.1 Finder-joiner (Dubois_et_al_2003)

- 2 individuals
- sequential hawk-dove game where finder chooses strategy first
- assumption that the finder and joiner know $a$ (the finder's share already consumed)

Parameters

- $F$: total value of patch, eg. number of food items
- $a$: finder's share of patch alread consumed
- $C$: energetic cost of fight when two hawks meet
- $\alpha$: probability of finder winning the contest

See 10.1.2 and Exercise 10.1 for ESS


#### 17.7.2 Finder-joiner with partial information

Finder's strategy depends on $F$, $a$, $C$, $\alpha$ whereas the joiner's strategy depends only on $F$, $a$, $C$

When the finder plays hawk, it is an indication to the joiner that there is food remaining that is worth fighting for. Although the finder knows more, it is a disadvantage because it signals to the joiner which strategy to select and the finder has an overall lower payoff then in 17.7.1. 

### 17.9 Further reading

- [ideal-free-distribution](../ideal-free-distribution.md) and ESS
