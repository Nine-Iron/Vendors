if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end

local filibuster = nil;


local vendMoney = {};
vendMoney.total = 0;
local moneyContainer = nil;

local vendorsSaleTotal = 0;


local vendorWallet = {};

vendorsJewelry = {};
vendorsJewelry.prices = {};
vendorsJewelry.prices.tags = 50;
vendorsJewelry.prices.stones = 25;
vendorsJewelry.prices.regular = 10;
vendorsJewelry.stones = {};
vendorsJewelry.regular = {};
vendorsJewelry.tags = {};
vendorsTools = {};
vendorsVehicles = {};
vendorsWeapons = {};
vendorsJewelry.green = {};

vendorsTools[1] = {"Camping", {"SharpedStone", 25}, {"Lighter", 45}, {"PercedWood", 50}, {"WoodenStick", 50}};
vendorsTools[2] = {"Construction", {"Axe", 100}, {"BucketEmpty", 250}, {"Crowbar", 75}, {"Hammer", 45}, {"Needle", 25}, {"Paintbrush", 25}, {"PropaneTank", 125}, {"BlowTorch", 250}, {"Saw", 75}, {"Screwdriver", 50}, {"AxeStone", 75}, {"HammerStone", 50}, {"WeldingMask", 50}};
vendorsTools[3] = {"Cooking", {"BakingPan", 45}, {"Bowl", 250}, {"BoxOfJars", 50}, {"JarLid", 50, 6}, {"TinOpener", 50}, {"Pot", 50}, {"Pan", 45}, {"KitchenKnife", 250}, {"Kettle", 50}, {"RollingPin", 25}, {"BakingPan", 50}, {"Saucepan", 50}};
vendorsTools[4] = {"Farming", {"farming.GardeningSprayEmpty", 75}, {"farming.WateredCan", 100}, {"Fertilizer", 75}, {"EmptySandbag", 25}, {"farming.Shovel", 100}, {"farming.HandShovel", 100}};
vendorsTools[5] = {"Fishing", {"FishingNet", 75}, {"FishingRod", 100}, {"FishingTackle", 45}};
vendorsTools[6] = {"Light", {"Torch", 75}, {"Matches", 50}}
vendorsTools[7] = {"Mechanics", {"PetrolCan", 100}, {"Jack", 75}, {"LugWrench", 75}, {"TirePump", 75}, {"Wrench", 75}};
vendorsTools[8] = {"Stationary", {"Notebook", 50}, {"Eraser", 50}, {"Journal", 50}, {"Pen", 50}, {"Pencil", 50}, {"SheetPaper2", 50}};
vendorsTools[9] = {"Trapping", {"TrapCage", 75}, {"TrapMouse", 25}, {"TrapSnare", 60}, {"TrapStick", 50}, {"TrapBox", 60}, {"TrapCrate", 60}};

vendorsVehicles = {};
vendorsVehicles.parts = {};
vendorsVehicles.parts[1] = {{"CarBattery1", 500}, {"FrontCarDoor1", 500}, {"EngineDoor1", 500}, {"ModernBrake1", 500}, {"TrunkDoor1", 500}, {"RearCarDoor1", 500}, {"RearCarDoorDouble1", 500}, {"BigGasTank1", 500}, {"ModernCarMuffler1", 500}, {"NormalCarSeat1", 500}, {"ModernSuspension1", 500}, {"ModernTire1", 500}, {"Windshield1", 500}, {"RearWindshield1", 500}, {"FrontWindow1", 500}, {"RearWindow1", 500}, "Standard"};
vendorsVehicles.parts[2] = {{"CarBattery1", 1000}, {"FrontCarDoor1", 1000}, {"EngineDoor1", 1000}, {"ModernBrake1", 1000}, {"TrunkDoor1", 1000}, {"RearCarDoor1", 1000}, {"RearCarDoorDouble1", 1000}, {"BigGasTank1", 1000}, {"ModernCarMuffler1", 1000}, {"NormalCarSeat1", 1000}, {"ModernSuspension1", 1000}, {"ModernTire1", 1000}, {"Windshield1", 1000}, {"RearWindshield1", 1000}, {"FrontWindow1", 1000}, {"RearWindow1", 1000}, "Sport"};
vendorsVehicles.parts[3] = {{"CarBattery1", 2000}, {"FrontCarDoor1", 2000}, {"EngineDoor1", 2000}, {"ModernBrake1", 2000}, {"TrunkDoor1", 2000}, {"RearCarDoor1", 2000}, {"RearCarDoorDouble1", 2000}, {"BigGasTank1", 2000}, {"ModernCarMuffler1", 2000}, {"NormalCarSeat1", 2000}, {"ModernSuspension1", 2000}, {"ModernTire1", 2000}, {"Windshield1", 2000}, {"RearWindshield1", 2000}, {"FrontWindow1", 2000}, {"RearWindow1", 2000}, "Heavy-Duty"};
vendorsVehicles.engineParts = {20000, 30};

