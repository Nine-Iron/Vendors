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
	elseif maxAmmo > 0 and addedItem:getMagazineType() ~= nil then
		addedItem:setCurrentAmmoCount(maxAmmo);
	elseif addedItem:isCookable() and not string.find(addedItem:getType(), "Dead") then 
		addedItem:setCooked(true); 
	end
end