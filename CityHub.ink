<em>The City of Gingera</em>

// Introduction

You arrive at the city.

* [Enter City] -> WestGate -> IndustrialDistrict

=== WestGate ===

You enter the west gate.

->->

=== IndustrialDistrict ===

You have entered the Industrial District

<- buildings
<- Locations

= buildings

+ [Royal Smithy]
+ [The Leaning Tankard]
+ [Lion's Smithy]

=== ReligiousDistrict ===

You have entered the Religious District

<- buildings
<- Locations

= buildings

+ [Grand Cathedral]
+ [The Academy]
+ [Healers House]
+ [Apothecary]

=== TownCenter ===

You have entered the Town Center

<- buildings
<- Locations

= buildings

+ [The Lord's Manor]
+ [Knights Guild]
+ [Lion's Tavern]

=== MarketAndArtsDistrict ===

You have entered the Market & Arts District

<- buildings
<- Locations

= buildings

+ [Market Strip]
+ [Lion's Theater]
+ [Royal Gardens]
+ [Lion's Inn]

=== ResidentialDistrict ===

You have entered the Residential District

<- Locations


=== Locations ===

+ {not came_from(-> ReligiousDistrict) and not came_from(-> ResidentialDistrict)}[Religious District] -> ReligiousDistrict
+ {not came_from(-> IndustrialDistrict) and not came_from(-> MarketAndArtsDistrict)}[Industrial District] -> IndustrialDistrict
+ {not came_from(-> TownCenter)}[Town Center] -> TownCenter
+ {not came_from(-> IndustrialDistrict) and not came_from(-> MarketAndArtsDistrict)}[Market & Arts District] -> MarketAndArtsDistrict
+ {not came_from(-> ReligiousDistrict) and not came_from(-> ResidentialDistrict)}[Residential District] -> ResidentialDistrict

// Game Functions

=== function came_from(-> x) 
	~ return TURNS_SINCE(x) == 0