if not VendISWorldObjectContextMenu then VendISWorldObjectContextMenu = {}; end

local britaMod = getActivatedMods():contains("Brita");
local brita_2Mod = getActivatedMods():contains("Brita_2");
local GreenFireMod = getActivatedMods():contains("jiggasGreenfireMod");

local vendMoney = 0;
local jewelry = {};
local tools = {};
local vehicles = {};
vehicles.parts = {}
vehicles.vehicles = {};
local weapons = {};
weapons.ammo = {};
weapons.magazines = {};
weapons.attachments = {};
weapons.pistols = {};
weapons.smg = {};
weapons.rifle = {}
weapons.lmg = {};
jewelry[0] = {};
jewelry[1] = {};
jewelry.stones = {};
jewelry.regular = {};
jewelry.tags = {};
local vendorsFoods = {};
vendorsFoods[1] = {"farming.BaconBits", "farming.BaconRashers", "Crisps", "Chocolate", "EggBoiled", "EggPoached", "FriedOnionRingsCraft", "DehydratedMeatStick", "NoodleSoup"};
vendorsFoods[2] = {"BeanBowl", "CerealBowl", "PastaBowl", "RiceBowl", "SoupBowl", "StewBowl", "Oatmeal", "SushiFish"};
vendorsFoods[3] = {};


function VendISWorldObjectContextMenu.createMenu(player, context, worldobjects, test)
	-- reset values for inventory search.
	vendMoney = 0;
	local fanleaf = 0;
	jewelry.stones = {};
	jewelry.regular = {};
	jewelry.tags = {};
	jewelry.green = {};
	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then return; end
	local worldObj = worldobjects;
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj);
	local vendorList = nil;
	local dispType = nil;
	britaMod = getActivatedMods():contains("Brita");


	-- looking for vendors in area to determine if the context menu is needed
	for i=1,containers:size() do
		local container = containers:get(i-1);
		for j=1,container:getItems():size() do
			local item = container:getItems():get(j-1);
			if not playerObj:isEquipped(item) then
				local disCat = item:getDisplayCategory();
				if item:getType() then
					dispType = item:getType();
					dispName = item:getName();
				end
				if dispType == "Money" then
					vendMoney = vendMoney + 1;
				elseif disCat == "Vendors" then
					if not vendorList then vendorList = {}; vendorList.vendors = {}; end
					if vendorList[dispType] then 
					else
						vendorList[dispType] = item;
						table.insert(vendorList.vendors, dispName);
					end
				elseif string.find(dispType, "Diamond") or string.find(dispType, "Emerald") or string.find(dispType, "Amethyst") or string.find(dispType, "Ruby") or string.find(dispType, "Sapphire") then
					table.insert(jewelry.stones, {item, {0,0,0,2}})
				elseif (not string.find(dispType, "Key") and item:getDisplayCategory() == "Accessory" and ((string.find(dispType, "Ring") or string.find(dispType, "ring"))) or string.find(dispType, "necklace") or string.find(dispType, "Locket") or string.find(dispType, "Watch")) then
					table.insert(jewelry.regular, {item, {0,0,0,1}});
				elseif string.find(dispType, "DogTag") then
					table.insert(jewelry.tags, {item, {0,0,5,0}});
				-- looking for GreenFireMod products
				elseif GreenFireMod then
					if disCat == "GreenFireItem" then
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
end	
	-- display sub context menus