vendorsWeapons = {};
vendorsWeapons[1] = {"Box_Ammo", {"ShotgunShellsBox", 150, true}, {"223Box", 250, true}, {"308Box", 250, true}, {"Bullets38Box", 100, true}, {"Bullets45Box", 100, true}, {"556Box", 200, true}};
vendorsWeapons[2] = {"Magazines", {"223Clip", 300, false, ".223-REM"}, {"308Clip", 300, false, ".308"}, {"44Clip", 250, false, ".44-MAG"}, {"45Clip", 250, false, ".45 Auto"}, {"556Clip", 350, false, "5.56"}, {"M14Clip", 300, false, ".308"}, {"9mmClip", 300, false, "9mm"}};
vendorsWeapons[3] = {"Attachments", {"ChokeTubeImproved", 200, false, "Barrel"}, {"FiberglassStock", 150, false, "Stock"}, {"IronSight", 100, false, "Sight"}, {"Laser", 200, false, "Side"}, {"RecoilPad", 100, false, "Stock"}, {"RedDot", 200, false, "Sight"}, {"Sling", 150, false, "Bottom"}, {"x2Scope", 300, false, "Sight"}, {"x4Scope", 350, false, "Sight"}, {"x8Scope", 400, false, "Sight"}};
vendorsWeapons[4] = {"Caliber", ".223-REM", ".308", ".44-MAG", ".45 Auto", "5.56", "9mm"};
vendorsWeapons[5] = {"Pistols", {"Pistol", 2500, false, "9mm"}, {"Pistol2", 3000, false, ".45 Auto"}, {"Pistol3", 3000, false, ".44-MAG"}, {"Revolver_Long", 2000, false, ".44-MAG"}, {"Revolver", 2000, false, ".45 Auto"}, {"Revolver_Short", 1500, false, ".38-SPC"}};
vendorsWeapons[6] = {"Shotguns", {"DoubleBarrelShotgun", 750, false, "12g"}, {"Shotgun", 2500, false, "12g"}};
vendorsWeapons[7] = {"Rifles", {"AssaultRifle2", 7500, false, ".308"}, {"AssaultRifle",  10000, false, "5.56"}, {"VarmintRifle", 3500, false, ".223-REM"}, {"HuntingRifle", 4500, false, ".308"}};
vendorsWeapons[8] = {"Slots", "Barrel", "Bottom", "Side", "Sight", "Stock"};

