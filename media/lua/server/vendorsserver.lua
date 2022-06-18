--function Vendors_ItemCategories()
	--local item = ScriptManager.instance:getItem("Base.Money")
--if item then 
    --item:DoParam("DisplayCategory = Money")
--end
--end
function Vendors_RemoveItem(item, inventory)
	local container = inventory;
	container:DoRemoveItem(item);
	container:removeItemOnServer(item);
end

function Vendors_AddItem(item, inventory)
	local container = inventory;
	container:AddItem(item);
end


--IGUI_EN = {
  --  IGUI_ItemCat_Money = "Money",
--}