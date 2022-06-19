if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end
	
local britaMod = nil;
local brita_2Mod = nil;
local GreenFireMod = nil;
local filibuster = nil;


local vendMoney = {};
vendMoney.total = 0;
local jewelry = {};
local vendorsTools = {}
local saleTotal = 0;

-- to change prices for items, find the item, change {x,x,x,x}, xxxx to the values you would like.  if you want to buy a lighter for $24 you would change it to {0,0,2,5}, 0025}
-- tool prices are listed here
vendorsTools[1] = {"Camping", {"SharpedStone", {0,0,2,5}, 0025}, {"Lighter", {0,0,4,5}, 0045}, {"PercedWood", {0,0,5,0}, 0050}, {"WoodenStick", {0,0,5,0}, 0050}};
vendorsTools[2] = {"Construction", {"Axe", {0,1,0,0}, 0100}, {"BucketEmpty", {0,2,5,0}, 250}, {"Crowbar", {0,0,7,5}, 0075}, {"Hammer", {0,0,4,5}, 0045}, {"Needle", {0,0,2,5}, 0025}, {"Paintbrush", {0,0,2,5}, 0025}, {"PropaneTank", {0,1,2,5}, 0125}, {"BlowTorch", {0,2,5,0}, 250}, {"Saw", {0,0,7,5}, 0075}, {"Screwdriver", {0,0,5,0}, 0050}, {"AxeStone", {0,0,7,5}, 0075}, {"HammerStone", {0,0,5,0}, 0050}, {"WeldingMask", {0,0,5,0}, 0050}};
vendorsTools[3] = {"Cooking", {"BakingPan", {0,0,4,5}, 0045}, {"Bowl", {0,2,5,0}, 250}, {"BoxOfJars", {0,0,5,0}, 0050}, {"JarLid", {0,0,5,0}, 0050, 6}, {"TinOpener", {0,0,5,0}, 0050}, {"Pot", {0,0,5,0}, 0050}, {"Pan", {0,0,4,5}, 0045}, {"KitchenKnife", {0,2,5,0}, 250}, {"Kettle", {0,0,5,0}, 0050}, {"RollingPin", {0,0,2,5}, 0025}, {"BakingPan", {0,0,5,0}, 0050}, {"Saucepan", {0,0,5,0}, 0050}};
vendorsTools[4] = {"Farming", {"farming.GardeningSprayEmpty", {0,0,7,5}, 0075}, {"farming.WateredCan", {0,1,0,0}, 0100}, {"Fertilizer", {0,0,7,5}, 0075}, {"EmptySandbag", {0,0,2,5}, 0025}, {"farming.Shovel", {0,1,0,0}, 0100}, {"farming.HandShovel", {0,1,0,0}, 0100}};
vendorsTools[5] = {"Fishing", {"FishingNet", {0,0,7,5}, 0075}, {"FishingRod", {0,1,0,0}, 0100}, {"FishingTackle", {0,0,4,5}, 0045}};
vendorsTools[6] = {"Light", {"Torch", {0,0,7,5}, 0075}, {"Matches", {0,0,5,0}, 0050}}
vendorsTools[7] = {"Mechanics", {"PetrolCan", {0,1,0,0}, 0100}, {"Jack", {0,0,7,5}, 0075}, {"LugWrench", {0,0,7,5}, 0075}, {"TirePump", {0,0,7,5}, 0075}, {"Wrench", {0,0,7,5}, 0075}};
vendorsTools[8] = {"Stationary", {"Notebook", {0,0,5,0}, 0050}, {"Eraser", {0,0,5,0}, 0050}, {"Journal", {0,0,5,0}, 0050}, {"Pen", {0,0,5,0}, 0050}, {"Pencil", {0,0,5,0}, 0050}, {"SheetPaper2", {0,0,5,0}, 0050}};
vendorsTools[9] = {"Trapping", {"TrapCage", {0,0,7,5}, 0075}, {"TrapMouse", {0,0,2,5}, 0025}, {"TrapSnare", {0,0,6,0}, 60}, {"TrapStick", {0,0,5,0}, 0050}, {"TrapBox", {0,0,6,0}, 60}, {"TrapCrate", {0,0,6,0}, 60}};
local vehicles = {};
vehicles.parts = {};
-- vehicle part prices are listed here
vehicles.parts[1] = {{"CarBattery1", {0,5,0,0}, 0500}, {"FrontCarDoor1", {0,5,0,0}, 0500}, {"EngineDoor1", {0,5,0,0}, 0500}, {"ModernBrake1", {0,5,0,0}, 0500}, {"TrunkDoor1", {0,5,0,0}, 0500}, {"RearCarDoor1", {0,5,0,0}, 0500}, {"RearCarDoorDouble1", {0,5,0,0}, 0500}, {"BigGasTank1", {0,5,0,0}, 0500}, {"ModernCarMuffler1", {0,5,0,0}, 0500}, {"NormalCarSeat1", {0,5,0,0}, 0500}, {"ModernSuspension1", {0,5,0,0}, 0500}, {"ModernTire1", {0,5,0,0}, 0500}, {"Windshield1", {0,5,0,0}, 0500}, {"RearWindshield1", {0,5,0,0}, 0500}, {"FrontWindow1", {0,5,0,0}, 0500}, {"RearWindow1", {0,5,0,0}, 0500}, "Standard"};
vehicles.parts[2] = {{"CarBattery1", {1,0,0,0}, 1000}, {"FrontCarDoor1", {1,0,0,0}, 1000}, {"EngineDoor1", {1,0,0,0}, 1000}, {"ModernBrake1", {1,0,0,0}, 1000}, {"TrunkDoor1", {1,0,0,0}, 1000}, {"RearCarDoor1", {1,0,0,0}, 1000}, {"RearCarDoorDouble1", {1,0,0,0}, 1000}, {"BigGasTank1", {1,0,0,0}, 1000}, {"ModernCarMuffler1", {1,0,0,0}, 1000}, {"NormalCarSeat1", {1,0,0,0}, 1000}, {"ModernSuspension1", {1,0,0,0}, 1000}, {"ModernTire1", {1,0,0,0}, 1000}, {"Windshield1", {1,0,0,0}, 1000}, {"RearWindshield1", {1,0,0,0}, 1000}, {"FrontWindow1", {1,0,0,0}, 1000}, {"RearWindow1", {1,0,0,0}, 1000}, "Sport"};
vehicles.parts[3] = {{"CarBattery1", {2,0,0,0}, 2000}, {"FrontCarDoor1", {2,0,0,0}, 2000}, {"EngineDoor1", {2,0,0,0}, 2000}, {"ModernBrake1", {2,0,0,0}, 2000}, {"TrunkDoor1", {2,0,0,0}, 2000}, {"RearCarDoor1", {2,0,0,0}, 2000}, {"RearCarDoorDouble1", {2,0,0,0}, 2000}, {"BigGasTank1", {2,0,0,0}, 2000}, {"ModernCarMuffler1", {2,0,0,0}, 2000}, {"NormalCarSeat1", {2,0,0,0}, 2000}, {"ModernSuspension1", {2,0,0,0}, 2000}, {"ModernTire1", {2,0,0,0}, 2000}, {"Windshield1", {2,0,0,0}, 2000}, {"RearWindshield1", {2,0,0,0}, 2000}, {"FrontWindow1", {2,0,0,0}, 2000}, {"RearWindow1", {2,0,0,0}, 2000}, "Heavy-Duty"};
local weapons = {};
-- weapon prices are listed here
weapons[1] = {"Box_Ammo", {"ShotgunShellsBox", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"223Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"308Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"Bullets38Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"Bullets45Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"556Box", {0,2,0,0}, 0200, true, {2,0,0,0}}};
weapons[2] = {"Magazines", {"223Clip", {0,3,0,0}, 0300, false, ".223-REM"}, {"308Clip", {0,3,0,0}, 0300, false, ".308"}, {"44Clip", {0,2,5,0}, 0250, false, ".44-MAG"}, {"45Clip", {0,2,5,0}, 0250, false, ".45 Auto"}, {"556Clip", {0,3,5,0}, 0350, false, "5.56"}, {"M14Clip", {0,3,0,0}, 0300, false, ".308"}, {"9mmClip", {0,3,0,0}, 0300, false, "9mm"}};
weapons[3] = {"Attachments", {"ChokeTubeImproved", {0,2,0,0}, 0200, false, "Barrel"}, {"FiberglassStock", {0,1,5,0}, 0150, false, "Stock"}, {"IronSight", {0,1,0,0}, 0100, false, "Sight"}, {"Laser", {0,2,0,0}, 0200, false, "Side"}, {"RecoilPad", {0,1,0,0}, 0100, false, "Stock"}, {"RedDot", {0,2,0,0}, 0200, false, "Sight"}, {"Sling", {0,1,5,0}, 0150, false, "Bottom"}, {"x2Scope", {0,3,0,0}, 0300, false, "Sight"}, {"x4Scope", {0,3,5,0}, 0350, false, "Sight"}, {"x8Scope", {0,4,0,0}, 0400, false, "Sight"}};
weapons[4] = {"Caliber", ".223-REM", ".308", ".44-MAG", ".45 Auto", "5.56", "9mm"};
weapons[5] = {"Pistols", {"Pistol", {2,5,0,0}, 2500, false, "9mm"}, {"Pistol2", {3,0,0,0}, 3000, false, ".45 Auto"}, {"Pistol3", {3,0,0,0}, 3000, false, ".44-MAG"}, {"Revolver_Long", {2,0,0,0}, 2000, false, ".44-MAG"}, {"Revolver", {2,0,0,0}, 2000, false, ".45 Auto"}, {"Revolver_Short", {1,5,0,0}, 1500, false, ".38-SPC"}};
weapons[6] = {"Shotguns", {"DoubleBarrelShotgun", {0,7,5,0}, 750, false, "12g"}, {"Shotgun", {2,5,0,0}, 2500, false, "12g"}};
weapons[7] = {"Rifles", {"AssaultRifle2", {7,5,0,0}, 7500, false, ".308"}, {"AssaultRifle", {10,0,0,0}, 10000, false, "5.56"}, {"VarmintRifle", {3,5,0,0}, 3500, false, ".223-REM"}, {"HuntingRifle", {4,5,0,0}, 4500, false, ".308"}};
weapons[8] = {"Slots", "Barrel", "Bottom", "Side", "Sight", "Stock"};
jewelry[0] = {};
jewelry[1] = {};
jewelry.stones = {};
jewelry.regular = {};
jewelry.tags = {};
local vendorsFoods = {};
-- food prices are listed here
vendorsFoods[1] = {"Canned_Goods", {"TinnedBeans", {0,0,5,0}, 50}, {"CannedChili", {0,0,5,0}, 50}, {"CannedCorn", {0,0,5,0}, 50}, {"CannedCornedBeef", {0,0,5,0}, 50}, {"CannedFruitCocktail", {0,0,5,0}, 50}, {"CannedMushroomSoup", {0,0,5,0}, 50}, {"CannedPeaches", {0,0,5,0}, 50}, {"CannedPeas", {0,0,5,0}, 50}, {"CannedPineapple", {0,0,5,0}, 50}, {"CannedPotato2", {0,0,5,0}, 50}, {"CannedSardines", {0,0,5,0}, 50}, {"TinnedSoup", {0,0,5,0}, 50}, {"CannedBolognese", {0,0,5,0}, 50}, {"CannedTomato2", {0,0,5,0}, 50}, {"TunaTin", {0,0,5,0}, 50}};
vendorsFoods[2] = {"Condiments", {"SugarBrown", {0,0,1,0}, 10}, {"Hotsauce", {0,0,1,0}, 10}, {"Ketchup", {0,0,1,0}, 10}, {"MapleSyrup", {0,0,1,0}, 10}, {"Marinara", {0,0,1,0}, 10}, {"farming.MayonnaiseFull", {0,0,1,0}, 10}, {"Mustard", {0,0,1,0}, 10}, {"OilOlive", {0,0,1,0}, 10}, {"Pepper", {0,0,1,0}, 10}, {"RiceVinegar", {0,0,1,0}, 10}, {"Salt", {0,0,1,0}, 10}, {"Soysauce", {0,0,1,0}, 10}, {"Sugar", {0,0,1,0}, 10}, {"OilVegetable", {0,0,1,0}, 10}, {"Wasabi", {0,0,1,0}, 10}};
vendorsFoods[3] = {"Drinks", {"BeerBottle", {0,0,6,0}, 60}, {"BeerCan", {0,0,6,0}, 60}, {"Bleach", {0,0,6,0}, 60}, {"WhiskeyFull", {0,0,6,0}, 60}, {"ColdDrinkSpiffo", {0,0,6,0}, 60}, {"Mugfull", {0,0,6,0}, 60}, {"HotDrinkTea", {0,0,6,0}, 60}, {"OilOlive", {0,0,6,0}, 60}, {"JuiceBox", {0,0,6,0}, 60}, {"Milk", {0,0,6,0}, 60}, {"PopBottle", {0,0,6,0}, 60}, {"Wine2", {0,0,6,0}, 60}, {"Wine", {0,0,6,0}, 60}};
vendorsFoods[4] = {"Fish", {"Bass", {0,0,7,5}, 75}, {"Catfish", {0,0,7,5}, 75}, {"Crappie", {0,0,7,5}, 75}, {"Crayfish", {0,0,7,5}, 75}, {"FishFillet", {0,0,7,5}, 75}, {"FishRoe", {0,0,7,5}, 75}, {"BaitFish", {0,0,7,5}, 75}, {"Lobster", {0,0,7,5}, 75}, {"Oysters", {0,0,7,5}, 75}, {"Perch", {0,0,7,5}, 75}, {"Pike", {0,0,7,5}, 75}, {"Salmon", {0,0,7,5}, 75}, {"Shrimp", {0,0,7,5}, 75}, {"Squid", {0,0,7,5}, 75}, {"SquidCalamari", {0,0,7,5}, 75}, {"Panfish", {0,0,7,5}, 75}, {"Trout", {0,0,7,5}, 75}};
vendorsFoods[5] = {"Game", {"DeadBird", {0,0,4,0}, 40}, {"DeadMouse", {0,0,4,0}, 40}, {"DeadRabbit", {0,0,4,0}, 40}, {"DeadRat", {0,0,4,0}, 40}, {"DeadSquirrel", {0,0,4,0}, 40}, {"Rabbitmeat", {0,0,4,0}, 40}, {"Smallanimalmeat", {0,0,4,0}, 40}, {"Smallbirdmeat", {0,0,4,0}, 40}};
vendorsFoods[6] = {"Pickled_Food", {"CannedBellPepper", {0,0,4,0}, 40}, {"CannedBroccoli", {0,0,4,0}, 40}, {"CannedCabbage", {0,0,4,0}, 40}, {"CannedCarrots", {0,0,4,0}, 40}, {"CannedEggplant", {0,0,4,0}, 40}, {"CannedLeek", {0,0,4,0}, 40}, {"CannedPotato", {0,0,4,0}, 40}, {"CannedRedRadish", {0,0,4,0}, 40}, {"CannedTomato", {0,0,4,0}, 40}};
vendorsFoods[7] = {"Proteins", {"farming.Bacon", {0,1,0,0}, 100}, {"BeefJerky", {0,1,0,0}, 100}, {"Chicken", {0,1,0,0}, 100}, {"EggCarton", {0,1,0,0}, 100}, {"FrogMeat", {0,1,0,0}, 100}, {"Ham", {0,1,0,0}, 100}, {"MeatPatty", {0,1,0,0}, 100}, {"MincedMeat", {0,1,0,0}, 100}, {"MuttonChop", {0,1,0,0}, 100}, {"Pepperoni", {0,1,0,0}, 100}, {"PorkChop", {0,1,0,0}, 100}, {"Salami", {0,1,0,0}, 100}, {"Sausage", {0,1,0,0}, 100}, {"Steak", {0,1,0,0}, 100}, {"Tofu", {0,1,0,0}, 100}};
vendorsFoods[8] = {"Medical", {"AlcoholWipes", {0,0,4,0}, 40}, {"Antibiotics", {0,0,7,5}, 075}, {"PillsAntiDep", {0,0,7,5}, 075}, {"Bandage", {0,0,4,0}, 40}, {"PillsBeta", {0,0,4,0}, 40}, {"Disinfectant", {0,0,7,5}, 075}, {"Cigarettes", {0,0,4,0}, 40}, {"FirstAidKit", {0,1,0,0}, 100}, {"Pills", {0,0,7,5}, 075}, {"AlcoholBandage", {0,0,6,0}, 60}, {"PillsVitamins", {0,0,7,5}, 075}, {"Splint", {0,0,8,0}, 80}, {"SutureNeedle", {0,0,4,0}, 40}, {"SutureNeedleHolder", {0,0,4,0}, 40}, {"Tweezers", {0,0,4,0}, 40}};
local vendorWallet = {};