vendorsFoods = {};
vendorsFoods[1] = {"Canned_Goods", {"TinnedBeans", 50}, {"CannedChili", 50}, {"CannedCorn", 50}, {"CannedCornedBeef", 50}, {"CannedFruitCocktail", 50}, {"CannedMushroomSoup", 50}, {"CannedPeaches", 50}, {"CannedPeas", 50}, {"CannedPineapple", 50}, {"CannedPotato2", 50}, {"CannedSardines", 50}, {"TinnedSoup", 50}, {"CannedBolognese", 50}, {"CannedTomato2", 50}, {"TunaTin", 50}};
vendorsFoods[2] = {"Condiments", {"SugarBrown", 10}, {"Hotsauce", 10}, {"Ketchup", 10}, {"MapleSyrup", 10}, {"Marinara", 10}, {"farming.MayonnaiseFull", 10}, {"Mustard", 10}, {"OilOlive", 10}, {"Pepper", 10}, {"RiceVinegar", 10}, {"Salt", 10}, {"Soysauce", 10}, {"Sugar", 10}, {"OilVegetable", 10}, {"Wasabi", 10}};
vendorsFoods[3] = {"Drinks", {"BeerBottle", 60}, {"BeerCan", 60}, {"Bleach", 60}, {"WhiskeyFull", 60}, {"ColdDrinkSpiffo", 60}, {"Mugfull", 60}, {"HotDrinkTea", 60}, {"OilOlive", 60}, {"JuiceBox", 60}, {"Milk", 60}, {"PopBottle", 60}, {"Wine2", 60}, {"Wine", 60}};
vendorsFoods[4] = {"Fish", {"Bass", 75}, {"Catfish", 75}, {"Crappie", 75}, {"Crayfish", 75}, {"FishFillet", 75}, {"FishRoe", 75}, {"BaitFish", 75}, {"Lobster", 75}, {"Oysters", 75}, {"Perch", 75}, {"Pike", 75}, {"Salmon", 75}, {"Shrimp", 75}, {"Squid", 75}, {"SquidCalamari", 75}, {"Panfish", 75}, {"Trout", 75}};
vendorsFoods[5] = {"Game", {"DeadBird", 40}, {"DeadMouse", 40}, {"DeadRabbit", 40}, {"DeadRat", 40}, {"DeadSquirrel", 40}, {"Rabbitmeat", 40}, {"Smallanimalmeat", 40}, {"Smallbirdmeat", 40}};
vendorsFoods[6] = {"Pickled_Food", {"CannedBellPepper", 40}, {"CannedBroccoli", 40}, {"CannedCabbage", 40}, {"CannedCarrots", 40}, {"CannedEggplant", 40}, {"CannedLeek", 40}, {"CannedPotato", 40}, {"CannedRedRadish", 40}, {"CannedTomato", 40}};
vendorsFoods[7] = {"Proteins", {"farming.Bacon", 100}, {"BeefJerky", 100}, {"Chicken", 100}, {"EggCarton", 100}, {"FrogMeat", 100}, {"Ham", 100}, {"MeatPatty", 100}, {"MincedMeat", 100}, {"MuttonChop", 100}, {"Pepperoni", 100}, {"PorkChop", 100}, {"Salami", 100}, {"Sausage", 100}, {"Steak", 100}, {"Tofu", 100}};
vendorsFoods[8] = {"Medical", {"AlcoholWipes", 40}, {"Antibiotics", 75}, {"PillsAntiDep", 75}, {"Bandage", 40}, {"PillsBeta", 40}, {"Disinfectant", 75}, {"Cigarettes", 40}, {"FirstAidKit", 100}, {"Pills", 75}, {"AlcoholBandage", 60}, {"PillsVitamins", 75}, {"Splint", 80}, {"SutureNeedle", 40}, {"SutureNeedleHolder", 40}, {"Tweezers", 40}};

