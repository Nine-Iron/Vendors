local britaMod = nil;
local brita_2Mod = nil;
local GreenFireMod = nil;

local salesTotal = 0;
vendorsJewelry = {};
vendorsJewelry.prices = {};
vendorsTools = {};
vendorsVehicles = {};
vendorsWeapons = {};
vendorsJewelry.green = {};
vendorsBook = {};


------------------------------  SELL ITEMS -----  If you want to add items to the list of items you can sell, put them in this list.
--- EXAMPLE  -- {"itemType", price}   {"BaseballBat", 30}  Make sure there is a comma between each item...   {{"BaseballBat", 30}, {"Book", 10}};

--REMOVE THE TWO HYPHENS BEFORE vendorsSellables or Vendors will not read the list.
--vendorsSellables = {{"BaseballBat", 30}}; ---THIS IS THE LIST


--[[ To edit prices, you only need to change the number value.

You can completely overwrite the vendorsWeapons tables now.  You will still need the same amount of tables(8 for vanilla, 10 for Brita), but for any that you don't want to use just leave it as 
vendorsWeapons[8] = {""};
if you only want one table it would like like this:
vendorsWeapons[1] = {"YOURLABEL", {"BaseballBat", 30, nil, ""};  -- If you want "YOURLABEL" to be translated then you will need to add that to the translation files located in lua\shared\Translate
vendorsWeapons[2] = {""};
vendorsWeapons[3] = {""};
vendorsWeapons[4] = {""};
vendorsWeapons[5] = {""};
vendorsWeapons[6] = {""};
vendorsWeapons[7] = {""};
vendorsWeapons[8] = {""};

You can add any item you would like to the weaponsVendor tables, use this format:
{"itemType", price, nil, ""}
{"BaseballBat", 30, nil, ""}



If you want dog tags to sell for $100 simply change:
vendorsJewelry.prices.tags = 50;
to
vendorsJewelry.prices.tags = 100;



To change the prices for items like the lighter:
{"Lighter", 45}
change it to 
{"Lighter", 100}



Engine Parts:
$20000 for 30 spare parts
{20000, 30}
change it like:
{1000, 100}
would be $1000 for 100 spare parts


Items such as 
{"ShotgunShellsBox", 150, true}
would be
{"ShotgunShellsBox", 100, true}

The true and false is for selling or buying quantities.  I would not suggest changing those, changing it to false would be safe.  Changing it to true could break the mod and would probably only work for guns.  Then you would have options to buy 1, 10 or 25 of that gun.


 You can also add or remove items.  If you want to add an item, simply pick the list you want to add it to and use the format -- {"ItemName", price}  Do not insert items to the very beginning of the list, it can be inserted after the label.  If you add or remove items make sure you remove or add separating commas between each item or the mod will break.
]]


-- jewelry prices
-- tags are for Dog Tags, stones are jewelry with gems, regular is just silver, gold, watches and locket items
vendorsJewelry.prices.tags = 50;
vendorsJewelry.prices.stones = 25;
vendorsJewelry.prices.regular = 10;

-- tool prices are listed here
				  -- label        	items
vendorsBooks[1] = {"GeneralReading", {"Book", 40}, {"ComicBook", 25}, {"HottieZ", 50}, {"Magazine", 25}, {"Newspaper", 15}};
vendorsBooks[2] = {"Magazines_Skill", {"FishingMag1", 400}, {"FishingMag2", 400}, {"ElectronicsMag1", 400}, {"ElectronicsMag2", 400}, {"ElectronicsMag3", 400}, {"ElectronicsMag5", 400}, {"EngineerMagazine1", 400}, {"EngineerMagazine2", 400}, {"CookingMag1", 400}, {"CookingMag2", 400}, {"Radio.RadioMag1", 400}, {"Radio.RadioMag2", 400}, {"Radio.RadioMag3", 400}, {"ElectronicsMag4", 400}, {"MechanicMag1", 400}, {"MechanicMag2", 400}, {"MechanicMag3", 400}, {"FarmingMag1", 400}, {"HerbalistMag", 400}, {"HuntingMag1", 400}, {"HuntingMag2", 400}, {"HuntingMag3", 400}, {"MetalworkMag1", 400}, {"MetalworkMag2", 400}, {"MetalworkMag3", 400}, {"MetalworkMag4", 400}};
vendorsBooks[3] = {"Maps", {"MarchRidgeMap", 60}, {"MuldraughMap", 60}, {"RiversideMap", 60}, {"RosewoodMap", 60}, {"WestpointMap", 60}};
vendorsBooks[4] = {"SkillBooks", {"BookCarpentry1", 750}, {"BookCarpentry2", 750}, {"BookCarpentry3", 750}, {"BookCarpentry4", 750}, {"BookCarpentry5", 750}, {"BookCooking1", 750}, {"BookCooking2", 750}, {"BookCooking3", 750}, {"BookCooking4", 750}, {"BookCooking5", 750}, {"BookElectrician1", 750}, {"BookElectrician2", 750}, {"BookElectrician3", 750}, {"BookElectrician4", 750}, {"BookElectrician5", 750}, {"BookFarming1", 750}, {"BookFarming2", 750}, {"BookFarming3", 750}, {"BookFarming4", 750}, {"BookFarming5", 750}, {"BookFirstAid1", 750}, {"BookFirstAid2", 750}, {"BookFirstAid3", 750}, {"BookFirstAid4", 750}, {"BookFirstAid5", 750}, {"BookFishing1", 750}, {"BookFishing2", 750}, {"BookFishing3", 750}, {"BookFishing4", 750}, {"BookFishing5", 750}, {"BookForaging1", 750}, {"BookForaging2", 750}, {"BookForaging3", 750}, {"BookForaging4", 750}, {"BookForaging5", 750}, {"BookMechanic1", 750}, {"BookMechanic2", 750}, {"BookMechanic3", 750}, {"BookMechanic4", 750}, {"BookMechanic5", 750}, {"BookMetalWelding1", 750}, {"BookMetalWelding2", 750}, {"BookMetalWelding3", 750}, {"BookMetalWelding4", 750}, {"BookMetalWelding5", 750}, {"BookTrapping1", 750}, {"BookTrapping2", 750}, {"BookTrapping3", 750}, {"BookTrapping4", 750}, {"BookTrapping5", 750}};


vendorsTools[1] = {"Camping", {"SharpedStone", 25}, {"Lighter", 45}, {"PercedWood", 50}, {"WoodenStick", 50}};
vendorsTools[2] = {"Construction", {"Axe", 100}, {"BucketEmpty", 250}, {"Crowbar", 75}, {"Hammer", 45}, {"Needle", 25}, {"Paintbrush", 25}, {"PropaneTank", 125}, {"BlowTorch", 250}, {"Saw", 75}, {"Screwdriver", 50}, {"AxeStone", 75}, {"HammerStone", 50}, {"WeldingMask", 50}};
vendorsTools[3] = {"Cooking", {"BakingPan", 45}, {"Bowl", 250}, {"BoxOfJars", 50}, {"JarLid", 50, 6}, {"TinOpener", 50}, {"Pot", 50}, {"Pan", 45}, {"KitchenKnife", 250}, {"Kettle", 50}, {"RollingPin", 25}, {"BakingPan", 50}, {"Saucepan", 50}};
vendorsTools[4] = {"Farming", {"farming.GardeningSprayEmpty", 75}, {"farming.WateredCan", 100}, {"Fertilizer", 75}, {"EmptySandbag", 25}, {"farming.Shovel", 100}, {"farming.HandShovel", 100}};
vendorsTools[5] = {"Fishing", {"FishingNet", 75}, {"FishingRod", 100}, {"FishingTackle", 45}};
vendorsTools[6] = {"Light", {"Torch", 75}, {"Matches", 50}}
vendorsTools[7] = {"Mechanics", {"PetrolCan", 100}, {"Jack", 75}, {"LugWrench", 75}, {"TirePump", 75}, {"Wrench", 75}};
vendorsTools[8] = {"Stationery", {"Notebook", 50}, {"Eraser", 50}, {"Journal", 50}, {"Pen", 50}, {"Pencil", 50}, {"SheetPaper2", 50}};
vendorsTools[9] = {"Trapping", {"TrapCage", 75}, {"TrapMouse", 25}, {"TrapSnare", 60}, {"TrapStick", 50}, {"TrapBox", 60}, {"TrapCrate", 60}};



vendorsVehicles = {};
vendorsVehicles.parts = {};
-- vehicle part prices are listed here
-- standard vehicle parts      
vendorsVehicles.parts[1] = {{"CarBattery1", 500}, {"FrontCarDoor1", 500}, {"EngineDoor1", 500}, {"ModernBrake1", 500}, {"TrunkDoor1", 500}, {"RearCarDoor1", 500}, {"RearCarDoorDouble1", 500}, {"BigGasTank1", 500}, {"ModernCarMuffler1", 500}, {"NormalCarSeat1", 500}, {"ModernSuspension1", 500}, {"ModernTire1", 500}, {"Windshield1", 500}, {"RearWindshield1", 500}, {"FrontWindow1", 500}, {"RearWindow1", 500}, "Standard"};

-- sport vehicle parts
vendorsVehicles.parts[2] = {{"CarBattery3", 1000}, {"FrontCarDoor3", 1000}, {"EngineDoor3", 1000}, {"ModernBrake3", 1000}, {"TrunkDoor3", 1000}, {"RearCarDoor3", 1000}, {"RearCarDoorDouble3", 1000}, {"BigGasTank3", 1000}, {"ModernCarMuffler3", 1000}, {"NormalCarSeat3", 1000}, {"ModernSuspension3", 1000}, {"ModernTire3", 1000}, {"Windshield3", 1000}, {"RearWindshield3", 1000}, {"FrontWindow3", 1000}, {"RearWindow3", 1000}, "Sport"};

-- heavy duty vehicle parts
vendorsVehicles.parts[3] = {{"CarBattery2", 2000}, {"FrontCarDoor2", 2000}, {"EngineDoor2", 2000}, {"ModernBrake2", 2000}, {"TrunkDoor2", 2000}, {"RearCarDoor2", 2000}, {"RearCarDoorDouble2", 2000}, {"BigGasTank2", 2000}, {"ModernCarMuffler2", 2000}, {"NormalCarSeat2", 2000}, {"ModernSuspension2", 2000}, {"ModernTire2", 2000}, {"Windshield2", 2000}, {"RearWindshield2", 2000}, {"FrontWindow2", 2000}, {"RearWindow2", 2000}, "Heavy-Duty"};

						--     Price  Quantity
vendorsVehicles.engineParts = {20000, 30};


vendorsWeapons = {};
-- weapon prices are listed here 


-- IF YOU USE BRITA edit the prices at the end of this file, not these.

-- if you add weapons make sure to add the caliber(as listed in the caliber table here(vendorsWeapons[4])) or the weapon/magazine will not show up in the menu

vendorsWeapons[1] = {"Box_Ammo", {"ShotgunShellsBox", 150, true}, {"223Box", 250, true}, {"308Box", 250, true}, {"Bullets38Box", 100, true}, {"Bullets45Box", 100, true}, {"556Box", 200, true}};
vendorsWeapons[2] = {"Magazines", {"223Clip", 300, false, ".223-REM"}, {"308Clip", 300, false, ".308"}, {"44Clip", 250, false, ".44-MAG"}, {"45Clip", 250, false, ".45 Auto"}, {"556Clip", 350, false, "5.56"}, {"M14Clip", 300, false, ".308"}, {"9mmClip", 300, false, "9mm"}};
vendorsWeapons[3] = {"Attachments", {"ChokeTubeImproved", 200, false, "Barrel"}, {"FiberglassStock", 150, false, "Stock"}, {"IronSight", 100, false, "Sight"}, {"Laser", 200, false, "Side"}, {"RecoilPad", 100, false, "Stock"}, {"RedDot", 200, false, "Sight"}, {"Sling", 150, false, "Bottom"}, {"x2Scope", 300, false, "Sight"}, {"x4Scope", 350, false, "Sight"}, {"x8Scope", 400, false, "Sight"}};
vendorsWeapons[4] = {"Caliber", ".223-REM", ".308", ".44-MAG", ".45 Auto", "5.56", "9mm"};
vendorsWeapons[5] = {"Pistols", {"Pistol", 2500, false, "9mm"}, {"Pistol2", 3000, false, ".45 Auto"}, {"Pistol3", 3000, false, ".44-MAG"}, {"Revolver_Long", 2000, false, ".44-MAG"}, {"Revolver", 2000, false, ".45 Auto"}, {"Revolver_Short", 1500, false, ".38-SPC"}};
vendorsWeapons[6] = {"Shotguns", {"DoubleBarrelShotgun", 750, false, "12g"}, {"Shotgun", 2500, false, "12g"}};
vendorsWeapons[7] = {"Rifles", {"AssaultRifle2", 7500, false, ".308"}, {"AssaultRifle",  10000, false, "5.56"}, {"VarmintRifle", 3500, false, ".223-REM"}, {"HuntingRifle", 4500, false, ".308"}};
vendorsWeapons[8] = {"Slots", "Barrel", "Bottom", "Side", "Sight", "Stock"};


vendorsJewelry[0] = {};
vendorsJewelry[1] = {};
vendorsJewelry.stones = {};
vendorsJewelry.regular = {};
vendorsJewelry.tags = {};
vendorsFoods = {};


-- food prices are listed here
vendorsFoods[1] = {"Canned_Goods", {"TinnedBeans", 50}, {"CannedChili", 50}, {"CannedCorn", 50}, {"CannedCornedBeef", 50}, {"CannedFruitCocktail", 50}, {"CannedMushroomSoup", 50}, {"CannedPeaches", 50}, {"CannedPeas", 50}, {"CannedPineapple", 50}, {"CannedPotato2", 50}, {"CannedSardines", 50}, {"TinnedSoup", 50}, {"CannedBolognese", 50}, {"CannedTomato2", 50}, {"TunaTin", 50}};
vendorsFoods[2] = {"Condiments", {"SugarBrown", 10}, {"Hotsauce", 10}, {"Ketchup", 10}, {"MapleSyrup", 10}, {"Marinara", 10}, {"farming.MayonnaiseFull", 10}, {"Mustard", 10}, {"OilOlive", 10}, {"Pepper", 10}, {"RiceVinegar", 10}, {"Salt", 10}, {"Soysauce", 10}, {"Sugar", 10}, {"OilVegetable", 10}, {"Wasabi", 10}};
vendorsFoods[3] = {"Drinks", {"BeerBottle", 60}, {"BeerCan", 60}, {"Bleach", 60}, {"WhiskeyFull", 60}, {"ColdDrinkSpiffo", 60}, {"Mugfull", 60}, {"HotDrinkTea", 60}, {"OilOlive", 60}, {"JuiceBox", 60}, {"Milk", 60}, {"PopBottle", 60}, {"Wine2", 60}, {"Wine", 60}};
vendorsFoods[4] = {"Fish", {"Bass", 75}, {"Catfish", 75}, {"Crappie", 75}, {"Crayfish", 75}, {"FishFillet", 75}, {"FishRoe", 75}, {"BaitFish", 75}, {"Lobster", 75}, {"Oysters", 75}, {"Perch", 75}, {"Pike", 75}, {"Salmon", 75}, {"Shrimp", 75}, {"Squid", 75}, {"SquidCalamari", 75}, {"Panfish", 75}, {"Trout", 75}};
vendorsFoods[5] = {"Game", {"DeadBird", 40}, {"DeadMouse", 40}, {"DeadRabbit", 40}, {"DeadRat", 40}, {"DeadSquirrel", 40}, {"Rabbitmeat", 40}, {"Smallanimalmeat", 40}, {"Smallbirdmeat", 40}};
vendorsFoods[6] = {"Pickled_Food", {"CannedBellPepper", 40}, {"CannedBroccoli", 40}, {"CannedCabbage", 40}, {"CannedCarrots", 40}, {"CannedEggplant", 40}, {"CannedLeek", 40}, {"CannedPotato", 40}, {"CannedRedRadish", 40}, {"CannedTomato", 40}};
vendorsFoods[7] = {"Proteins", {"farming.Bacon", 100}, {"BeefJerky", 100}, {"Chicken", 100}, {"EggCarton", 100}, {"FrogMeat", 100}, {"Ham", 100}, {"MeatPatty", 100}, {"MincedMeat", 100}, {"MuttonChop", 100}, {"Pepperoni", 100}, {"PorkChop", 100}, {"Salami", 100}, {"Sausage", 100}, {"Steak", 100}, {"Tofu", 100}};
vendorsFoods[8] = {"Medical", {"AlcoholWipes", 40}, {"Antibiotics", 75}, {"PillsAntiDep", 75}, {"Bandage", 40}, {"PillsBeta", 40}, {"Disinfectant", 75}, {"Cigarettes", 40}, {"FirstAidKit", 100}, {"Pills", 75}, {"AlcoholBandage", 60}, {"PillsVitamins", 75}, {"Splint", 80}, {"SutureNeedle", 40}, {"SutureNeedleHolder", 40}, {"Tweezers", 40}};

-- Green Fire and Brita items are inside this function
function VendorsPrices_CheckMods()
	britaMod = getActivatedMods():contains("Brita");
	brita_2Mod = getActivatedMods():contains("Brita_2");
	GreenFireMod = getActivatedMods():contains("jiggasGreenfireMod");
	filibuster = getActivatedMods():contains("FRUsedCars");
	if britaMod then
		-- Brita weapons ------------------------------------
		-- if you add weapons make sure to add the caliber(as listed in the caliber table here(vendorsWeapons[4])) or the weapon/magazine will not show up in the menu
		vendorsWeapons[1] = {"Box_Ammo", {"ShotgunShellsBox", 150, true}, {"40HERound", 10000, true}, {"40INCRound",  12000, true}, {"Bullets22Box", 100, true}, {"223Box", 250, true}, {"3006Box", 250, true}, {"308Box", 250, true}, {"Bullets357Box", 150, true}, {"Bullets38Box", 100, true}, {"Bullets380Box", 150, true}, {"Bullets44Box", 150, true}, {"Bullets4570Box", 200, true}, {"Bullets45Box", 300, true}, {"Bullets45LCBox", 200, true}, {"545x39Box", 400, true}, {"556Box", 450, true}, {"Bullets57Box", 200, true}, {"Bullets50MAGBox", 500, true}, {"50BMGBox", 550, true}, {"762x39Box", 500, true}, {"762x51Box", 500, true}, {"762x54rBox", 500, true}};
		vendorsWeapons[2] = {"Magazines", {"12gDrum", 1750, false, "12g"}, {"SPASClip", 300, false, "12g"}, {"SIX12_Cylinder", 2500, false, "12g"}, {"22Drum", 1750, false, ".22-LR"}, {"22ExtClip", 300, false, ".22-LR"}, {"22Clip", 300, false, ".22-LR"}, {"223Clip", 300, false, ".223-REM"}, {"223ExtClip", 300, false, ".223"}, {"1903Clip", 300, false, "30-06 SPRG"}, {"3006ExtClip", 300, false, "30-06 SPRG"}, {"308Belt", 1750, false, ".308"}, {"308MiniCan", 300, false, ".308"}, {"308StdClip", 300, false, ".308"}, {"308ExtClip", 300, false, ".308"}, {"357Speed", 300, false, ".357-MAG"}, {"38Clip", 300, false, ".38-SPC"}, {"38Speed", 300, false, ".38-SPC"}, {"380ExtClip", 300, false, ".380-ACP"}, {"380Clip", 300, false, ".380-ACP"}, {"44Clip", 250, false, ".44-MAG"}, {"44Speed", 300, false, ".44-MAG"}, {"45Clip", 250, false, ".45-ACP"}, {"45ExtClip", 300, false, ".45-ACP"}, {"45DSClip", 300, false, ".45-ACP"}, {"45DSExtClip", 300, false, ".45-ACP"}, {"45Drum", 1750, false, ".45-ACP"}, {"45LCSpeed", 300, false, ".45-LC"}, {"50MiniCan", 300, false, ".50 BMG"}, {"M82Clip", 350, false, ".50 BMG"}, {"545Drum", 1750, false, "5.45"}, {"545StdClip", 300, false, "5.45"}, {"556Belt", 1750, false, "5.56"}, {"556Drum", 1750, false, "5.56"}, {"556Clip", 350, false, "5.56"}, {"556MiniCan", 350, false, "5.56"}, {"57Clip", 350, false, "5.7x28"}, {"P90Clip", 350, false, "5.7x28"}, {"M14Clip", 300, false, ".308"}, {"762x39Belt", 1750, false, "7.62x39"}, {"762Drum", 1750, false, "7.62x39"}, {"AKClip", 350, false, "7.62x39"}, {"SKSClip", 350, false, "7.62x39"}, {"762x54rBelt", 1750, false, "7.62x54"}, {"SVDClip", 350, false, "7.62x54"}, {"MosinClip", 350, false, "7.62x54"}, {"9mmClip", 300, false, "9mm"}, {"9mmExtClip", 300, false, "9mm"}, {"9mmDrum", 1750, false, "9mm"}, {"ASHClip", 300, false, ".50 MAG"}};
		vendorsWeapons[3] = {"Attachments", {"Sight_3xEOTech", 350, false, "Sight"}, {"Sight_4xACOG", 350, false, "Sight"}, {"Sight_Aimpoint_Dot", 350, false, "Sight"}, {"Sight_Thermal", 350, false, "Sight"}, {"Laser_PEQ15", 350, false, "Side"}, {"Choke_Full", 200, false, "Barrel"}, {"ChokeTubeImproved", 200, false, "Barrel"}, {"FiberglassStock", 150, false, "Stock"}, {"Sight_Malcom", 450, false, "Sight"}, {"IronSight", 100, false, "Sight"}, {"Laser", 200, false, "Side"}, {"Light_Large", 200, false, "Side"}, {"Light_Small", 100, false, "Side"}, {"Sight_VX3", 450, false, "Sight"}, {"RecoilPad", 100, false, "Stock"}, {"Pad", 100, false, "Stock"}, {"RedDot", 200, false, "Sight"}, {"Sight_G28_Scope", 450, false, "Sight"}, {"Sling_1", 150, false, "Bottom"}, {"Sling_2", 150, false, "Bottom"}, {"Sling_3", 150, false, "Bottom"}, {"Launcher", 1250, false, "Bottom"}, {"Suppressor_BMG", 500, false, "Barrel"}, {"Suppressor_ROME_BMG", 550, false, "Barrel"}, {"Suppressor_Pistol", 400, false, "Barrel"}, {"Suppressor_SOCOM_Pistol", 450, false, "Barrel"}, {"Suppressor_Shotgun", 450, false, "Barrel"}, {"Suppressor_Rifle", 450, false, "Barrel"}, {"Suppressor_PBS1_Rifle", 550, false, "Barrel"}, {"x2Scope", 300, false, "Sight"}, {"x4Scope", 350, false, "Sight"}, {"x8Scope", 400, false, "Sight"}};
		vendorsWeapons[4] = {"Caliber", "12g", ".22-LR", ".223-REM", "30-06 SPRG", ".308", ".357-MAG", ".38-SPC", ".380-ACP", ".44-MAG", ".45-ACP", ".45-LC", "5.45", "5.56", "5.7x28", ".50 MAG", ".50 BMG", "7.62x39", "7.62x54", "9mm"};
		vendorsWeapons[5] = {"Pistols", {"Automag", 3500, false, ".44-MAG"}, {"B93R", 3000, false, "9mm"}, {"M9", 3000, false, "9mm"}, {"M9A3", 3000, false, "9mm"}, {"CZ75", 3000, false, "9mm"}, {"G17", 3000, false, "9mm"}, {"G18", 3000, false, "9mm"}, {"G21", 3000, false, ".45-ACP"}, {"G42", 3000, false, ".380-ACP"}, {"HK_USP", 3500, false, ".44-MAG"}, {"Pistol3", 3000, false, ".44-MAG"}, {"Pistol2", 3000, false, ".45 Auto"}, {"Revolver_Long", 2000, false, ".44-MAG"}, {"Revolver", 2000, false, ".45 Auto"}, {"Revolver_Short", 1500, false, ".38-SPC"}, {"M4506", 3000, false, ".45-ACP"}, {"M5238", 3000, false, ".38-SPC"}, {"M5906", 3000, false, "9mm"}, {"Pistol", 2500, false, "9mm"}};
		vendorsWeapons[6] = {"Shotguns", {"DAO12", 2500, false, "12g"}, {"AA12", 4500, false, "12g"}, {"DT11", 2500, false, "12g"}, {"CAWS", 4500, false, "12g"}, {"DoubleBarrelShotgun", 750, false, "12g"}, {"Shotgun", 2500, false, "12g"}, {"SIX12SD", 6500, false, "12g"}};
		vendorsWeapons[7] = {"Rifles", {"AK103", 7500, false, "7.62x39"}, {"AK12_New", 7500, false, "5.45"}, {"AK47", 7500, false, "7.62x39"}, {"AK74", 7500, false, "5.45"}, {"AKM", 7500, false, "7.62x39"}, {"M4A1", 8500, false, "5.56"}, {"DR_200", 7500, false, "5.56"}, {"K2_1", 7500, false, "5.56"}, {"SVDK",  10000, false, "7.62x54"}, {"EDM96",  12000, false, ".50 BMG"}, {"Gepard_M6",  12000, false, ".50 BMG"}, {"G11K3", 7500, false, "5.7x28"}, {"G36KV", 7500, false, "5.56"}, {"HuntingRifle", 4500, false, ".308"}, {"AssaultRifle2", 7500, false, ".308"}, {"AssaultRifle",  10000, false, "5.56"}, {"M40A1", 7500, false, ".308"}, {"M40A3", 7500, false, ".308"}, {"VarmintRifle", 3500, false, ".223-REM"}};
		vendorsWeapons[9] = {"SMGs", {"CAR15SMG", 6000, false, "5.56"}, {"K1_1", 6000, false, "5.56"}, {"K7_Stock", 6000, false, "9mm"}};
		vendorsWeapons[10] = {"LMGs", {"K3LMG",  12000, false, "5.56"}, {"G21LMG",  12000, false, ".308"}, {"XM8LMG",  12000, false, "5.56"}, {"M249",  12000, false, "5.56"}, {"K12",  12000, false, ".308"}};
	end
	if GreenFireMod then
		-- Green Fire items --------------------------------                                                                this 100 is for quantity, it will sell 100 "Dry Cannabis Leaf" for $10.  You should be able to use that for any item in this list.
		vendorsGreenFire = {{"Kilo of Cannabis", 4500, false}, {"Bag of Cannabis", 100, false}, {"Dry Cannabis Leaf", 10, false, 100}, {"Hashish", 2500, false}, {"Kief", 30, false}, {"Blunt", 10, false}, {"Mixed Blunt", 5, false}, {"Kief Blunt", 40, false}, {"Hashish Blunt", 2525, false}, {"Space Blunt", 2560, false}, {"Cannabis Cigar", 45, false}, {"Premium Cannabis Cigar", 75, false}, {"Deluxe Cannabis Cigar", 45, false}, {"Reserve Cannabis Cigar", 45, false}};
	end
end

Events.OnLoad.Add(VendorsPrices_CheckMods);