function VendISWorldObjectContextMenu.createMenu(player, context, worldobjects, test)
Vendors_CheckMods();
	-- reset values for inventory search.
	local fanleaf = 0;
	jewelry.stones = {};
	jewelry.regular = {};
	jewelry.tags = {};
	jewelry.regular.items = {};
	jewelry.stones.items = {};
	jewelry.tags.items = {};
	jewelry.green = {};
	jewelry.green.items = {};
	saleTotal = 0;
	vendMoney[1] = 0;
	vendMoney[2] = 0;
	vendMoney[3] = 0;
	vendMoney[4] = 0;
	local playerObj = getSpecificPlayer(player);
	local worldObj = worldobjects;
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj);
	local vendorList = nil;
	local dispType = nil;


	-- looking for vendors in area to determine if the context menu is needed
	for i=1,containers:size() do
		local container = containers:get(i-1);
		for j=1,container:getItems():size() do
			local item = container:getItems():get(j-1);
			-- don't want to sell the fancy stuff you're wearing, or have attached
			if not playerObj:isEquipped(item)  and not playerObj:isAttachedItem(item) then
				local dispCat = item:getDisplayCategory();
				if item:getType() then
					dispType = item:getType();
					dispName = item:getName();
				end
				if dispCat == "Vendors" then
					if not vendorList then vendorList = {}; vendorList.vendors = {}; end
					if vendorList[dispType] then 
					else
						vendorList[dispType] = item;
						table.insert(vendorList.vendors, dispName);
					end
				end
				if item:isInPlayerInventory() then
					if not vendorWallet then vendorWallet = {}; end
					if dispCat == "Money" then
						if dispType == "OneDollar" then
							local item = {item, container};
							vendMoney[4] = vendMoney[4] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "TenDollar" then
							local item = {item, container};
							vendMoney[3] = vendMoney[3] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "HundredDollar" then
							local item = {item, container};
							vendMoney[2] = vendMoney[2] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "ThousandDollar" then
							local item = {item, container};
							vendMoney[1] = vendMoney[1] + 1;
							table.insert(vendorWallet, item);
						end
						vendMoney.total = ((vendMoney[1]*1000)+(vendMoney[2]*100)+(vendMoney[3]*10)+(vendMoney[4]));
					elseif string.find(dispType, "DogTag") then
															-- price for selling dog tags
						table.insert(jewelry.tags.items, {item, {0,0,5,0}, 50, container});
						if not jewelry.tags[dispType] then jewelry.tags[dispType] = {};
							jewelry.tags[dispType] = {item, {0,0,5,0}, 50};
							jewelry.tags[dispType].count = 1;
							jewelry.tags[dispType].menuCreated = false;
						else 
							jewelry.tags[dispType].count = jewelry.tags[dispType].count + 1;
						end
						saleTotal = saleTotal + jewelry.tags[dispType][2][3];
					elseif string.find(dispType, "Diamond") or string.find(dispType, "Emerald") or string.find(dispType, "Amethyst") or string.find(dispType, "Ruby") or string.find(dispType, "Sapphire") then
															-- price for selling jewelry with stones
						table.insert(jewelry.stones.items, {item, {0,0,2,5}, 25, container})
						if not jewelry.stones[dispType] then jewelry.stones[dispType] = {};
							jewelry.stones[dispType] = {item, {0,0,2,5}, 25};
							jewelry.stones[dispType].count = 1;
							jewelry.stones[dispType].menuCreated = false;
						else 
							jewelry.stones[dispType].count = jewelry.stones[dispType].count + 1;
						end
						saleTotal = saleTotal + jewelry.stones[dispType][2][3];
					elseif not string.find(dispType, "Flame") and not string.find(dispType, "Key") and not string.find(dispType, "DogTag") and (item:getDisplayCategory() == "Accessory" and ((string.find(dispType, "Ring") or string.find(dispType, "ring"))) or string.find(dispType, "necklace") or string.find(dispType, "Necklace") or string.find(dispType, "Bangle") or string.find(dispType, "Locket") or string.find(dispType, "Watch") or (string.find(dispType, "Nose") and string.find(dispType, "Stud")) or string.find(dispType, "BellyButton")) then
															-- price for selling regular jewelry
						table.insert(jewelry.regular.items, {item, {0,0,1,0}, 10, container});
						if not jewelry.regular[dispType] then jewelry.regular[dispType] = {};
							jewelry.regular[dispType] = {item, {0,0,1,0}, 10};
							jewelry.regular[dispType].count = 1;
							jewelry.regular[dispType].menuCreated = false;
						else
							jewelry.regular[dispType].count = jewelry.regular[dispType].count + 1;
						end
						saleTotal = saleTotal + jewelry.regular[dispType][2][3];
					-- looking for GreenFireMod products  TODO Add more gfm items, add brita weapons
					elseif GreenFireMod then
						if dispCat == "GreenFireItem" then
							if string.find(dispType, "Kg") then
																		-- price for selling kilo of cannabis -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {4,5,0,0}, 4500, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {4,5,0,0}, 4500, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif string.find(dispType, "Oz") then
																		-- price for selling bag of cannabis -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,1,0,0}, 100, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,1,0,0}, 100, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif string.find(dispType, "DryCannabisFanLeaf") then
								fanleaf = fanleaf + 1;
								if fanleaf == 100 then
									fanleaf = 0;
																			-- price for selling dry fan leaf, 100 is the quantity.  so you get $10 per 100 fan leaves -----------------------------------------------------------------------------------
									table.insert(jewelry.green.items, {item, {0,0,1,0}, 10, 100, container});
									if not jewelry.green[dispType] then jewelry.green[dispType] = {};
										jewelry.green[dispType] = {item, {item, {0,0,1,0}, 10, container, 100}};
										jewelry.green[dispType].count = 1;
										jewelry.green[dispType].menuCreated = false;
									else 
										jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
									end
									saleTotal = saleTotal + jewelry.green[dispType][2][3];
								end
							elseif dispType == "Hashish" then
																			-- price for selling hashish -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {2,5,0,0}, 2500, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {2,5,0,0}, 2500, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "Kief" then
																			-- price for selling kief -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,3,0}, 0030, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,3,0}, 0030, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "Blunt" then
																			-- price for selling blunt -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,1,0}, 0010, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,1,0}, 0010, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "MixedBlunt" then
																			-- price for selling mixed blunt -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,0,5}, 0005, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,0,5}, 0005, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "KiefBlunt" then
																			-- price for selling kief blunt -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,4,0}, 40, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,4,0},40, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "HashishBlunt" then
																			-- price for selling hashish blunt -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {2,5,2,5}, 2525, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {2,5,2,5}, 2525, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "SpaceBlunt" then
																			-- price for selling space blunt -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {2,5,6,0}, 2560, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {2,5,6,0}, 2560, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "CannaCigar" then
																			-- price for selling cannabis cigar -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {2,5,6,0}, 2560, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {2,5,6,0}, 2560, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "PreCannaCigar" then
																			-- price for selling premium cannabis cigar -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,6,0}, 0060, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,6,0}, 0060, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "DelCannaCigar" then
																			-- price for selling deluxe cannabis cigar -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {0,0,6,0}, 0060, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {0,0,6,0}, 0060, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							elseif dispType == "ResCannaCigar" then
																			-- price for selling reserve cannabis cigar -----------------------------------------------------------------------------------
								table.insert(jewelry.green.items, {item, {2,6,0,0}, 2600, container});
								if not jewelry.green[dispType] then jewelry.green[dispType] = {};
									jewelry.green[dispType] = {item, {item, {2,6,0,0}, 2600, container}};
									jewelry.green[dispType].count = 1;
									jewelry.green[dispType].menuCreated = false;
								else 
									jewelry.green[dispType].count = jewelry.green[dispType].count + 1;
								end
								saleTotal = saleTotal + jewelry.green[dispType][2][3];
							end
						end
					end
				end
			end	
		end
	end
	-- if there are vendors in the area then we call the function to display the menu
	if vendorList then
		table.sort(vendorList.vendors);
		Vendors_ContextMenu(playerObj, worldObj, context, vendorList, vendMoney);
	end
