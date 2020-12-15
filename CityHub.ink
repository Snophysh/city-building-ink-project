INCLUDE buildings/LionSmithy.ink
INCLUDE buildings/RoyalSmithy.ink
INCLUDE buildings/LeaningTankard.ink
INCLUDE buildings/GrandCathedral.ink
INCLUDE buildings/TheAcademy.ink
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
INCLUDE locations/WestGate.ink


VAR playerName = "Kai"
VAR silverCoins = 20

LIST CurrentLocation = industrial, religious, arts, residents, center
LIST PlayerCharacterFlags = novicePoet, masterPoet
LIST Souvenirs = gingeraTunic
LIST Tasks = pickUpApothecaryBook

<em>The City of Gingera</em>

// Introduction

You are an apprentice to a herbalist from a small town nearby. Your mentor, Ria, has sent you to pick up some supplies and an important book from Gingera's local Apothecary. This is your first time visitng the city and while you are here on business you can't wait to explore what this town has to offer.

* [Enter City] -> WestGate -> IndustrialDistrict

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