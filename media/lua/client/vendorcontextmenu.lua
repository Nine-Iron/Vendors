if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end
	
local britaMod = nil;
local brita_2Mod = nil;
local GreenFireMod = nil;
local filibuster = nil;


local vendMoney = {};
vendMoney.total = 0;
local jewelry = {};
local venderTools = {{"Axe", {2,5,0,0}, 2500}, {"CarBatteryCharger", {1,0,0,0}, 1000}, {"GardenSaw", {0,5,0,0}, 500}, {"Hammer", {1,5,0,0}, 1500}, {"Jack", {0,5,0,0}, 500}, {"LugWrench", {0,5,0,0}, 500}, {"Needle", {0,2,5,0}, 250}, {"BlowTorch", {2,5,0,0}, 2500}, {"Screwdriver", {2,5,0,0}, 2500}, {"TirePump", {0,5,0,0}, 500}, {"WeldingMask", {2,5,0,0}, 2500}};
local vehicles = {};
vehicles.parts = {};
vehicles.parts[1] = {{"CarBattery1", {1,0,0,0}, 1000}, {"FrontCarDoor1", {1,0,0,0}, 1000}, {"EngineDoor1", {1,0,0,0}, 1000}, {"ModernBrake1", {1,0,0,0}, 1000}, {"TrunkDoor1", {1,0,0,0}, 1000}, {"RearCarDoor1", {1,0,0,0}, 1000}, {"RearCarDoorDouble1", {1,0,0,0}, 1000}, {"BigGasTank1", {1,0,0,0}, 1000}, {"ModernCarMuffler1", {1,0,0,0}, 1000}, {"NormalCarSeat1", {1,0,0,0}, 1000}, {"ModernSuspension1", {1,0,0,0}, 1000}, {"ModernTire1", {1,0,0,0}, 1000}, {"Windshield1", {1,0,0,0}, 1000}, {"RearWindshield1", {1,0,0,0}, 1000}, {"FrontWindow1", {1,0,0,0}, 1000}, {"RearWindow1", {1,0,0,0}, 1000}, "Standard"};
vehicles.parts[2] = {{"CarBattery1", {5,0,0,0}, 5000}, {"FrontCarDoor1", {5,0,0,0}, 5000}, {"EngineDoor1", {5,0,0,0}, 5000}, {"ModernBrake1", {5,0,0,0}, 5000}, {"TrunkDoor1", {5,0,0,0}, 5000}, {"RearCarDoor1", {5,0,0,0}, 5000}, {"RearCarDoorDouble1", {5,0,0,0}, 5000}, {"BigGasTank1", {5,0,0,0}, 5000}, {"ModernCarMuffler1", {5,0,0,0}, 5000}, {"NormalCarSeat1", {5,0,0,0}, 5000}, {"ModernSuspension1", {5,0,0,0}, 5000}, {"ModernTire1", {5,0,0,0}, 5000}, {"Windshield1", {5,0,0,0}, 5000}, {"RearWindshield1", {5,0,0,0}, 5000}, {"FrontWindow1", {5,0,0,0}, 5000}, {"RearWindow1", {5,0,0,0}, 5000}, "Sport"};
vehicles.parts[3] = {{"CarBattery1", {10,0,0,0}, 10000}, {"FrontCarDoor1", {10,0,0,0}, 10000}, {"EngineDoor1", {10,0,0,0}, 10000}, {"ModernBrake1", {10,0,0,0}, 10000}, {"TrunkDoor1", {10,0,0,0}, 10000}, {"RearCarDoor1", {10,0,0,0}, 10000}, {"RearCarDoorDouble1", {10,0,0,0}, 10000}, {"BigGasTank1", {10,0,0,0}, 10000}, {"ModernCarMuffler1", {10,0,0,0}, 10000}, {"NormalCarSeat1", {10,0,0,0}, 10000}, {"ModernSuspension1", {10,0,0,0}, 10000}, {"ModernTire1", {10,0,0,0}, 10000}, {"Windshield1", {10,0,0,0}, 10000}, {"RearWindshield1", {10,0,0,0}, 10000}, {"FrontWindow1", {10,0,0,0}, 10000}, {"RearWindow1", {10,0,0,0}, 10000}, "Heavy-Duty"};
local weapons = {};
weapons[1] = {"Box_Ammo", {"ShotgunShellsBox", {0,1,5,0}, 0150, true, {1,5,0,0}}, {"223Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"308Box", {0,2,5,0}, 0250, true, {2,5,0,0}}, {"Bullets38Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"Bullets45Box", {0,1,0,0}, 0100, true, {1,0,0,0}}, {"556Box", {0,2,0,0}, 0200, true, {2,0,0,0}}};
weapons[2] = {"Magazines", {"223Clip", {0,3,0,0}, 0300, false, ".223-REM"}, {"308Clip", {0,3,0,0}, 0300, false, ".308"}, {"44Clip", {0,2,5,0}, 0250, false, ".44-MAG"}, {"45Clip", {0,2,5,0}, 0250, false, ".45 Auto"}, {"556Clip", {0,3,5,0}, 0350, false, "5.56"}, {"M14Clip", {0,3,0,0}, 0300, false, ".308"}, {"9mmClip", {0,3,0,0}, 0300, false, "9mm"}};
weapons[3] = {"Attachments", {"ChokeTubeImproved", {0,2,0,0}, 0200, false, "Barrel"}, {"FiberglassStock", {0,1,5,0}, 0150, false, "Stock"}, {"IronSight", {0,1,0,0}, 0100, false, "Sight"}, {"Laser", {0,2,0,0}, 0200, false, "Side"}, {"RecoilPad", {0,1,0,0}, 0100, false, "Stock"}, {"RedDot", {0,2,0,0}, 0200, false, "Sight"}, {"Sling", {0,1,5,0}, 0150, false, "Bottom"}, {"x2Scope", {0,3,0,0}, 0300, false, "Sight"}, {"x4Scope", {0,3,5,0}, 0350, false, "Sight"}, {"x8Scope", {0,4,0,0}, 0400, false, "Sight"}};
weapons[4] = {"Caliber", "12g", ".223-REM", ".308", ".44-MAG", ".45 Auto", "5.56", "9mm"};
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
vendorsFoods[1] = {{"farming.BaconBits", {0,0,1,0}, 10}, {"farming.BaconRashers", {0,0,1,0}, 10}, {"Crisps", {0,0,1,0}, 10}, {"Chocolate", {0,0,1,0}, 10}, {"EggBoiled", {0,0,1,0}, 10}, {"EggPoached", {0,0,1,0}, 10}, {"FriedOnionRingsCraft", {0,0,1,0}, 10}, {"DehydratedMeatStick", {0,0,1,0}, 10}, {"NoodleSoup", {0,0,1,0}, 10}};
vendorsFoods[2] = {{"BeanBowl", {0,0,4,0}, 40}, {"CerealBowl", {0,0,4,0}, 40}, {"PastaBowl", {0,0,4,0}, 40}, {"RiceBowl", {0,0,4,0}, 40}, {"SoupBowl", {0,0,4,0}, 40}, {"StewBowl", {0,0,4,0}, 40}, {"Oatmeal", {0,0,4,0}, 40}, {"SushiFish", {0,0,4,0}, 40}};
vendorsFoods[3] = {{"Ham", {0,1,0,0}, 100}, {"MeatPatty", {0,1,0,0}, 100}, {"MincedMeat", {0,1,0,0}, 100}, {"Steak", {0,1,0,0}, 100}, {"Chicken", {0,1,0,0}, 100}, {"Baloney", {0,1,0,0}, 100}, {"MuttonChop", {0,1,0,0}, 100}, {"PorkChop", {0,1,0,0}, 100}, {"Lobster", {0,1,0,0}, 100}, {"Salmon", {0,1,0,0}, 100}, {"Squid", {0,1,0,0}, 100}, {"Watermelon", {0,1,0,0}, 100}};
local vendorWallet = {};