end

	-- display main context menu option
function Vendors_ContextMenu(player, worldobjects, context, list, money)
	local vendorList = list;
	local worldObj = worldobjects;
	local vendorOption = context:addOptionOnTop(getText("ContextMenu_Vendor_options"), worldObj);
	local vendorSubMenu = ISContextMenu:getNew(context);
	local subContext = context:addSubMenu(vendorOption, vendorSubMenu);
	Vendors_subContextMenu(subContext, vendorList, vendorSubMenu, context, player);
	local subVendorOption = vendorSubMenu:addOptionOnTop("You have ($" .. vendMoney.total .. ")", worldObj);
end	
	-- display sub context menus
function Vendors_subContextMenu(subContext, vendorList, vendorSubMenu, context, player)
	for i,v in ipairs(vendorList.vendors) do
		local vendorType = v
		local subVendorOption = {};
		subVendorOption = vendorSubMenu:addOption(getText("ContextMenu_" .. vendorType), worldObj);
		local subSubMenu = ISContextMenu:getNew(vendorSubMenu);
		local subSubContext = context:addSubMenu(subVendorOption, subSubMenu);
		Vendors_subSubContextMenu(subSubContext, vendorList, subSubMenu, context, player, vendorType, worldobjects)
	end
end
	-- display subsub and subsubsub context menus
