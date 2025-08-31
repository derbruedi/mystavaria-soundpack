local Ini = require("ini")
local Path = require("pl.path")

ConfigTable = {}
ConfigTable.Settings = {}
ConfigTable.Settings.ScreenReader = "MushReader"
ConfigTable.Settings.Accents = 1
ConfigTable.Settings.VolumeType = 1
ConfigTable.Settings.SoundVolume = 20
ConfigTable.Settings.AmbienceVolume = 15
ConfigTable.Settings.CombatVolume = 15
ConfigTable.Settings.MusicVolume = 15
ConfigTable.Settings.GlobalSounds = 1
ConfigTable.Settings.AmbienceSounds = 1
ConfigTable.Settings.CombatMusic = 1
ConfigTable.Settings.MusicSound = 1
ConfigTable.Settings.Numpad = 1
function ToggleVolumeType()
  if (ConfigTable.Settings.VolumeType == 1) then
    ConfigTable.Settings.VolumeType = 2
    Execute("tts_interrupt Volume control for Ambience sounds.")
  elseif (ConfigTable.Settings.VolumeType == 2) then
    ConfigTable.Settings.VolumeType = 3
    Execute("tts_interrupt Volume control for combat Music.")
  elseif (ConfigTable.Settings.VolumeType == 3) then
    ConfigTable.Settings.VolumeType = 4
    Execute("tts_interrupt Volume control for Music sounds.")
  else
    ConfigTable.Settings.VolumeType = 1
    Execute("tts_interrupt Volume control for global sounds.")
  end
  CurrentGlobalSound = PlayGlobalSound("Misc/Switch.ogg")
  SaveConfig();
end

function ToggleGlobalSounds()
  if (ConfigTable.Settings.GlobalSounds == 1) then
    ConfigTable.Settings.GlobalSounds = 0
    StopSound(CurrentGlobalSound)
    Execute("tts_interrupt Global sounds disabled.")
  elseif (ConfigTable.Settings.GlobalSounds == 0) then
    ConfigTable.Settings.GlobalSounds = 1
    Execute("tts_interrupt Global sounds enabled.")
  end
  CurrentGlobalSound = PlayGlobalSound("Misc/Switch.ogg")
end

function ToggleAmbienceSounds()
  if (ConfigTable.Settings.AmbienceSounds == 1) then
    ConfigTable.Settings.AmbienceSounds = 0
    StopSound(CurrentAmbienceSound)
    Execute("tts_interrupt Ambience sounds disabled.")
  elseif (ConfigTable.Settings.AmbienceSounds == 0) then
    ConfigTable.Settings.AmbienceSounds = 1
    Execute("tts_interrupt Ambience sounds enabled.")
  end
  CurrentGlobalSound = PlayGlobalSound("Misc/Switch.ogg")
end

function ToggleCombatMusic()
  if (ConfigTable.Settings.CombatMusic == 1) then
    ConfigTable.Settings.CombatMusic = 0
    StopSound(CurrentCombatSound)
    Execute("tts_interrupt Combat Music disabled.")
  elseif (ConfigTable.Settings.CombatMusic == 0) then
    ConfigTable.Settings.CombatMusic = 1
    Execute("tts_interrupt Combat Music enabled.")
  end
  CurrentGlobalSound = PlayGlobalSound("Misc/Switch.ogg")
end

function ToggleMusicSound()
  if (ConfigTable.Settings.MusicSound == 1) then
    ConfigTable.Settings.MusicSound = 0
    StopSound(CurrentMusicSound)
    Execute("tts_interrupt Music disabled.")
  elseif (ConfigTable.Settings.MusicSound == 0) then
    ConfigTable.Settings.MusicSound = 1
    Execute("tts_interrupt Music enabled.")
  end
  CurrentGlobalSound = PlayGlobalSound("Misc/Switch.ogg")
end

function NumpadSwitch()
  if (ConfigTable.Settings.Numpad == 1) then
    ConfigTable.Settings.Numpad = 2
    Execute("tts_interrupt Numpad switched to swimming.")
  elseif (ConfigTable.Settings.Numpad == 2) then
    ConfigTable.Settings.Numpad = 1
    Execute("tts_interrupt Numpad switched to walking.")
  end
  CurrentGlobalSound = PlayGlobalSound("General/Misc/Switch.ogg")
  NumpadInit()
  SaveConfig()
end

function LoadConfig()
  if (Path.exists(Workspace.."Config.txt")) then
    ConfigTable = Ini.read("Config.txt")
    if ConfigTable then
      for name, section in pairs(ConfigTable) do
        for option_name, option_value in pairs(section) do
          config = tonumber(option_value)
          if config == nil then
            config = option_value
          end
          if ConfigTable[name] == nil then
            ConfigTable[name] = {}
          end
          ConfigTable[name][option_name] = config
        end
      end
    end
  end
  NumpadInit()
end

function SaveConfig()
  if (Path.exists(Workspace.."Config.txt")) then
    Ini.write("Config.txt", ConfigTable)
  else
    f = io.open(prometheus.core.bootstrap.Workspace.."Config.txt", "w")
    Ini.write("Config.txt", ConfigTable)
    f:close()
  end
end

function ReloadSoundpack()
  StopSound(CurrentGlobalSound)
  StopSound(CurrentAmbienceSound)
  StopSound(CurrentCombatMusic)
  StopSound(CurrentMusicSound)
  Note("Soundpack reloaded.")
  ReloadPlugin("5279d60de184ab1656e0d276")
end
