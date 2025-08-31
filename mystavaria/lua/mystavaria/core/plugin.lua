local Path = require("pl.path")

function OnPluginConnect()
  LoadConfig()
  if (ConfigTable.Settings.GlobalSounds == 1) then 
    CurrentGlobalSound = PlayGlobalSound("music/connect/"..math.random(1, 5)..".ogg")
  end
  Note("Soundpack Version "..GetVariable("version")..".")
end

function OnPluginDisconnect()
  StopSound(CurrentGlobalSound)
  StopSound(CurrentBattleMusic)
  StopSound(CurrentAmbienceSound)
  StopSound(CurrentMusicSound)
  CurrentGlobalSound = PlayGlobalSound("Misc/logout.mp3")
  SaveConfig()
end

function OnPluginInstall()
  if Path.exists("Config.txt") then
    LoadConfig()
  else
    utils.msgbox("The Mush soundpack version "..GetVariable("version").." for mystavaria is now ready. Thanks for using!", "Congratulations", "ok", "!", 1)
    SaveConfig()
  end
end

function OnPluginClose() SaveConfig() end