function Vendors_subSubContextMenu(subSubContext, vendorList, subSubMenu, context, player, vendorType, worldobjects)
	local playerObj = getSpecificPlayer(0);
	local playerInv = playerObj:getInventory();
	-- searching for vendor type to display correct context menus
	if vendorType == "ATM Machine" then
		-- looking for jewelry items that were found during the inventory search in the initial function
		if #jewelry.tags.items == 0 and #jewelry.stones.items == 0 and #jewelry.regular.items == 0 and #jewelry.green.items == 0 then
			local subSubVendorOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Nothing_To_Sell"), worldobjects);
		else
			local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_Sell_All") .. "($" .. saleTotal .. ")", worldobjects, Buy_VendorsItem, player, jewelry, true, 0, true);
			if #jewelry.tags.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, jewelry.tags)
			end
			if #jewelry.stones.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, jewelry.stones)
			end
			if #jewelry.regular.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, jewelry.regular)
			end
			if #jewelry.green.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, jewelry.green)
			end
		end
	end
	-- food, were building menus to buy food
	if vendorType == "Food Vendor" then
		Vendors_DisplayFoodOptions(subSubMenu, context, player, vendorsFoods);		
	end
	-- tools.  for to buy
	if vendorType == "Tool Vendor" then
		Vendors_DisplayToolOptions(subSubMenu, context, player, vendorsTools)
	end
	if vendorType == "Vehicle Vendor" then
		-- creating a menu item for engine parts, to be listed in the first vehicle submenu above the other submenu options
		local part = {"EngineParts",{7,5,0,0}, 7500};
		local partName = "EngineParts";
		local partPrice = {7,5,0,0};
		-- im not sure how to get the item name in order to avoid adding translations for everything unless i add it to your inventory.  so everything on the list, everything(minus what you're selling), is added and then removed from your inventory...  sorry, if anyone has a method to get the actual item object without having it in your inventory, i could use your help...
		local partItem = playerInv:AddItem(partName);
		local partItemType = partItem:getType();
		local partItemName = partItem:getName();
		playerInv:Remove(partItem);
		local vehicle = player:getNearVehicle();
		if vehicle then
			local subSubVendorOption = subSubMenu:addOption(getText("IGUI_VehicleName" .. vehicle:getScript():getName()) .. " key - $5000", playerObj, Buy_VendorsVehicleKey, vehicle);
		end
		local subSubVendorOption = subSubMenu:addOption(partItemName .. "($" .. getText("ContextMenu_Spare_Parts") .. ")", worldobjects, Buy_VendorsItem, player, part, false, partPrice, false, 30);
		for i,v in pairs(vehicles.parts) do
			local subTable = v;
			local vehicleOption = subSubMenu:addOption(getText("ContextMenu_" .. subTable[17] .. "_Type_Car_Parts"), worldobjects);
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(vehicleOption, subSubMenu);
			for h, w in pairs(subTable) do
				if h < 17 then
					local part = w;
					local partName = w[1];
					local partPrice = w[2];
					local partValue = w[3];
					local partItem = playerInv:AddItem(partName);
					local partItemType = partItem:getType();
					local partItemName = partItem:getName();
					playerInv:Remove(partItem);
					local subSubVendorOption = subSubMenu:addOption(partItemName .. "($" .. partValue .. ")", worldobjects, Buy_VendorsItem, player, part, false, partPrice, false);					
				end
			end 
		end
	end
	if vendorType == "Weapon Vendor" then
		for i,v in pairs(weapons) do
			local subTable = v;
			if subTable[1] == "Caliber" then
				local magazineOption = subSubMenu:addOption(getText("ContextMenu_Magazines"), worldobjects);
				local subSubMenu = ISContextMenu:getNew(subSubMenu);
				local subContext = context:addSubMenu(magazineOption, subSubMenu);
				for h,w in pairs(subTable) do
					local caliber = w;
					if caliber ~= "Caliber" then
						local caliberOption = subSubMenu:addOption(caliber, worldobjects);
						local subSubMenu = ISContextMenu:getNew(subSubMenu);
						local subContext = context:addSubMenu(caliberOption, subSubMenu);
						for n,o in pairs(weapons[2]) do
							local magazineCaliber = o[5];
							if magazineCaliber == caliber then
								local magazine = o;
								local magazineName = magazine[1];
								-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
								local magazinePrice = magazine[2];
								local magazineValue = magazine[3];
								local magazineItem = playerInv:AddItem(magazineName);
								local magazineItemType = magazineItem:getType();
								local magazineItemName = magazineItem:getName();
								if magazineName == "M14Clip" then magazineItemName = ".308 Magazine(M14)"; end
								playerInv:Remove(magazineItem);
								local subSubVendorOption = subSubMenu:addOption(magazineItemName .. "($" .. magazineValue .. ")", worldobjects, Buy_VendorsItem, player, magazine, false, magazinePrice, false);
							end
						end
					end
				end
			elseif subTable[1] == "Slots" then
				Vendors_DisplayAttachmentSlots(subSubMenu, subTable, context, player);
			elseif subTable[1] ~= "Magazines"  and subTable[1] ~= "Attachments" then
				local weaponOptions = subTable[1];
				local weaponOption = subSubMenu:addOption(getText("ContextMenu_" .. weaponOptions), worldobjects);
				local subSubMenu = ISContextMenu:getNew(subSubMenu);
				local subContext = context:addSubMenu(weaponOption, subSubMenu);
				for l,m in pairs(v) do
					if l > 1 then
						local weapon = m;
						local weaponName = weapon[1];
						-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
						local weaponPrice = weapon[2];
						local weaponValue = weapon[3];
						local multipleBuy = weapon[4];
						local weaponItem = playerInv:AddItem(weaponName);
						local weaponItemType = weaponItem:getType();
						local weaponItemIsWeapon = weaponItem:IsWeapon();
						local weaponItemName = weaponItem:getName();
						playerInv:Remove(weaponItem);
						if weaponItemIsWeapon then
							local weaponItemAmmoType = weapon[5];
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - (" .. weaponItemAmmoType .. ") - ($" .. weaponValue .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
						elseif multipleBuy == true then
							local ammoBoxOption = subSubMenu:addOption(weaponItemName, worldobjects);
							local subSubMenu = ISContextMenu:getNew(subSubMenu);
							local subContext = context:addSubMenu(ammoBoxOption, subSubMenu);
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - 1 for ($" .. weaponValue .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
							weapon[2] = weapon[5];
							weaponValue = weaponValue*10;
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - 10 for ($" .. weaponValue .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false, 10);				
						else
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - ($" .. weaponValue .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
						end
					end
				end
			end
		end
	end
end

-- yeah, it says buy but we sell items here too.  I thought i was going to need a seperate function at first, turns out i could get it all with one!  woot!
-- item is a table containing the item we're buying or selling.  sell is boolean, as well as sellAll.  moneyQuantity is a table, quantity is an integer.  quantity is used for only the dry fan leaves at the moment(also for buying engine parts now), sell 100 for $10.
function Buy_VendorsItem(worldobjects, player, item, sell, moneyQuantity, sellAll, quantity, sellAllOfItem)
	local playerObj = player;
	local playerInv = playerObj:getInventory();
	local itemTable = item;
	local moneyInteger = itemTable[3];
	local moneyQuantity = itemTable[2];
	local moneyQuant = moneyQuantity;
	local sellAllTotal = 0;
	-- if were selling all the loot, then were searching through all the tables.  the tables of items that we're going to sell, not the ones filled with stuff we might buy.
	if sellAll then
		if #jewelry.tags.items > 0 then
			for i,v in ipairs(jewelry.tags.items) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				Vendors_RemoveItem(jewelryItem, v[4]);
				sellAllTotal = sellAllTotal + v[3];
			end
		end
		-- another bag of loot to sift through
		if #jewelry.stones.items > 0 then
			for i,v in pairs(jewelry.stones.items) do
				local jewelryItem = v[1];
				Vendors_RemoveItem(jewelryItem, v[4])
				sellAllTotal = sellAllTotal + v[3];
			end
		end
		-- and another one gone, and another one gone
		if #jewelry.regular.items > 0 then
			for i,v in pairs(jewelry.regular.items) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				Vendors_RemoveItem(jewelryItem, v[4]);
				sellAllTotal = sellAllTotal + v[3];
			end
		end
		-- last one for sell all!
		if #jewelry.green.items > 0 then
			for i,v in pairs(jewelry.green.items) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				if v[5] then
					local quantity = v[5];
					sellAllTotal = sellAllTotal + v[3];
					for h=1, quantity do
						Vendors_RemoveItem(jewelryItem, v[4]);
					end
				else
					Vendors_RemoveItem(jewelryItem, v[4]);
					sellAllTotal = sellAllTotal + v[3];
				end
			end
		end
		Vendors_CalculateChange(sellAllTotal*-1);
	-- now to sell individual items
	elseif sell and not sellAll then
		local jewelryItem = item[1];
		if quantity then
			if quantity > 0 then
				-- alright, we're not just selling individual items, we're selling bulk of item types as well...
				if sellAllOfItem then
					for i,v in pairs(item[1]) do
						if v[1]:getType() == item[2] then
							Vendors_RemoveItem(v[1], v[4]);
						end
					end
					moneyInteger = item[3]*quantity;
				else
					jewelryItem = jewelryItem:getType();
					for j=1, quantity do
						Vendors_RemoveItem(jewelryItem, item[4]);
					end
				end
			end
		else
			Vendors_RemoveItem(jewelryItem, item[4]);
		end
		-- give me that money!
		Vendors_CalculateChange(moneyInteger*-1);
		-- not selling and not selling all, we're buying.  at this moment though its all free, i still need to fix how it removes the cash.  i was wrong, it's actually all broken at the moment, cant buy anything right now.   fixed part of it, you can now receive free items as long as you have enough to cover it, but it won't take your money.  i fixed that, it will now take your money but it will also give you more than 400x your change back.  progress...  that didn't take long,  giving correct change now.
	elseif not sell and not sellAll then
		if quantity and item[1] ~= "EngineParts" then moneyInteger = moneyInteger*quantity; end
		if vendMoney.total >= moneyInteger then
			if quantity then
				for i=1,quantity-1 do
					local addedItem = Vendors_AddItem(item[1], playerInv);
				end
			end
			local addedItem = Vendors_AddItem(item[1], playerInv);
			Vendors_CalculateChange(moneyInteger);
		else
			playerObj:Say(getText("ContextMenu_Cant_Buy"));
		end
	end
end

function Vendors_RemoveItem(item, container)
	container:DoRemoveItem(item);
	container:Remove(item);
	container:removeItemOnServer(item);
end

function Buy_VendorsVehicleKey(player, vehicle)
	if vendMoney.total >= 5000 then
		Vendors_CalculateChange(-5000);
		sendClientCommand(player, "vehicle", "getKey", { vehicle = vehicle:getId() });
	else
		player:Say(getText("ContextMenu_Cant_Buy"));
	end
end

function Vendors_CalculateChange(moneyInteger)
	local vendCashToGive = vendMoney.total - moneyInteger;
	local vendCash = {}
	-- clean this up if you dont need floor  i do need floor but i cleaned it up anyways
	vendCash[1] = {math.floor((vendCashToGive)/1000), "Vendors.ThousandDollar", true};
	vendCash[2] = {(math.floor((vendCashToGive)/100) - (math.floor(vendCashToGive/1000)*10)), "Vendors.HundredDollar"};
	vendCash[3] = {(math.floor((vendCashToGive)/10) - (math.floor(vendCashToGive/100)*10)), "Vendors.TenDollar"};
	vendCash[4] = {(math.floor((vendCashToGive)) - (math.floor(vendCashToGive/10)*10)), "Vendors.OneDollar"};
	local totalBills = #vendorWallet;
	for i,v in pairs(vendorWallet) do
		v[2]:DoRemoveItem(v[1]);
		v[2]:Remove(v[1]);
		v[2]:removeItemOnServer(v[1]);
	end
	for i,v in pairs(vendCash) do
		for j=1, v[1] do
		Vendors_AddItem(v[2], vendorWallet[totalBills][2]);
		end
	end
end

function Vendors_DisplayFoodOptions(subSubMenu, context, player, vendorsList)
	local playerInv = player:getInventory();
	for i,v in pairs(vendorsList) do
		local foodTable = v;
		local foodOption = subSubMenu:addOption(getText("ContextMenu_" .. foodTable[1]), worldobjects)
		local subSubMenu = ISContextMenu:getNew(subSubMenu);
		local subContext = context:addSubMenu(foodOption, subSubMenu);
		for j,k in pairs(foodTable) do
			local foodItemTable = k;
			if j ~= 1 then
				local foodItemType = foodItemTable[1];
				local foodItemPrice = foodItemTable[2];
				local foodItemValue = foodItemTable[3];
				local foodItem = playerInv:AddItem(foodItemType);
				if foodItem:isCookable() and not string.find(foodItemType, "Dead") then foodItem:setCooked(true); end
				foodItemName = foodItem:getName();
				playerInv:Remove(foodItem);
				if foodItemName == "Cigarettes" then
					for i=1, 19 do
						playerInv:Remove(foodItemName);
					end
				end
				local SubVendorOption = subSubMenu:addOption(foodItemName .. "($" .. foodItemValue .. ")", worldobjects, Buy_VendorsItem, player, foodItemTable, false, foodItemPrice);
			end
		end
	end
end

function Vendors_DisplayToolOptions(subSubMenu, context, player, vendorsList)
	local playerInv = player:getInventory();
	for i,v in pairs(vendorsList) do
		local toolTable = v;
		local toolOption = subSubMenu:addOption(getText("ContextMenu_" .. toolTable[1]), worldobjects)
		local subSubMenu = ISContextMenu:getNew(subSubMenu);
		local subContext = context:addSubMenu(toolOption, subSubMenu);
		for j,k in pairs(toolTable) do
			local toolItemTable = k;
			if j ~= 1 then
				local toolItemType = toolItemTable[1];
				local toolItemPrice = toolItemTable[2];
				local toolItemValue = toolItemTable[3];
				local toolItemQuantity = toolItemTable[4];
				local toolItem = playerInv:AddItem(toolItemType);
				toolItemName = toolItem:getName();
				playerInv:Remove(toolItem);
				if toolItemQuantity then toolItemValue = toolItemValue*toolItemQuantity .. ") for (" .. toolItemQuantity; end
				local SubVendorOption = subSubMenu:addOption(toolItemName .. "($" .. toolItemValue .. ")", worldobjects, Buy_VendorsItem, player, toolItemTable, false, toolItemPrice);
			end
		end
	end
end

function Vendors_DisplayJewelryOptions(subSubMenu, context, player, jewelryList)
	local jewelryTable = jewelryList.items;
	local jewelryTableList = jewelryList;
	for i,v in pairs(jewelryTable) do
		local jewelryItemTable = v;
		local jewelryItemName = jewelryItemTable[1]:getName();
		local jewelryItemPrice = jewelryItemTable[2];
		local jewelryItemValue = jewelryItemTable[3];
		local jewelryItemType = jewelryItemTable[1]:getType();
		if v[5] then 
			quantity = v[5]; 
			jewelryItemPrice = jewelryItemPrice .. " per " .. quantity;
		end
		if jewelryTableList[jewelryItemType].count > 1 and not jewelryTableList[jewelryItemType].menuCreated then
			local jewelryItemOption = subSubMenu:addOption(jewelryItemName .. " ($" .. jewelryItemValue .. ")", worldobjects);
			local subMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(jewelryItemOption, subMenu);
			local subVendorOption = subMenu:addOption(jewelryItemName .. "($" .. jewelryItemValue .. ")", worldobjects, Buy_VendorsItem, player, jewelryItemTable, true, jewelryItemPrice);
			local subVendorOption = subMenu:addOption(jewelryItemName .. " - Sell all for ($" .. jewelryItemValue*jewelryTableList[jewelryItemType].count .. ")", worldobjects, Buy_VendorsItem, player, {jewelryList.items, jewelryItemType, jewelryItemValue}, true, jewelryItemPrice, false, jewelryTableList[jewelryItemType].count, true);
			jewelryTableList[jewelryItemType].menuCreated = true;
		elseif jewelryTableList[jewelryItemType].count == 1 then
			local subSubVendorOption = subSubMenu:addOption(jewelryItemName .. "($" .. jewelryItemValue .. ")", worldobjects, Buy_VendorsItem, player, jewelryItemTable, true, jewelryItemPrice);
		end
	end
end

function Vendors_DisplayAttachmentSlots(subSubMenu, subTable, context, player)
	local playerInv = player:getInventory();
	local slotOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Attachments"), worldobjects);
	local subSubMenu = ISContextMenu:getNew(subSubMenu);
	local subContext = context:addSubMenu(slotOption, subSubMenu);
	for h,w in pairs(subTable) do
		local slotOptions = w;
		if slotOptions ~= "Slots" then
			local attachmentOption = subSubMenu:addOption(getText("ContextMenu_" .. slotOptions), worldobjects);
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(attachmentOption, subSubMenu);
			for n,o in pairs(weapons[3]) do
				local slot = o[5];
				if slot == slotOptions then
					local attachment = o;
					local attachmentName = attachment[1];
					-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
					local attachmentPrice = attachment[2];
					local attachmentValue = attachment[3];
					local attachmentItem = playerInv:AddItem(attachmentName);
					local attachmentItemType = attachmentItem:getType();
					local attachmentItemName = attachmentItem:getName();
					playerInv:Remove(attachmentItem);
					local subSubVendorOption = subSubMenu:addOption(attachmentItemName .. "($" .. attachmentValue .. ")", worldobjects, Buy_VendorsItem, player, attachment, false, attachmentPrice, false);
				end
			end
		end
	end
end

function Vendors_CheckMods()
	britaMod = getActivatedMods():contains("Brita");
	brita_2Mod = getActivatedMods():contains("Brita_2");
	GreenFireMod = getActivatedMods():contains("jiggasGreenfireMod");
	filibuster = getActivatedMods():contains("FRUsedCars");
	if britaMod then
		weapons[1] = {"Box_Ammo", {"ShotgunShellsBox", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"40HERound", {10,0,0,0}, 10000, true, {100,0,0,0}}, {"40INCRound", {12,0,0,0}, 12000, true, {120,0,0,0}}, {"Bullets22Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"223Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"3006Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"308Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"Bullets357Box", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"Bullets38Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"Bullets380Box", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"Bullets44Box", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"Bullets4570Box", {0,2,0,0}, 0200, true, {2,5,0,0}}, {"Bullets45Box", {0,3,0,0}, 0300, true, {3,0,0,0}}, {"Bullets45LCBox", {0,2,0,0}, 0200, true, {2,0,0,0}}, {"545x39Box", {0,4,0,0}, 0400, true, {4,0,0,0}}, {"556Box", {0,4,5,0}, 0450, true, {4,5,0,0}}, {"Bullets57Box", {0,2,0,0}, 0200, true, {2,0,0,0}}, {"Bullets50MAGBox", {0,5,0,0}, 0500, true, {5,0,0,0}}, {"50BMGBox", {0,5,5,0}, 0550, true, {5,5,0,0}}, {"762x39Box", {0,5,0,0}, 0500, true, {5,0,0,0}}, {"762x51Box", {0,5,0,0}, 0500, true, {5,0,0,0}}, {"762x54rBox", {0,5,0,0}, 0500, true, {5,0,0,0}}};
		weapons[2] = {"Magazines", {"12gDrum", {1,7,5,0}, 1750, false, "12g"}, {"SPASClip", {0,3,0,0}, 0300, false, "12g"}, {"SIX12_Cylinder", {2,5,0,0}, 2500, false, "12g"}, {"22Drum", {1,7,5,0}, 1750, false, ".22-LR"}, {"22ExtClip", {0,3,0,0}, 0300, false, ".22-LR"}, {"22Clip", {0,3,0,0}, 0300, false, ".22-LR"}, {"223Clip", {0,3,0,0}, 0300, false, ".223-REM"}, {"223ExtClip", {0,3,0,0}, 0300, false, ".223"}, {"1903Clip", {0,3,0,0}, 0300, false, "30-06 SPRG"}, {"3006ExtClip", {0,3,0,0}, 0300, false, "30-06 SPRG"}, {"308Belt", {1,7,5,0}, 1750, false, ".308"}, {"308MiniCan", {0,3,0,0}, 0300, false, ".308"}, {"308StdClip", {0,3,0,0}, 0300, false, ".308"}, {"308ExtClip", {0,3,0,0}, 0300, false, ".308"}, {"357Speed", {0,3,0,0}, 0300, false, ".357-MAG"}, {"38Clip", {0,3,0,0}, 0300, false, ".38-SPC"}, {"38Speed", {0,3,0,0}, 0300, false, ".38-SPC"}, {"380ExtClip", {0,3,0,0}, 0300, false, ".380-ACP"}, {"380Clip", {0,3,0,0}, 0300, false, ".380-ACP"}, {"44Clip", {0,2,5,0}, 0250, false, ".44-MAG"}, {"44Speed", {0,3,0,0}, 0300, false, ".44-MAG"}, {"45Clip", {0,2,5,0}, 0250, false, ".45-ACP"}, {"45ExtClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45DSClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45DSExtClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45Drum", {1,7,5,0}, 1750, false, ".45-ACP"}, {"45LCSpeed", {0,3,0,0}, 0300, false, ".45-LC"}, {"50MiniCan", {0,3,0,0}, 0300, false, ".50 BMG"}, {"M82Clip", {0,3,5,0}, 0350, false, ".50 BMG"}, {"545Drum", {1,7,5,0}, 1750, false, "5.45"}, {"545StdClip", {0,3,0,0}, 0300, false, "5.45"}, {"556Belt", {1,7,5,0}, 1750, false, "5.56"}, {"556Drum", {1,7,5,0}, 1750, false, "5.56"}, {"556Clip", {0,3,5,0}, 0350, false, "5.56"}, {"556MiniCan", {0,3,5,0}, 0350, false, "5.56"}, {"57Clip", {0,3,5,0}, 0350, false, "5.7x28"}, {"P90Clip", {0,3,5,0}, 0350, false, "5.7x28"}, {"M14Clip", {0,3,0,0}, 0300, false, ".308"}, {"762x39Belt", {1,7,5,0}, 1750, false, "7.62x39"}, {"762Drum", {1,7,5,0}, 1750, false, "7.62x39"}, {"AKClip", {0,3,5,0}, 0350, false, "7.62x39"}, {"SKSClip", {0,3,5,0}, 0350, false, "7.62x39"}, {"762x54rBelt", {1,7,5,0}, 1750, false, "7.62x54"}, {"SVDClip", {0,3,5,0}, 0350, false, "7.62x54"}, {"MosinClip", {0,3,5,0}, 0350, false, "7.62x54"}, {"9mmClip", {0,3,0,0}, 0300, false, "9mm"}, {"9mmExtClip", {0,3,0,0}, 0300, false, "9mm"}, {"9mmDrum", {1,7,5,0}, 1750, false, "9mm"}, {"ASHClip", {0,3,0,0}, 0300, false, ".50 MAG"}};
		weapons[3] = {"Attachments", {"Sight_3xEOTech", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_4xACOG", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_Aimpoint_Dot", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_Thermal", {0,3,5,0}, 0350, false, "Sight"}, {"Laser_PEQ15", {0,3,5,0}, 0350, false, "Side"}, {"Choke_Full", {0,2,0,0}, 0200, false, "Barrel"}, {"ChokeTubeImproved", {0,2,0,0}, 0200, false, "Barrel"}, {"FiberglassStock", {0,1,5,0}, 0150, false, "Stock"}, {"Sight_Malcom", {0,4,5,0}, 0450, false, "Sight"}, {"IronSight", {0,1,0,0}, 0100, false, "Sight"}, {"Laser", {0,2,0,0}, 0200, false, "Side"}, {"Light_Large", {0,2,0,0}, 0200, false, "Side"}, {"Light_Small", {0,1,0,0}, 0100, false, "Side"}, {"Sight_VX3", {0,4,5,0}, 0450, false, "Sight"}, {"RecoilPad", {0,1,0,0}, 0100, false, "Stock"}, {"Pad", {0,1,0,0}, 0100, false, "Stock"}, {"RedDot", {0,2,0,0}, 0200, false, "Sight"}, {"Sight_G28_Scope", {0,4,5,0}, 0450, false, "Sight"}, {"Sling_1", {0,1,5,0}, 0150, false, "Bottom"}, {"Sling_2", {0,1,5,0}, 0150, false, "Bottom"}, {"Sling_3", {0,1,5,0}, 0150, false, "Bottom"}, {"Launcher", {1,2,5,0}, 1250, false, "Bottom"}, {"Suppressor_BMG", {0,5,0,0}, 0500, false, "Barrel"}, {"Suppressor_ROME_BMG", {0,5,5,0}, 0550, false, "Barrel"}, {"Suppressor_Pistol", {0,4,0,0}, 0400, false, "Barrel"}, {"Suppressor_SOCOM_Pistol", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_Shotgun", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_Rifle", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_PBS1_Rifle", {0,5,5,0}, 0550, false, "Barrel"}, {"x2Scope", {0,3,0,0}, 0300, false, "Sight"}, {"x4Scope", {0,3,5,0}, 0350, false, "Sight"}, {"x8Scope", {0,4,0,0}, 0400, false, "Sight"}};
		weapons[4] = {"Caliber", "12g", ".22-LR", ".223-REM", "30-06 SPRG", ".308", ".357-MAG", ".38-SPC", ".380-ACP", ".44-MAG", ".45-ACP", ".45-LC", "5.45", "5.56", "5.7x28", ".50 MAG", ".50 BMG", "7.62x39", "7.62x54", "9mm"};
		weapons[5] = {"Pistols", {"Automag", {3,5,0,0}, 3500, false, ".44-MAG"}, {"B93R", {3,0,0,0}, 3000, false, "9mm"}, {"M9", {3,0,0,0}, 3000, false, "9mm"}, {"M9A3", {3,0,0,0}, 3000, false, "9mm"}, {"CZ75", {3,0,0,0}, 3000, false, "9mm"}, {"G17", {3,0,0,0}, 3000, false, "9mm"}, {"G18", {3,0,0,0}, 3000, false, "9mm"}, {"G21", {3,0,0,0}, 3000, false, ".45-ACP"}, {"G42", {3,0,0,0}, 3000, false, ".380-ACP"}, {"HK_USP", {3,5,0,0}, 3500, false, ".44-MAG"}, {"Pistol3", {3,0,0,0}, 3000, false, ".44-MAG"}, {"Pistol2", {3,0,0,0}, 3000, false, ".45 Auto"}, {"Revolver_Long", {2,0,0,0}, 2000, false, ".44-MAG"}, {"Revolver", {2,0,0,0}, 2000, false, ".45 Auto"}, {"Revolver_Short", {1,5,0,0}, 1500, false, ".38-SPC"}, {"M4506", {3,0,0,0}, 3000, false, ".45-ACP"}, {"M5238", {3,0,0,0}, 3000, false, ".38-SPC"}, {"M5906", {3,0,0,0}, 3000, false, "9mm"}, {"Pistol", {2,5,0,0}, 2500, false, "9mm"}};
		weapons[6] = {"Shotguns", {"DAO12", {2,5,0,0}, 2500, false, "12g"}, {"AA12", {4,5,0,0}, 4500, false, "12g"}, {"DT11", {2,5,0,0}, 2500, false, "12g"}, {"CAWS", {4,5,0,0}, 4500, false, "12g"}, {"DoubleBarrelShotgun", {0,7,5,0}, 750, false, "12g"}, {"Shotgun", {2,5,0,0}, 2500, false, "12g"}, {"SIX12SD", {6,5,0,0}, 6500, false, "12g"}};
		weapons[7] = {"Rifles", {"AK103", {7,5,0,0}, 7500, false, "7.62x39"}, {"AK12_New", {7,5,0,0}, 7500, false, "5.45"}, {"AK47", {7,5,0,0}, 7500, false, "7.62x39"}, {"AK74", {7,5,0,0}, 7500, false, "5.45"}, {"AKM", {7,5,0,0}, 7500, false, "7.62x39"}, {"M4A1", {8,5,0,0}, 8500, false, "5.56"}, {"DR_200", {7,5,0,0}, 7500, false, "5.56"}, {"K2_1", {7,5,0,0}, 7500, false, "5.56"}, {"SVDK", {10,0,0,0}, 10000, false, "7.62x54"}, {"EDM96", {12,0,0,0}, 12000, false, ".50 BMG"}, {"Gepard_M6", {12,0,0,0}, 12000, false, ".50 BMG"}, {"G11K3", {7,5,0,0}, 7500, false, "5.7x28"}, {"G36KV", {7,5,0,0}, 7500, false, "5.56"}, {"HuntingRifle", {4,5,0,0}, 4500, false, ".308"}, {"AssaultRifle2", {7,5,0,0}, 7500, false, ".308"}, {"AssaultRifle", {10,0,0,0}, 10000, false, "5.56"}, {"M40A1", {7,5,0,0}, 7500, false, ".308"}, {"M40A3", {7,5,0,0}, 7500, false, ".308"}, {"VarmintRifle", {3,5,0,0}, 3500, false, ".223-REM"}};
		weapons[9] = {"SMGs", {"CAR15SMG", {6,0,0,0}, 6000, false, "5.56"}, {"K1_1", {6,0,0,0}, 6000, false, "5.56"}, {"K7_Stock", {6,0,0,0}, 6000, false, "9mm"}};
		weapons[10] = {"LMGs", {"K3LMG", {12,0,0,0}, 12000, false, "5.56"}, {"G21LMG", {12,0,0,0}, 12000, false, ".308"}, {"XM8LMG", {12,0,0,0}, 12000, false, "5.56"}, {"M249", {12,0,0,0}, 12000, false, "5.56"}, {"K12", {12,0,0,0}, 12000, false, ".308"}};
	end
end

Events.OnFillWorldObjectContextMenu.Add(VendISWorldObjectContextMenu.createMenu);
Events.OnLoad.Add(Vendors_CheckMods);