function VendISWorldObjectContextMenu.createMenu(player, context, worldobjects, test)
	-- reset values for inventory search.
	local fanleaf = 0;
	jewelry.stones = {};
	jewelry.regular = {};
	jewelry.tags = {};
	jewelry.green = {};
	vendMoney[1] = 0;
	vendMoney[2] = 0;
	vendMoney[3] = 0;
	vendMoney[4] = 0;
	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then return; end
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
							vendMoney[4] = vendMoney[4] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "TenDollar" then
							vendMoney[3] = vendMoney[3] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "HundredDollar" then
							vendMoney[2] = vendMoney[2] + 1;
							table.insert(vendorWallet, item);
						elseif dispType == "ThousandDollar" then
							vendMoney[1] = vendMoney[1] + 1;
							table.insert(vendorWallet, item);
						end
						vendMoney.total = ((vendMoney[1]*1000)+(vendMoney[2]*100)+(vendMoney[3]*10)+(vendMoney[4]));
					elseif string.find(dispType, "Diamond") or string.find(dispType, "Emerald") or string.find(dispType, "Amethyst") or string.find(dispType, "Ruby") or string.find(dispType, "Sapphire") then
						table.insert(jewelry.stones, {item, {0,0,0,2}})
					elseif not string.find(dispType, "Key") and (item:getDisplayCategory() == "Accessory" and ((string.find(dispType, "Ring") or string.find(dispType, "ring"))) or string.find(dispType, "necklace") or string.find(dispType, "Locket") or string.find(dispType, "Watch")) then
						table.insert(jewelry.regular, {item, {0,0,0,1}});
					elseif string.find(dispType, "DogTag") then
							table.insert(jewelry.tags, {item, {0,0,5,0}});
					-- looking for GreenFireMod products  TODO Add more gfm items, add brita weapons
					elseif GreenFireMod then
						if dispCat == "GreenFireItem" then
							if string.find(dispType, "Oz") then
								table.insert(jewelry.green, {item, {0,1,0,0}, 100});
							elseif string.find(dispType, "Kg") then
								table.insert(jewelry.green, {item, {4,5,0,0}, 4500});
							elseif string.find(dispType, "DryCannabisFanLeaf") then
								fanleaf = fanleaf + 1;
								if fanleaf == 100 then
									fanleaf = 0;
									table.insert(jewelry.green, {item, {0,0,1,0}, 10, 100});
								end
							elseif(string.find(dispType, "CannaCigar") and not string.find(dispType, "Half")) then
								table.insert(jewelry.green, {item, {0,0,6,0}, 60});
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
	local playerInv = playerObj:getInventory()
	-- searching for vendor type to display correct context menus
	if vendorType == "ATM Machine" then
		-- looking for jewelry items that were found during the inventory search in the initial function
		if #jewelry.tags == 0 and #jewelry.stones == 0 and #jewelry.regular == 0 and #jewelry.green == 0 then
			local subSubVendorOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Nothing_To_Sell"), worldobjects);
		else
			local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_Sell_All"), worldobjects, Buy_VendorsItem, player, jewelry, true, 0, true);
			if #jewelry.tags > 0 then
				local jewelryName = jewelry.tags[1]:getName();
				local subSubVendorOption = subSubMenu:addOption(getText(jewelryName) .. "($50)", worldobjects, Buy_VendorsItem, player, jewelry.tags[1], true, {0,0,5,0});
			end
			if #jewelry.stones > 0 then
				for i,v in pairs(jewelry.stones) do
					local jewelryName = v[1]:getName();
					local jewelryTable = v;					
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryName) .. "($2)", worldobjects, Buy_VendorsItem, player, jewelryTable, true, {0,0,0,2});
				end
			end
			if #jewelry.regular > 0 then
				for i,v in pairs(jewelry.regular) do
					local jewelryTable = v;
					local jewelryName = v[1]:getName();
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryName) .. "($1)", worldobjects, Buy_VendorsItem, player, jewelryTable, true, {0,0,0,1});
				end
			end
			if #jewelry.green > 0 then
				for i,v in pairs(jewelry.green) do
					local jewelryTable = v;
					local jewelryName = v[1]:getName();
					local vendorValue = v[2];
					local vendorPrice = v[3];
					if v[4] then 
						quantity = v[4]; 
						vendorPrice = vendorPrice .. " per " .. quantity;
					end
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryName) .. "($" .. vendorPrice .. ")", worldobjects, Buy_VendorsItem, player, jewelryTable, true, vendorValue, false, quantity);
				end
			end
		end
	end
	-- food, were building menus to buy food
	if vendorType == "Food Vendor" then
		-- these are $10
		if #vendorsFoods[1] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_10_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			-- checking to make sure you have enough money to purchase the items in this menu
			for i,v in pairs(vendorsFoods[1]) do
				local food = v;
				local foodName = v[1];
				local foodItem = playerInv:AddItem(foodName);
				if foodItem:isCookable() then foodItem:setCooked(true); end
				local foodItemType = foodItem:getType();
				local foodItemName = foodItem:getName();
				playerInv:Remove(foodItem);
				local foodPrice = v[2];
				local foodValue = v[3];
				local subSubVendorOption = subSubMenu:addOption(foodItemName, worldobjects, Buy_VendorsItem, player, food, false, vendorPrice, false);
			end
		end
		-- these are $40
		if #vendorsFoods[2] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_40_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			for i,v in pairs(vendorsFoods[2]) do
				local food = v;
				local foodName = v[1];
				local foodItem = playerInv:AddItem(foodName);
				if foodItem:isCookable() then foodItem:setCooked(true); end
				local foodItemType = foodItem:getType();
				local foodItemName = foodItem:getName();
				playerInv:Remove(foodItem);
				local vendorPrice = v[2];
				local foodValue = v[3];
				local subSubVendorOption = subSubMenu:addOption(foodItemName, worldobjects, Buy_VendorsItem, player, food, false, vendorPrice, false);
			
			end
		end
		-- these are $100, i think it's kind of easy to tell what this is and i don't want you to think that i think you're an idiot.  im just practicing my notes.  
		if #vendorsFoods[3] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_100_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			for i,v in pairs(vendorsFoods[3]) do
				local food = v;
				local foodName = v[1];
				local foodItem = playerInv:AddItem(foodName);
				if foodItem:isCookable() then foodItem:setCooked(true); end
				if foodItem:isCookable() then foodItem:setCooked(true); end
				local foodItemType = foodItem:getType();
				local foodItemName = foodItem:getName();
				playerInv:Remove(foodItem);
				local vendorPrice = v[2];
				local foodValue = v[3];
				local subSubVendorOption = subSubMenu:addOption(foodItemName, worldobjects, Buy_VendorsItem, player, food, false, vendorPrice, false);
			end
		end
	end
	-- tools.  for to buy
	if vendorType == "Tool Vendor" then
		for i,v in pairs(venderTools) do
			local tool = v;
			local toolName = v[1];
			-- price is table of x,x,x,x, value is integer.  price is used to distribute denominations, value for displaying cost inside the menu and for comparing against the wallet
			local toolPrice = v[2];
			local toolValue = v[3];
			local toolItem = playerInv:AddItem(toolName);
			local toolItemType = toolItem:getType();
			local toolItemName = toolItem:getName();
			playerInv:Remove(toolItem);
			local subSubVendorOption = subSubMenu:addOption(toolItemName .. "($" .. toolValue .. ")", worldobjects, Buy_VendorsItem, player, tool, false, toolPrice, false);
		end
	end
	if vendorType == "Vehicle Vendor" then
		-- creating a menu item for engine parts, to be listed in the first vehicle submenu above the other submenu options
		local part = {"EngineParts", {20,0,0,0}, 20000};
		local partName = "EngineParts";
		local partPrice = {20,0,0,0};
		-- im not sure how to get the item name in order to avoid adding translations for everything unless i add it to your inventory.  so everything on the list, everything(minus what you're selling), is added and then removed from your inventory...  sorry, if anyone has a method to get the actual item object without having it in your inventory, i could use your help...
		local partItem = playerInv:AddItem(partName);
		local partItemType = partItem:getType();
		local partItemName = partItem:getName();
		playerInv:Remove(partItem);
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
					Vendors_DisplayAttachmentSlots(subSubMenu, subTable, context, playerInv);
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
function Buy_VendorsItem(worldobjects, player, item, sell, moneyQuantity, sellAll, quantity)
	local playerObj = player;
	local playerInv = playerObj:getInventory();
	local itemTable = item;
	local moneyInteger = itemTable[3];
	local moneyQuantity = itemTable[2];
	-- if were selling all the loot, then were searching through all the tables.  the tables of items that we're going to sell, not the ones filled with stuff we might buy.
	if sellAll then
		if #jewelry.tags > 0 then
			for i,v in pairs(jewelry.tags) do
				local jewelryItem = v[1]:getName();
				local moneyQuantity = v[2];
				for	i = 1, moneyQuantity[1] do
					playerInv:AddItem("Vendors.ThousandDollar");
				end
				for	i = 1, moneyQuantity[2] do
					playerInv:AddItem("Vendors.HundredDollar");
				end
				for	i = 1, moneyQuantity[3] do
					playerInv:AddItem("Vendors.TenDollar");
				end
				for	i = 1, moneyQuantity[4] do
					playerInv:AddItem("Vendors.OneDollar");
				end
				playerInv:Remove(jewelryItem);
			end
		end
		-- another bag of loot to sift through
		if #jewelry.stones > 0 then
			for i,v in pairs(jewelry.stones) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				for	i = 1, moneyQuantity[1] do
					playerInv:AddItem("Vendors.ThousandDollar");
				end
				for	i = 1, moneyQuantity[2] do
					playerInv:AddItem("Vendors.HundredDollar");
				end
				for	i = 1, moneyQuantity[3] do
					playerInv:AddItem("Vendors.TenDollar");
				end
				for	i = 1, moneyQuantity[4] do
					playerInv:AddItem("Vendors.OneDollar");
				end
				playerInv:Remove(jewelryItem);
			end
		end
		-- and another one gone, and another one gone
		if #jewelry.regular > 0 then
			for i,v in pairs(jewelry.regular) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				for	i = 1, moneyQuantity[1] do
					playerInv:AddItem("Vendors.ThousandDollar");
				end
				for	i = 1, moneyQuantity[2] do
					playerInv:AddItem("Vendors.HundredDollar");
				end
				for	i = 1, moneyQuantity[3] do
					playerInv:AddItem("Vendors.TenDollar");
				end
				for	i = 1, moneyQuantity[4] do
					playerInv:AddItem("Vendors.OneDollar");
				end
				playerInv:Remove(jewelryItem);
			end
		end
		-- last one for sell all!
		if #jewelry.green > 0 then
			for i,v in pairs(jewelry.green) do
				local jewelryItem = v[1];
				local moneyQuantity = v[2];
				if v[4] then
					local quantity = v[4];
					for h=1, quantity do
						playerInv:Remove(jewelryItem:getType());
					end
				else
					playerInv:Remove(jewelryItem);
				end
				for	i = 1, moneyQuantity[1] do
					playerInv:AddItem("Vendors.ThousandDollar");
				end
				for	i = 1, moneyQuantity[2] do
					playerInv:AddItem("Vendors.HundredDollar");
				end
				for	i = 1, moneyQuantity[3] do
					playerInv:AddItem("Vendors.TenDollar");
				end
				for	i = 1, moneyQuantity[4] do
					playerInv:AddItem("Vendors.OneDollar");
				end
			end
		end
	-- now to sell individual items
	elseif sell and not sellAll then
		local jewelryItem = item[1];
		if quantity then
			if quantity > 0 then
				jewelryItem = jewelryItem:getType();
				for j=1, quantity do
					playerInv:Remove(jewelryItem);
				end
			end
		else
			playerInv:Remove(jewelryItem);
		end
		-- give me that money!
		for	i = 1, moneyQuantity[1] do
			playerInv:AddItem("Vendors.ThousandDollar");
		end
		for	i = 1, moneyQuantity[2] do
			playerInv:AddItem("Vendors.HundredDollar");
		end
		for	i = 1, moneyQuantity[3] do
			playerInv:AddItem("Vendors.TenDollar");
		end
		for	i = 1, moneyQuantity[4] do
			playerInv:AddItem("Vendors.OneDollar");
		end
		playerObj:Say("SOLD!");
		-- not selling and not selling all, we're buying.  at this moment though its all free, i still need to fix how it removes the cash.  i was wrong, it's actually all broken at the moment, cant buy anything right now.   fixed part of it, you can now receive free items as long as you have enough to cover it, but it won't take your money.  i fixed that, it will now take your money but it will also give you more than 400x your change back.  progress...  that didn't take long,  giving correct change now.
	elseif not sell and not sellAll then
		if quantity and item[1] ~= "EngineParts" then moneyInteger = moneyInteger*quantity; end
		if vendMoney.total >= moneyInteger then
			if quantity then
				for i=1,quantity-1 do
					local addedItem = playerInv:AddItem(item[1]);
				end
			end
			local addedItem = playerInv:AddItem(item[1]);
			if string.find(addedItem:getName(), "Drum") or string.find(addedItem:getName(), "Magazine") then
				local maxAmmo = addedItem:getMaxAmmo();
				addedItem:setCurrentAmmoCount(maxAmmo);
			end
			if addedItem:isCookable() then addedItem:setCooked(true); end
			local vendCashToGive = vendMoney.total - moneyInteger;
			local vendCash = {}
			-- clean this up if you dont need floor  i do need floor
			vendCash[1] = {math.floor((vendCashToGive)/1000), "Vendors.ThousandDollar", true};
			vendCash[2] = {(math.floor((vendCashToGive)/100) - (math.floor(vendCashToGive/1000)*10)), "Vendors.HundredDollar"};
			vendCash[3] = {(math.floor((vendCashToGive)/10) - (math.floor(vendCashToGive/100)*10)), "Vendors.TenDollar"};
			vendCash[4] = {(math.floor((vendCashToGive)) - (math.floor(vendCashToGive/10)*10)), "Vendors.OneDollar"};
			for i,v in pairs(vendorWallet) do
				playerInv:Remove(v);
			end
			for i,v in pairs(vendCash) do
				for j=1, v[1] do
					playerInv:AddItem(v[2]);

				end
			end
		else
			playerObj:Say(getText("ContextMenu_Cant_Buy"));
		end
	end
end

function Vendors_DisplayAttachmentSlots(subSubMenu, subTable, context, playerInv)
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
		weapons[2] = {"Magazines", {"12gDrum", {1,7,5,0}, 1750, false, "12g"}, {"SPASClip", {0,3,0,0}, 0300, false, "12g"}, {"SIX12_Cylinder", {2,5,0,0}, 2500, false, "12g"}, {"22Drum", {1,7,5,0}, 1750, false, ".22-LR"}, {"22ExtClip", {0,3,0,0}, 0300, false, ".22-LR"}, {"22Clip", {0,3,0,0}, 0300, false, ".22-LR"}, {"223Clip", {0,3,0,0}, 0300, false, ".223-REM"}, {"223ExtClip", {0,3,0,0}, 0300, false, ".223"}, {"1903Clip", {0,3,0,0}, 0300, false, "30-06 SPRG"}, {"3006ExtClip", {0,3,0,0}, 0300, false, "30-06 SPRG"}, {"308Belt", {1,7,5,0}, 1750, false, ".308"}, {"308MiniCan", {0,3,0,0}, 0300, false, ".308"}, {"308StdClip", {0,3,0,0}, 0300, false, ".308"}, {"308ExtClip", {0,3,0,0}, 0300, false, ".308"}, {"357Speed", {0,3,0,0}, 0300, false, ".357-MAG"}, {"38Clip", {0,3,0,0}, 0300, false, ".38-SPC"}, {"38Speed", {0,3,0,0}, 0300, false, ".38-SPC"}, {"380ExtClip", {0,3,0,0}, 0300, false, ".380-ACP"}, {"380Clip", {0,3,0,0}, 0300, false, ".380-ACP"}, {"44Clip", {0,2,5,0}, 0250, false, ".44-MAG"}, {"44Speed", {0,3,0,0}, 0300, false, ".44-MAG"}, {"45Clip", {0,2,5,0}, 0250, false, ".45-ACP"}, {"45ExtClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45DSClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45DSExtClip", {0,3,0,0}, 0300, false, ".45-ACP"}, {"45LCSpeed", {0,3,0,0}, 0300, false, ".45-LC"}, {"50MiniCan", {0,3,0,0}, 0300, false, ".50 BMG"}, {"M82Clip", {0,3,5,0}, 0350, false, ".50 BMG"}, {"545Drum", {1,7,5,0}, 1750, false, "5.45"}, {"545StdClip", {0,3,0,0}, 0300, false, "5.45"}, {"556Belt", {1,7,5,0}, 1750, false, "5.56"}, {"556Drum", {1,7,5,0}, 1750, false, "5.56"}, {"556Clip", {0,3,5,0}, 0350, false, "5.56"}, {"556MiniCan", {0,3,5,0}, 0350, false, "5.56"}, {"57Clip", {0,3,5,0}, 0350, false, "5.7x28"}, {"P90Clip", {0,3,5,0}, 0350, false, "5.7x28"}, {"M14Clip", {0,3,0,0}, 0300, false, ".308"}, {"762x39Belt", {1,7,5,0}, 1750, false, "7.62x39"}, {"762Drum", {1,7,5,0}, 1750, false, "7.62x39"}, {"AKClip", {0,3,5,0}, 0350, false, "7.62x39"}, {"SKSClip", {0,3,5,0}, 0350, false, "7.62x39"}, {"762x54rBelt", {1,7,5,0}, 1750, false, "7.62x54"}, {"SVDClip", {0,3,5,0}, 0350, false, "7.62x54"}, {"MosinClip", {0,3,5,0}, 0350, false, "7.62x54"}, {"9mmClip", {0,3,0,0}, 0300, false, "9mm"}, {"9mmExtClip", {0,3,0,0}, 0300, false, "9mm"}, {"9mmDrum", {1,7,5,0}, 1750, false, "9mm"}, {"ASHClip", {0,3,0,0}, 0300, false, ".50 MAG"}};
		weapons[3] = {"Attachments", {"Sight_3xEOTech", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_4xACOG", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_Aimpoint_Dot", {0,3,5,0}, 0350, false, "Sight"}, {"Sight_Thermal", {0,3,5,0}, 0350, false, "Sight"}, {"Laser_PEQ15", {0,3,5,0}, 0350, false, "Side"}, {"Choke_Full", {0,2,0,0}, 0200, false, "Barrel"}, {"ChokeTubeImproved", {0,2,0,0}, 0200, false, "Barrel"}, {"FiberglassStock", {0,1,5,0}, 0150, false, "Stock"}, {"Sight_Malcom", {0,4,5,0}, 0450, false, "Sight"}, {"IronSight", {0,1,0,0}, 0100, false, "Sight"}, {"Laser", {0,2,0,0}, 0200, false, "Side"}, {"Sight_VX3", {0,4,5,0}, 0450, false, "Sight"}, {"RecoilPad", {0,1,0,0}, 0100, false, "Stock"}, {"Pad", {0,1,0,0}, 0100, false, "Stock"}, {"RedDot", {0,2,0,0}, 0200, false, "Sight"}, {"Sight_G28_Scope", {0,4,5,0}, 0450, false, "Sight"}, {"Sling_1", {0,1,5,0}, 0150, false, "Bottom"}, {"Sling_2", {0,1,5,0}, 0150, false, "Bottom"}, {"Sling_3", {0,1,5,0}, 0150, false, "Bottom"}, {"Launcher", {1,2,5,0}, 1250, false, "Bottom"}, {"Suppressor_BMG", {0,5,0,0}, 0500, false, "Barrel"}, {"Suppressor_ROME_BMG", {0,5,5,0}, 0550, false, "Barrel"}, {"Suppressor_Pistol", {0,4,0,0}, 0400, false, "Barrel"}, {"Suppressor_SOCOM_Pistol", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_Shotgun", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_Rifle", {0,4,5,0}, 0450, false, "Barrel"}, {"Suppressor_PBS1_Rifle", {0,5,5,0}, 0550, false, "Barrel"}, {"x2Scope", {0,3,0,0}, 0300, false, "Sight"}, {"x4Scope", {0,3,5,0}, 0350, false, "Sight"}, {"x8Scope", {0,4,0,0}, 0400, false, "Sight"}};
		weapons[4] = {"Caliber", "12g", ".22-LR", ".223-REM", "30-06 SPRG", ".308", ".357-MAG", ".38-SPC", ".380-ACP", ".44-MAG", ".45-ACP", ".45-LC", "5.45", "5.56", "5.7x28", ".50 MAG", ".50 BMG", "7.62x39", "7.62x54", "9mm"};
		weapons[5] = {"Pistols", {"Automag", {3,5,0,0}, 3500, false, ".44-MAG"}, {"B93R", {3,0,0,0}, 3000, false, "9mm"}, {"M9", {3,0,0,0}, 3000, false, "9mm"}, {"M9A3", {3,0,0,0}, 3000, false, "9mm"}, {"CZ75", {3,0,0,0}, 3000, false, "9mm"}, {"G17", {3,0,0,0}, 3000, false, "9mm"}, {"G18", {3,0,0,0}, 3000, false, "9mm"}, {"G21", {3,0,0,0}, 3000, false, ".45-ACP"}, {"G42", {3,0,0,0}, 3000, false, ".380-ACP"}, {"Pistol3", {3,0,0,0}, 3000, false, ".44-MAG"}, {"Pistol2", {3,0,0,0}, 3000, false, ".45 Auto"}, {"Revolver_Long", {2,0,0,0}, 2000, false, ".44-MAG"}, {"Revolver", {2,0,0,0}, 2000, false, ".45 Auto"}, {"Revolver_Short", {1,5,0,0}, 1500, false, ".38-SPC"}, {"M4506", {3,0,0,0}, 3000, false, ".45-ACP"}, {"M5238", {3,0,0,0}, 3000, false, ".38-SPC"}, {"M5906", {3,0,0,0}, 3000, false, "9mm"}, {"Pistol", {2,5,0,0}, 2500, false, "9mm"}};
		weapons[6] = {"Shotguns", {"DAO12", {2,5,0,0}, 2500, false, "12g"}, {"AA12", {4,5,0,0}, 4500, false, "12g"}, {"DT11", {2,5,0,0}, 2500, false, "12g"}, {"CAWS", {4,5,0,0}, 4500, false, "12g"}, {"DoubleBarrelShotgun", {0,7,5,0}, 750, false, "12g"}, {"Shotgun", {2,5,0,0}, 2500, false, "12g"}, {"SIX12SD", {6,5,0,0}, 6500, false, "12g"}};
		weapons[7] = {"Rifles", {"AK103", {7,5,0,0}, 7500, false, "7.62x39"}, {"AK12_New", {7,5,0,0}, 7500, false, "5.45"}, {"AK47", {7,5,0,0}, 7500, false, "7.62x39"}, {"AK74", {7,5,0,0}, 7500, false, "5.45"}, {"AKM", {7,5,0,0}, 7500, false, "7.62x39"}, {"M4A1", {8,5,0,0}, 8500, false, "5.56"}, {"DR_200", {7,5,0,0}, 7500, false, "5.56"}, {"K2_1", {7,5,0,0}, 7500, false, "5.56"}, {"SVDK", {10,0,0,0}, 10000, false, "7.62x54"}, {"EDM96", {12,0,0,0}, 12000, false, ".50 BMG"}, {"Gepard_M6", {12,0,0,0}, 12000, false, ".50 BMG"}, {"G11K3", {7,5,0,0}, 7500, false, "5.7x28"}, {"G36KV", {7,5,0,0}, 7500, false, "5.56"}, {"HuntingRifle", {4,5,0,0}, 4500, false, ".308"}, {"AssaultRifle2", {7,5,0,0}, 7500, false, ".308"}, {"AssaultRifle", {10,0,0,0}, 10000, false, "5.56"}, {"M40A1", {7,5,0,0}, 7500, false, ".308"}, {"M40A3", {7,5,0,0}, 7500, false, ".308"}, {"VarmintRifle", {3,5,0,0}, 3500, false, ".223-REM"}};
		weapons[9] = {"SMGs", {"CAR15SMG", {6,0,0,0}, 6000, false, "5.56"}, {"K1_1", {6,0,0,0}, 6000, false, "5.56"}, {"K7_Stock", {6,0,0,0}, 6000, false, "9mm"}};
		weapons[10] = {"LMGs", {"K3LMG"{12,0,0,0}, 12000, false, "5.56"}, {"G21LMG", {12,0,0,0}, 12000, false, ".308"}, {"XM8LMG", {12,0,0,0}, 12000, false, "5.56"}, {"M249", {12,0,0,0}, 12000, false, "5.56"}, {"K12", {12,0,0,0}, 12000, false, ".308"}};
	end
end

Events.OnFillWorldObjectContextMenu.Add(VendISWorldObjectContextMenu.createMenu);
Events.OnLoad.Add(Vendors_CheckMods);