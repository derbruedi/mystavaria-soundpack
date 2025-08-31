-- Author; Atlan
-- Description: some helper functions to run the soundpack.
module("mystavaria.util",package.seeall)
function GetPluginId(name)
  local ret=nil
  if GetPluginList() then
    for _, id in pairs (GetPluginList()) do 
      if GetPluginInfo(id, 1) == name then
        ret = id
      end
    end
  end
  return ret
end

