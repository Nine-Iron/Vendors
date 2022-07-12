if not Vendors then
	Vendors = {};
	Vendors.Commands = {};
	Vendors.Vehicle = {};
	Vendors.id = {};
end

function Vendors_AddVehicle(vehicle, playerObj)
	local square = playerObj:getSquare();
	local x = square:getX() - 1;
	local y = square:getY();
	local z = square:getZ();
	direction = IsoDirections.S;
	return addVehicleDebug(vehicle, direction, nil, getCell():getGridSquare(x, y, z));
end

function Vendors.Vehicle:addVehicle(fullId, playerObj, direction)
	if playerObj
	then
		--if direction ~= false
		--then
			--direction = direction or playerObj:getDir();
			--direction = direction or IsoDirections.N;
		--else
			local square = playerObj:getSquare();
			local x = square:getX() - 1;
			local y = square:getY();
			local z = square:getZ();
			direction = IsoDirections.S;
		--end
		local vehicle = addVehicleDebug(fullId, direction, nil, getCell():getGridSquare(x, y, z));
		vehicle:repair();
		return vehicle;
	end
end