function VendISWorldObjectContextMenu.createMenu(player, context, worldobjects, test)
	Vendors_CheckMods();
	-- reset values for inventory search.
	local fanleaf = 0;
	vendorsJewelry.stones = {};
	vendorsJewelry.regular = {};
	vendorsJewelry.tags = {};
	vendorsJewelry.regular.items = {};
	vendorsJewelry.stones.items = {};
	vendorsJewelry.tags.items = {};
	vendorsJewelry.green = {};
	vendorsJewelry.green.items = {};
	vendorsSaleTotal = 0;
	vendMoney[1] = 0;
	vendMoney[2] = 0;
	vendMoney[3] = 0;
	vendMoney[4] = 0;
	vendMoney.total = 0
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
				end
				if dispCat == "Vendors" then
					if not vendorList then vendorList = {}; vendorList.vendors = {}; end
					if vendorList[dispType] then 
					else
						vendorList[dispType] = item;
						table.insert(vendorList.vendors, dispType);
					end
				end
				if item:isInPlayerInventory() then
					if not vendorWallet then vendorWallet = {}; end
					if dispCat == "Money" then
						moneyContainer = container;
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
						table.insert(vendorsJewelry.tags.items, {item, vendorsJewelry.prices.tags, container});
						if not vendorsJewelry.tags[dispType] then vendorsJewelry.tags[dispType] = {};
							vendorsJewelry.tags[dispType].items = {item, vendorsJewelry.prices.tags};
							vendorsJewelry.tags[dispType].count = 1;
							vendorsJewelry.tags[dispType].menuCreated = false;
						else 
							vendorsJewelry.tags[dispType].count = vendorsJewelry.tags[dispType].count + 1;
						end
						vendorsSaleTotal = vendorsSaleTotal + vendorsJewelry.tags[dispType].items[2];
					elseif string.find(dispType, "Diamond") or string.find(dispType, "Emerald") or string.find(dispType, "Amethyst") or string.find(dispType, "Ruby") or string.find(dispType, "Sapphire") then
															-- price for selling vendorsJewelry with stones
						table.insert(vendorsJewelry.stones.items, {item, vendorsJewelry.prices.stones, container})
						if not vendorsJewelry.stones[dispType] then vendorsJewelry.stones[dispType] = {};
							vendorsJewelry.stones[dispType].items = {item, vendorsJewelry.prices.stones};
							vendorsJewelry.stones[dispType].count = 1;
							vendorsJewelry.stones[dispType].menuCreated = false;
						else 
							vendorsJewelry.stones[dispType].count = vendorsJewelry.stones[dispType].count + 1;
						end
						vendorsSaleTotal = vendorsSaleTotal + vendorsJewelry.stones[dispType].items[2];
					elseif not string.find(dispType, "Flame") and not string.find(dispType, "Key") and not string.find(dispType, "DogTag") and (item:getDisplayCategory() == "Accessory" and ((string.find(dispType, "Ring") or string.find(dispType, "ring"))) or string.find(dispType, "necklace") or string.find(dispType, "Necklace") or string.find(dispType, "Bangle") or string.find(dispType, "Locket") or string.find(dispType, "Watch") or (string.find(dispType, "Nose") and string.find(dispType, "Stud")) or string.find(dispType, "BellyButton")) then
															-- price for selling regular vendorsJewelry
						table.insert(vendorsJewelry.regular.items, {item, vendorsJewelry.prices.regular, container});
						if not vendorsJewelry.regular[dispType] then vendorsJewelry.regular[dispType] = {};
							vendorsJewelry.regular[dispType].items = {item, vendorsJewelry.prices.regular};
							vendorsJewelry.regular[dispType].count = 1;
							vendorsJewelry.regular[dispType].menuCreated = false;
						else
							vendorsJewelry.regular[dispType].count = vendorsJewelry.regular[dispType].count + 1;
						end
						vendorsSaleTotal = vendorsSaleTotal + vendorsJewelry.regular[dispType].items[2];
					end
					-- looking for GreenFireMod products  TODO Add more gfm items, add brita weapons
					vendorsSaleTotal = vendorsSaleTotal + Vendors_GreenFireCheck(item, container, vendorsSaleTotal);
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
	if vendorType == "ATMMachine" then
		-- looking for jewelry items that were found during the inventory search in the initial function
		if #vendorsJewelry.tags.items == 0 and #vendorsJewelry.stones.items == 0 and #vendorsJewelry.regular.items == 0 and #vendorsJewelry.green.items == 0 then
			local subSubVendorOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Nothing_To_Sell"), worldobjects);
		else
			local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_Sell_All") .. "($" .. vendorsSaleTotal .. ")", worldobjects, Buy_VendorsItem, player, vendorsJewelry, true, 0, true);
			if #vendorsJewelry.tags.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, vendorsJewelry.tags)
			end
			if #vendorsJewelry.stones.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, vendorsJewelry.stones)
			end
			if #vendorsJewelry.regular.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, vendorsJewelry.regular)
			end
			if #vendorsJewelry.green.items > 0 then
				Vendors_DisplayJewelryOptions(subSubMenu, context, player, vendorsJewelry.green)
			end
		end
	end
	-- food, were building menus to buy food
	if vendorType == "FoodVendor" then
		Vendors_DisplayFoodOptions(subSubMenu, context, player, vendorsFoods);		
	end
	-- tools.  for to buy
	if vendorType == "ToolVendor" then
		Vendors_DisplayToolOptions(subSubMenu, context, player, vendorsTools)
	end
	if vendorType == "VehicleVendor" then
		-- creating a menu item for engine parts, to be listed in the first vehicle submenu above the other submenu options
		local part = {"EngineParts", vendorsVehicles.engineParts[1]};
		local partName = "EngineParts";
		-- im not sure how to get the item name in order to avoid adding translations for everything unless i add it to your inventory.  so everything on the list, everything(minus what you're selling), is added and then removed from your inventory...  sorry, if anyone has a method to get the actual item object without having it in your inventory, i could use your help...
		local partItem = playerInv:AddItem(partName);
		local partItemType = partItem:getType();
		local partItemName = partItem:getName();
		local partItemQuant = vendorsVehicles.engineParts[2]
		local partItemPrice = vendorsVehicles.engineParts[1]
		playerInv:Remove(partItem);
		local vehicle = player:getNearVehicle();
		if vehicle then
			local subSubVendorOption = subSubMenu:addOption(getText("IGUI_VehicleName" .. vehicle:getScript():getName()) .. " key - $5000", playerObj, Buy_VendorsVehicleKey, vehicle);
		end
		local subSubVendorOption = subSubMenu:addOption(partItemQuant .. " " .. partItemName .. " - ($" .. partItemPrice .. ")", worldobjects, Buy_VendorsItem, player, part, false, partItemPrice, false, 30);
		for i,v in pairs(vendorsVehicles.parts) do
			local subTable = v;
			local vehicleOption = subSubMenu:addOption(getText("ContextMenu_" .. subTable[17] .. "_Type_Car_Parts"), worldobjects);
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(vehicleOption, subSubMenu);
			for h, w in pairs(subTable) do
				if h < 17 then
					local part = w;
					local partName = w[1];
					local partPrice = w[2];
					local partItem = playerInv:AddItem(partName);
					local partItemType = partItem:getType();
					local partItemName = partItem:getName();
					playerInv:Remove(partItem);
					local subSubVendorOption = subSubMenu:addOption(partItemName .. "($" .. partPrice .. ")", worldobjects, Buy_VendorsItem, player, part, false, partPrice, false);					
				end
			end 
		end
	end
	if vendorType == "WeaponVendor" then
		for i,v in pairs(vendorsWeapons) do
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
						for n,o in pairs(vendorsWeapons[2]) do
							local magazineCaliber = o[4];
							if magazineCaliber == caliber then
								local magazine = o;
								local magazineName = magazine[1];
								-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
								local magazinePrice = magazine[2];
								local magazineItem = playerInv:AddItem(magazineName);
								local magazineItemType = magazineItem:getType();
								local magazineItemName = magazineItem:getName();
								if magazineName == "M14Clip" then magazineItemName = ".308 Magazine(M14)"; end
								playerInv:Remove(magazineItem);
								local subSubVendorOption = subSubMenu:addOption(magazineItemName .. "($" .. magazinePrice .. ")", worldobjects, Buy_VendorsItem, player, magazine, false, magazinePrice, false);
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
						local multipleBuy = weapon[3];
						local weaponItem = playerInv:AddItem(weaponName);
						local weaponItemType = weaponItem:getType();
						local weaponItemIsWeapon = weaponItem:IsWeapon();
						local weaponItemName = weaponItem:getName();
						playerInv:Remove(weaponItem);
						if weaponItemIsWeapon then
							local weaponItemAmmoType = weapon[4];
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - (" .. weaponItemAmmoType .. ") - ($" .. weaponPrice .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
						elseif multipleBuy == true then
							local ammoBoxOption = subSubMenu:addOption(weaponItemName, worldobjects);
							local subSubMenu = ISContextMenu:getNew(subSubMenu);
							local subContext = context:addSubMenu(ammoBoxOption, subSubMenu);
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - 1 for ($" .. weaponPrice .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
							weaponPrice10 = weaponPrice*10;
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - 10 for ($" .. weaponPrice10 .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice10, false, 10);	
							weaponPrice25 = weaponPrice*25
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - 25 for ($" .. weaponPrice25 .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice25, false, 25);				
						else
							local subSubVendorOption = subSubMenu:addOption(weaponItemName .. " - ($" .. weaponPrice .. ")", worldobjects, Buy_VendorsItem, player, weapon, false, weaponPrice, false);
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
	local moneyInteger = itemTable[2];
	local sellAllTotal = 0;
	-- if were selling all the loot, then were searching through all the tables.  the tables of items that we're going to sell, not the ones filled with stuff we might buy.
	if sellAll then
		if #vendorsJewelry.tags.items > 0 then
			for i,v in ipairs(vendorsJewelry.tags.items) do
				local jewelryItem = v[1];
				local moneyInteger = v[2];
				Vendors_RemoveItem(jewelryItem, v[3]);
				sellAllTotal = sellAllTotal + v[2];
			end
		end
		-- another bag of loot to sift through
		if #vendorsJewelry.stones.items > 0 then
			for i,v in pairs(vendorsJewelry.stones.items) do
				local jewelryItem = v[1];
				Vendors_RemoveItem(jewelryItem, v[3])
				sellAllTotal = sellAllTotal + v[2];
			end
		end
		-- and another one gone, and another one gone
		if #vendorsJewelry.regular.items > 0 then
			for i,v in pairs(vendorsJewelry.regular.items) do
				local jewelryItem = v[1];
				local moneyInteger = v[2];
				Vendors_RemoveItem(jewelryItem, v[3]);
				sellAllTotal = sellAllTotal + v[2];
			end
		end
		-- last one for sell all!
		if #vendorsJewelry.green.items > 0 then
			for i,v in pairs(vendorsJewelry.green.items) do
				local jewelryItem = v[1];
				local moneyInteger = v[2];
				if v[4] then
					local quantity = v[4];
					sellAllTotal = sellAllTotal + v[2];
					for h=1, quantity do
						Vendors_RemoveItem(jewelryItem, v[3]);
					end
				else
					Vendors_RemoveItem(jewelryItem, v[3]);
					sellAllTotal = sellAllTotal + v[2];
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
					for i,v in pairs(jewelryItem) do
						if v[1]:getType() == item[2] then
							Vendors_RemoveItem(v[1], v[3]);
						end
					end
					moneyInteger = item[3]*quantity;
				else
					jewelryItem = jewelryItem:getType();
					for j=1, quantity do
						Vendors_RemoveItem(jewelryItem, item[3]);
					end
				end
			end
		else
			Vendors_RemoveItem(jewelryItem, item[3]);
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
end

function Buy_VendorsVehicleKey(player, vehicle)
	if vendMoney.total >= 5000 then
		Vendors_CalculateChange(-5000);
		sendClientCommand(player, "vehicle", "getKey", { vehicle = vehicle:getId() });
	else
		player:Say(getText("ContextMenu_Cant_Buy"));
	end
end

function Vendors_CalulatePrice(moneyInteger)

	-- clean this up if you dont need floor  i do need floor but i cleaned it up anyways
	vendCash[1] = {math.floor((moneyInteger)/1000), "Vendors.ThousandDollar", true};
	vendCash[2] = {(math.floor((moneyInteger)/100) - (math.floor(moneyInteger/1000)*10)), "Vendors.HundredDollar"};
	vendCash[3] = {(math.floor((moneyInteger)/10) - (math.floor(moneyInteger/100)*10)), "Vendors.TenDollar"};
	vendCash[4] = {(math.floor((moneyInteger)) - (math.floor(moneyInteger/10)*10)), "Vendors.OneDollar"};
	return vendCash;
end

function Vendors_CalculateChange(moneyInteger)
	if moneyContainer == nil then moneyContainer = getSpecificPlayer(0):getInventory(); end
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
	end
	for i,v in pairs(vendCash) do
		for j=1, v[1] do
		Vendors_AddItem(v[2], moneyContainer);
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
				local foodItem = playerInv:AddItem(foodItemType);
				if foodItem:isCookable() and not string.find(foodItemType, "Dead") then foodItem:setCooked(true); end
				foodItemName = foodItem:getName();
				playerInv:Remove(foodItem);
				if foodItemName == "Cigarettes" then
					for i=1, 19 do
						playerInv:Remove(foodItemName);
					end
				end
				local SubVendorOption = subSubMenu:addOption(foodItemName .. "($" .. foodItemPrice .. ")", worldobjects, Buy_VendorsItem, player, foodItemTable, false, foodItemPrice);
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
				local toolItemQuantity = toolItemTable[3];
				local toolItem = playerInv:AddItem(toolItemType);
				toolItemName = toolItem:getName();
				playerInv:Remove(toolItem);
				if toolItemQuantity then toolItemPrice = toolItemPrice*toolItemQuantity .. ") for (" .. toolItemQuantity; end
				local SubVendorOption = subSubMenu:addOption(toolItemName .. "($" .. toolItemPrice .. ")", worldobjects, Buy_VendorsItem, player, toolItemTable, false, toolItemPrice);
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
		local jewelryItemType = jewelryItemTable[1]:getType();
		if v[4] then 
			quantity = v[4]; 
			jewelryItemPrice = jewelryItemPrice .. " per " .. quantity;
		end
		if jewelryTableList[jewelryItemType].count > 1 and not jewelryTableList[jewelryItemType].menuCreated then
			local jewelryItemOption = subSubMenu:addOption(jewelryItemName .. " ($" .. jewelryItemPrice .. ")", worldobjects);
			local subMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(jewelryItemOption, subMenu);
			local subVendorOption = subMenu:addOption(jewelryItemName .. "($" .. jewelryItemPrice .. ")", worldobjects, Buy_VendorsItem, player, jewelryItemTable, true, jewelryItemPrice);
			local subVendorOption = subMenu:addOption(jewelryItemName .. " - Sell all for ($" .. jewelryItemPrice*jewelryTableList[jewelryItemType].count .. ")", worldobjects, Buy_VendorsItem, player, {jewelryList.items, jewelryItemType, jewelryItemPrice}, true, jewelryItemPrice, false, jewelryTableList[jewelryItemType].count, true);
			jewelryTableList[jewelryItemType].menuCreated = true;
		elseif jewelryTableList[jewelryItemType].count == 1 then
			local subSubVendorOption = subSubMenu:addOption(jewelryItemName .. "($" .. jewelryItemPrice .. ")", worldobjects, Buy_VendorsItem, player, jewelryItemTable, true, jewelryItemPrice);
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
			for n,o in pairs(vendorsWeapons[3]) do
				local slot = o[4];
				if slot == slotOptions then
					local attachment = o;
					local attachmentName = attachment[1];
					-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
					local attachmentPrice = attachment[2];
					local attachmentItem = playerInv:AddItem(attachmentName);
					local attachmentItemType = attachmentItem:getType();
					local attachmentItemName = attachmentItem:getName();
					playerInv:Remove(attachmentItem);
					local subSubVendorOption = subSubMenu:addOption(attachmentItemName .. "($" .. attachmentPrice .. ")", worldobjects, Buy_VendorsItem, player, attachment, false, attachmentPrice, false);
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
		-- Brita weapons ------------------------------------
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
		-- Green Fire items --------------------------------
		vendorsGreenFire = {{"Kilo of Cannabis", 4500, false}, {"Bag of Cannabis", 100, false}, {"Dry Cannabis Leaf", 10, false, 100}, {"Hashish", 2500, false}, {"Kief", 30, false}, {"Blunt", 10, false}, {"Mixed Blunt", 5, false}, {"Kief Blunt", 40, false}, {"Hashish Blunt", 2525, false}, {"Space Blunt", 2560, false}, {"Cannabis Cigar", 45, false}, {"Premium Cannabis Cigar", 75, false}, {"Deluxe Cannabis Cigar", 45, false}, {"Reserve Cannabis Cigar", 45, false}};
	end
end

function Vendors_GreenFireCheck(item, container)
	salesTotal = 0;
	if GreenFireMod then
	local dispType = item:getType();
	local dispCat = item:getDisplayCategory();
		if dispCat == "GreenFireItem" then
			if string.find(dispType, "Kg") then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[1][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[1][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif string.find(dispType, "Oz") then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[2][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[2][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif string.find(dispType, "DryCannabisFanLeaf") then
				fanleaf = fanleaf + 1;
				if fanleaf == 100 then
					fanleaf = 0;
					table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[3][2], vendorsGreenFire[3][4], container});
					if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
						vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[3][2], container, 100};
						vendorsJewelry.green[dispType].count = 1;
						vendorsJewelry.green[dispType].menuCreated = false;
					else 
						vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
					end
					salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
				end
			elseif dispType == "Hashish" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[4][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[4][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "Kief" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[5][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType] = {item, vendorsGreenFire[5][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType][2];
			elseif dispType == "Blunt" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[6][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[6][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "MixedBlunt" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[7][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[7][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "KiefBlunt" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[8][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[8][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "HashishBlunt" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[9][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[9][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "SpaceBlunt" then
					table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[10][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[10][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "CannaCigar" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[11][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[11][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "PreCannaCigar" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[12][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[12][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "DelCannaCigar" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[13][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[13][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			elseif dispType == "ResCannaCigar" then
				table.insert(vendorsJewelry.green.items, {item, vendorsGreenFire[14][2], container});
				if not vendorsJewelry.green[dispType] then vendorsJewelry.green[dispType] = {};
					vendorsJewelry.green[dispType].items = {item, vendorsGreenFire[14][2], container};
					vendorsJewelry.green[dispType].count = 1;
					vendorsJewelry.green[dispType].menuCreated = false;
				else 
					vendorsJewelry.green[dispType].count = vendorsJewelry.green[dispType].count + 1;
				end
				salesTotal = salesTotal + vendorsJewelry.green[dispType].items[2];
			end
		end
	end
	return salesTotal;
end

Events.OnFillWorldObjectContextMenu.Add(VendISWorldObjectContextMenu.createMenu);