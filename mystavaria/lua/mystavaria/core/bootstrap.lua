-- Author: Atlan
-- Description: startup.
CurrentGlobalSound = 1
CurrentAmbienceSound = 2
CurrentCombatMusic = 3
CurrentMusicSound = 4
Workspace = string.gsub(GetInfo(66), "\\", "/")
SoundFolder = string.gsub(GetInfo(74), "\\", "/")
PPI = require("ppi")
Audio = PPI.Load("aedf0cb0be5bf045860d54b7")
if not Audio then  error("Dependency plugin not installed!")
end

version = io.open(Workspace.."version.info","r"):read("*a")
SetVariable("version", version)
function getAudio() return Audio end