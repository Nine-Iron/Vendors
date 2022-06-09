if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end

local britaMod = getActivatedMods():contains("Brita");
local brita_2Mod = getActivatedMods():contains("Brita_2");
local GreenFireMod = getActivatedMods():contains("jiggasGreenfireMod");
local vendMoney = 0;
local jewelry = {};
jewelry[0] = {};
jewelry[1] = {};
jewelry.stones = {};
jewelry.regular = {};
jewelry.tags = {};
local vendorsFoods = {};
vendorsFoods[1] = {"farming.BaconBits", "farming.BaconRashers", "Crisps", "Chocolate", "EggBoiled", "EggPoached", "FriedOnionRingsCraft", "DehydratedMeatStick", "NoodleSoup"};
vendorsFoods[2] = {"BeanBowl", "CerealBowl", "PastaBowl", "RiceBowl", "SoupBowl", "StewBowl", "Oatmeal", "SushiFish"}
vendorsFoods[3] = {};
vendorFoods["Green"] = {};
jewelry["Green"] = {"OzCannabis", "DryCannabisFanLeaf", "KgCannabis", "curedDelCannaCigar"};

function VendISWorldObjectContextMenu.createMenu(player, context, worldobjects, test)
	britaMod = getActivatedMods():contains("Brita");
	brita_2Mod = getActivatedMods():contains("Brita_2");
	GreenFireMod = getActivatedMods():contains("jiggasGreenFireMod");
	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then return; end
	local worldObj = worldobjects;
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj);
	local vendorList = nil;
	local dispName = nil;
	britaMod = getActivatedMods():contains("Brita");


	-- looking for vendors in area to determine if the context menu is needed
	for i=1,containers:size() do
		local y = 0;
		local container = containers:get(i-1);
		for j=1,container:getItems():size() do
			local item = container:getItems():get(j-1);
			local disCat = item:getDisplayCategory();
			if item:getType() then
				dispName = item:getType();
			end
			if disCat == "Vendors" then
				if not vendorList then vendorList = {}; end
				if vendorList[dispName] then 
				else
					vendorList[dispName] = item;
				end
			end
			if dispName == "Money" then
				vendMoney = vendMoney + 1;
			end
			if string.find(dispName, "Diamond") or string.find(dispName, "Emerald") or string.find(dispName, "Amethyst") or string.find(dispName, "Ruby") or string.find(dispName, "Sapphire") then
				table.insert(jewelry.stones, item)
			elseif (not string.find(dispName, "Key") and item:getDisplayCategory() == "Clothing" and (string.find(dispName, "Ring") or string.find(dispName, "ring"))) or string.find(dispName, "necklace") or string.find(dispName, "Locket") or string.find(dispName, "Watch") then
				table.insert(jewelry.regular, item);
			elseif string.find(dispName, "Dog Tag") then
				table.insert(jewelry.tags, item);
			-- looking for GreenFireMod products
			elseif GreenFireMod then
				if item:getDisplayCategory() == "GreenFireItem" then
					--table.insert(jewelry["Green"], item);
					print(dispName);
				end
			end
		end	
	end
	-- if there are vendors in the area then we call the function to display the menu
	if vendorList then
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
end	
	-- display sub context menus
function Vendors_subContextMenu(subContext, vendorList, vendorSubMenu, context, player)
	for i,v in pairs(vendorList) do
		local vendorType = v:getName();
		local subVendorOption = {};
		subVendorOption = vendorSubMenu:addOption(getText("ContextMenu_" .. vendorType), worldObj);
		local subSubMenu = ISContextMenu:getNew(vendorSubMenu);
		local subSubContext = context:addSubMenu(subVendorOption, subSubMenu);
		Vendors_subSubContextMenu(subSubContext, vendorList, subSubMenu, context, player, vendorType, worldobjects)
	end
end
	-- display subsub and subsubsub context menus