function Vendors_subContextMenu(subContext, vendorList, vendorSubMenu, context, player)
	for i,v in pairs(vendorList.vendors) do
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
	-- searching for vendor type to display correct context menus
	if vendorType == "ATM Machine" then
		-- looking for jewelry items that were found during the inventory search in the initial function
		if #jewelry.tags == 0 and #jewelry.stones == 0 and #jewelry.regular == 0 and #jewelry.green == 0 then
			local subSubVendorOption = subSubMenu:addOptionOnTop(getText("ContextMenu_Nothing_To_Sell"), worldobjects);
		else
			local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_Sell_All"), worldobjects, Buy_VendorsItem, player, jewelry, true, 0, true);
			if #jewelry.tags > 0 then
				local jewelryItem = jewelry.tags[1]:getName();
				local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($50)", worldobjects, Buy_VendorsItem, player, jewelry.tags[1], true, {0,0,5,0});
			end
			if #jewelry.stones > 0 then
				for i,v in pairs(jewelry.stones) do
					local jewelryItem = v[1]:getName();
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($2)", worldobjects, Buy_VendorsItem, player, v, true, {0,0,0,2});
				end
			end
			if #jewelry.regular > 0 then
				for i,v in pairs(jewelry.regular) do
					local jewelryItem = v[1]:getName();
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($1)", worldobjects, Buy_VendorsItem, player, v, true, {0,0,0,1});
				end
			end
			if #jewelry.green > 0 then
				for i,v in pairs(jewelry.green) do
					local jewelryItem = v[1]:getName();
					local vendorValue = v[2];
					local vendorPrice = v[3];
					if v[4] then 
						quantity = v[4]; 
						vendorPrice = vendorPrice .. " per " .. quantity;
					end
					local subSubVendorOption = subSubMenu:addOption(getText(jewelryItem) .. "($" .. vendorPrice .. ")", worldobjects, Buy_VendorsItem, player, v[1], true, vendorValue, false, quantity);
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
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF") .. " - $" .. vendMoney, worldobjects);
			else
				for i,v in pairs(vendorsFoods[1]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, {0,0,1,0}, false);
				end
			end
		end
		if #vendorsFoods[2] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_40_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			if vendMoney < 40 then
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF") .. " - $" .. vendMoney, worldobjects);
			else
				for i,v in pairs(vendorsFoods[2]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, {0,0,4,0}, false);
				end
			end
		end
		if #vendorsFoods[3] > 0 then
			local subVendorOption = subSubMenu:addOption(getText("ContextMenu_Food_For_100_Dollars"), worldobjects)
			local subSubMenu = ISContextMenu:getNew(subSubMenu);
			local subContext = context:addSubMenu(subVendorOption, subSubMenu);
			if vendMoney < 100 then
				local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_NSF") .. " - $" .. vendMoney, worldobjects);
			else
				for i,v in pairs(vendorsFoods[3]) do
					local foodItem = v;
					local subSubVendorOption = subSubMenu:addOption(getText("ContextMenu_" .. foodItem), worldobjects, Buy_VendorsItem, player, foodItem, false, {0,1,0,0}, false);
				end
			end
		end
	end
end

function Buy_VendorsItem(worldobjects, player, item, sell, moneyQuantity, sellAll, quantity)
	local playerObj = player;
	local playerInv = playerObj:getInventory();
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
	elseif sell and not sellAll then
		local jewelryItem = item[1];
		if quantity then
			if quantity > 0 then
				jewelryItem = jewelryItem:getType();
				print("okay");
				for j=1, quantity do
					playerInv:Remove(jewelryItem);
				end
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
		playerObj:Say("SOLD!");
	elseif not sell and not sellAll then
		playerInv:AddItem(item);
		for i=1, moneyQuantity[1] do
			playerInv:Remove("Vendors.ThousandDollar");
		end
		for i=1, moneyQuantity[2] do
			playerInv:Remove("Vendors.HundredDollar");
		end
		for i=1, moneyQuantity[3] do
			playerInv:Remove("Vendors.TenDollar");
		end
		for i=1, moneyQuantity[4] do
			playerInv:Remove("Vendors.OneDollar");
		end
	end
end

function Vendors_CheckMods()
	britaMod = getActivatedMods():contains("Brita");
	brita_2Mod = getActivatedMods():contains("Brita_2");
	GreenFireMod = getActivatedMods():contains("jiggasGreenfireMod");
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
Events.OnLoad.Add(Vendors_CheckMods);