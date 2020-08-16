function objPathToString(obj)-- game.Workspace => "game/Workspace"
	local split="/";
	local pathTable={};
	local foundGame=false;
	local pathDoesntExist=false;
	while (not foundGame and not pathDoesntExist)do
		if obj==nil then
			pathDoesntExist=true;-- if you change an objects parent to nil but the object is still the dir.
			break;
		else
			table.insert(pathTable,obj.Name);--
			if obj==game then
				foundGame=true;
			else
				obj=obj.Parent;
			end
		end
	end
	local pathAsString='';
	for a,g in pairs(pathTable)do
		pathAsString=g..split..pathAsString;
	end
	return pathAsString:sub(0,string.len(pathAsString)-1);--remove final slash
end--objPathToStr(Instance):String

function stringToPath(str)
	local path=dir;
	local split=string.split(str,"/");
	for a,g in pairs(split)do
		if (a==1 and g=="game") then
			path=game;
		else
			if (g=="..") then
				path=path.Parent;
			else
				if (path:FindFirstChild(g)~=nil)then
					path=path:FindFirstChild(g);
				end
			end
		end
	end
	return path
end--stringToPath(String):Instance