function Vendors_subSubContextMenu(subSubContext, vendorList, subSubMenu, context, player, vendorType, worldobjects)
	-- searching for vendor type to display correct context menus
	if vendorType == "ATM Machine" then
		-- looking for jewelry items that were found during the inventory search in the initial function
		if #jewelry.tags == 0 and #jewelry.stones == 0 and #jewelry.regular == 0 then
			local subSubVendorOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Nothing_To_Sell"), worldobjects);
		else
			local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_Sell_All_Jewelry"), worldobjects, Buy_VendorsItem, player, jewelry, true, 0, true);
			if #jewelry.tags > 0 then
				local jewelryItem = jewelry.tags[1]:getName();
				local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($5)", worldobjects, Buy_VendorsItem, player, jewelry.tags[1], true, 5);
			end
			if #jewelry.stones > 0 then
				for i,v in pairs(jewelry.stones) do
					local jewelryItem = v:getName();
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($2)", worldobjects, Buy_VendorsItem, player, v, true, 2);
				end
			end
			if #jewelry.regular > 0 then
				print(#jewelry.regular, " - jewel");
				for i,v in pairs(jewelry.regular) do
					local jewelryItem = v:getName();
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($1)", worldobjects, Buy_VendorsItem, player, v, true, 1);
				end
			end
		end
	end
	-- food seach
	if vendorType == "Food Vendor" then
		if #vendorsFoods[1] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_10_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			-- checking to make sure you have enough money to purchase the items in this menu
			if vendMoney < 10 then
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF"), worldobjects);
			else
				for i,v in pairs(vendorsFoods[1]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, 10, false);
				end
			end
		end
		if #vendorsFoods[2] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_40_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			if vendMoney < 40 then
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF"), worldobjects);
			else
				for i,v in pairs(vendorsFoods[2]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, 40, false);
				end
			end
		end
		if #vendorsFoods[3] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_100_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			if vendMoney < 100 then
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF"), worldobjects);
			else
				for i,v in pairs(vendorsFoods[3]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, 100, false);
				end
			end
		end
	end
	-- reset values for next inventory search.
	vendMoney = 0;
	jewelry.stones = {};
	jewelry.regular = {};
	jewelry.tags = {};
	if GreenFireMod then
		jewelry["Green"].inventory = {};
	end
end

function Buy_VendorsItem(worldobjects, player, item, sell, moneyQuantity, sellAll)
	local playerObj = player;
	local playerInv = playerObj:getInventory();
	if sellAll then
		if #jewelry.tags > 0 then
			for i,v in pairs(jewelry.tags) do
				local jewelryItem = v;
				for i=1, 25 do
					playerInv:AddItem("Money");
				end
				playerInv:Remove(jewelryItem);
			end
		end
		if #jewelry.stones > 0 then
			for i,v in pairs(jewelry.stones) do
				local jewelryItem = v;
				for i=1, 10 do
					playerInv:AddItem("Money");
				end
				playerInv:Remove(jewelryItem);
			end
		end
		if #jewelry.regular > 0 then
			for i,v in pairs(jewelry.regular) do
				local jewelryItem = v;
				for i=1, 5 do
					playerInv:AddItem("Money");
				end
				playerInv:Remove(jewelryItem);
			end
		end
	elseif sell and not sellAll then
		for	i = 1, moneyQuantity do
			playerInv:AddItem("Money");
		end
		playerInv:Remove(item);
		playerObj:Say("SOLD!");
	elseif not sell and not sellAll then
		playerInv:AddItem(item);
		for i=1, moneyQuantity do
			playerInv:Remove("Money");
		end
	end
end


	
    --local vendorOption = context:addOption("ATM options", worldObj);
	--local vendorSubMenu = ISContextMenu:getNew(context);
    --context:addSubMenu(vendorOption, vendorSubMenu);
	--local moneyOption = vendorSubMenu:addOption("ATM machine", worldObj);
	--local weaponOption = vendorSubMenu:addOption("Food vendor", worldObj);
	--local weaponOption = vendorSubMenu:addOption("Tool vendor", worldObj);
	--local weaponOption = vendorSubMenu:addOption("Vehicle vendor", worldObj);
	--local weaponOption = vendorSubMenu:addOption("Weapon vendor", worldObj);

Events.OnFillWorldObjectContextMenu.Add(VendISWorldObjectContextMenu.createMenu);