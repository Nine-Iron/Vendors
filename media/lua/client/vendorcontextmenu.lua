if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end

local filibuster = nil;


local vendMoney = {};
vendMoney.total = 0;
local moneyContainer = nil;

local vendorsSaleTotal = 0;


local vendorWallet = {};

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
	if vendorType == "ATM Machine" then
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
	if vendorType == "Food Vendor" then
		Vendors_DisplayFoodOptions(subSubMenu, context, player, vendorsFoods);		
	end
	-- tools.  for to buy
	if vendorType == "Tool Vendor" then
		Vendors_DisplayToolOptions(subSubMenu, context, player, vendorsTools)
	end
	if vendorType == "Vehicle Vendor" then
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
	if vendorType == "Weapon Vendor" then
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
		v[2]:removeItemOnServer(v[1]);
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
				local toolItemQuantity = toolItemTable[4];
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
		if v[5] then 
			quantity = v[5]; 
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

Events.OnFillWorldObjectContextMenu.Add(VendISWorldObjectContextMenu.createMenu);