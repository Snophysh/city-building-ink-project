INCLUDE buildings/LionSmithy.ink
INCLUDE buildings/RoyalSmithy.ink
INCLUDE buildings/LeaningTankard.ink
INCLUDE buildings/GrandCathedral.ink
INCLUDE buildings/TheAcademy.ink
INCLUDE buildings/HealersHouse.ink
INCLUDE buildings/Apothecary.ink
INCLUDE buildings/LordsManor.ink
INCLUDE buildings/KnightsGuild.ink
INCLUDE buildings/LionsTavern.ink
INCLUDE buildings/MarketStrip.ink
INCLUDE buildings/LionsTheater.ink
INCLUDE buildings/RoyalGardens.ink
INCLUDE buildings/LionsInn.ink
INCLUDE locations/IndustrialDistrict.ink
INCLUDE locations/ReligiousDistrict.ink
INCLUDE locations/TownCenter.ink
INCLUDE locations/MarketAndArtsDictrict.ink
INCLUDE locations/ResidentialDistrict.ink

LIST CurrentLocation = industrial, religious, arts, residents, center

<em>The City of Gingera</em>

// Introduction

You arrive at the city.

* [Enter City] -> WestGate -> IndustrialDistrict

=== WestGate ===

You enter the west gate.

->->


=== Locations ===

+ {CurrentLocation != religious and CurrentLocation != residents}[Religious District] -> ReligiousDistrict
+ {CurrentLocation != industrial and CurrentLocation != arts}[Industrial District] -> IndustrialDistrict
+ {CurrentLocation != center}[Town Center] -> TownCenter
+ {CurrentLocation != industrial and CurrentLocation != arts}[Market & Arts District] -> MarketAndArtsDistrict
+ {CurrentLocation != religious and CurrentLocation != residents}[Residential District] -> ResidentialDistrict
+ {CurrentLocation == industrial}[West Gate] 
    Are you sure you want to leave the city?
    ** [Yes.] -> END
    ** [No.] -> IndustrialDistrict


= inside

+ [Exit.] ->->

// Game Functions

=== function came_from(-> x) 
	~ return TURNS_SINCE(x) == 0