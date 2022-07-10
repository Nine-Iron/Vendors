--function Vendors_ItemCategories()
	--local item = ScriptManager.instance:getItem("Base.Money")
--if item then 
    --item:DoParam("DisplayCategory = Money")
--end
--end
function Vendors_RemoveServerItem(item, inventory)
	local container = inventory;
	container:DoRemoveItem(item);
	container:Remove(item);
end

function Vendors_AddItem(item, inventory)
	local magazine = nil;
	local maxAmmo = nil;
	local container = inventory;
	local addedItem = container:AddItem(item);
	maxAmmo = addedItem:getMaxAmmo();
	if addedItem:getDisplayCategory() == "Weapon" and addedItem:getMagazineType() ~= nil then
		addedItem:setRoundChambered(true);
	elseif addedItem:getDisplayCategory() == "Weapon" and addedItem:getMagazineType() == nil then
		addedItem:setCurrentAmmoCount(1);
	elseif maxAmmo > 0 then
		addedItem:setCurrentAmmoCount(maxAmmo);
	elseif addedItem:isCookable() and not string.find(addedItem:getType(), "Dead") then 
		addedItem:setCooked(true); 
	end
end

function Vendors_AddVehicle(vehicle, playerObj)
	if isClient() then
		local command = string.format("/addvehicle %s", tostring(vehicle))
		SendCommandToServer(command)
	else
		addVehicle(tostring(vehicle))
	end
end

function Vendors_GetKeys()
	local playerObj = getSpecificPlayer(0)
	local car = playerObj:getNearVehicle();
	if car ~= nil then
		sendClientCommand(playerObj, "vehicle", "getKey", {vehicle = car:getId()});
		sendClientCommand(playerObj, "vehicle", "repair", {vehicle = car:getId()});
	end
end