local Path = require("pl.path")

-- Sound-Handles für jede Kategorie
CurrentGlobalSound = nil
CurrentAmbienceSound = nil
CurrentCombatMusic = nil
CurrentMusicSound = nil

function PlayGlobalSound(file, pan)
  if (ConfigTable.Settings.GlobalSounds == 1) then
    pan = pan or 0
    if not Path.isabs(file) then
      file = SoundFolder .. file
    end
    CurrentGlobalSound = Audio.play(file, 0, pan, ConfigTable.Settings.SoundVolume)
    return CurrentGlobalSound
  end
end

function PlayAmbienceSound(file)
  if (ConfigTable.Settings.AmbienceSounds == 1) then
    if not Path.isabs(file) then
      file = SoundFolder .. "ambience/" .. file
    end
    CurrentAmbienceSound = Audio.play(file, 1, 0, ConfigTable.Settings.AmbienceVolume)
    return CurrentAmbienceSound
  end
end

function PlayCombatMusic(file, pan)
  if (ConfigTable.Settings.CombatMusic == 1) then
    if not Path.isabs(file) then
      file = SoundFolder .. "Combatmusic/" .. file
    end
    CurrentCombatMusic = Audio.play(file, 1, 0, ConfigTable.Settings.CombatMusicVolume)
    return CurrentCombatMusic
  end
end

function PlayMusicSound(file)
  if (ConfigTable.Settings.MusicSound == 1) then
    if not Path.isabs(file) then
      file = SoundFolder .. "music/" .. file
    end
    CurrentMusicSound = Audio.play(file, 1, 0, ConfigTable.Settings.MusicVolume)
    return CurrentMusicSound
  end
end

function StopSound(id)
  if ((tonumber(id) ~= nil) and (Audio.isPlaying(id) == 1)) then
    return Audio.stop(id)
  end
end

function SetVolume(CurrentVolume)
  if (ConfigTable.Settings.VolumeType == 1) then
    -- Global Volume
    if (ConfigTable.Settings.GlobalSounds == 1) then
      local newVol = ConfigTable.Settings.SoundVolume + CurrentVolume
      if newVol > 100 or newVol < 1 then
        PlayGlobalSound("Misc/Error.ogg")
        Execute("tts_interrupt Global sound volume must be between 1 and 100.")
        return
      end
      ConfigTable.Settings.SoundVolume = newVol
      PlayGlobalSound("Misc/Switch.ogg")
      Execute("tts_interrupt Global Sound Volume: " .. tostring(newVol) .. " percent.")
      if CurrentGlobalSound and Audio.isPlaying(CurrentGlobalSound) == 1 then
        return Audio.setVol(newVol, CurrentGlobalSound)
      end
    else
      Execute("tts_interrupt Global sounds currently disabled.")
    end

  elseif (ConfigTable.Settings.VolumeType == 2) then
    -- Ambience Volume
    if (ConfigTable.Settings.AmbienceSounds == 1) then
      local newVol = ConfigTable.Settings.AmbienceVolume + CurrentVolume
      if newVol > 100 or newVol < 1 then
        PlayGlobalSound("Misc/Error.ogg")
        Execute("tts_interrupt Ambience volume must be between 1 and 100.")
        return
      end
      ConfigTable.Settings.AmbienceVolume = newVol
      PlayGlobalSound("Misc/Switch.ogg")
      Execute("tts_interrupt Ambience Sound Volume: " .. tostring(newVol) .. " percent.")
      if CurrentAmbienceSound and Audio.isPlaying(CurrentAmbienceSound) == 1 then
        return Audio.setVol(newVol, CurrentAmbienceSound)
      end
    else
      Execute("tts_interrupt Ambience sounds currently disabled.")
    end

  elseif (ConfigTable.Settings.VolumeType == 3) then
    -- Combat Music Volume
    if (ConfigTable.Settings.CombatMusic == 1) then
      local newVol = ConfigTable.Settings.CombatVolume + CurrentVolume
      if newVol > 100 or newVol < 1 then
        PlayGlobalSound("Misc/Error.ogg")
        Execute("tts_interrupt Combat Music volume must be between 1 and 100.")
        return
      end
      ConfigTable.Settings.CombatVolume = newVol
      PlayGlobalSound("Misc/Switch.ogg")
      Execute("tts_interrupt Combat Music Volume: " .. tostring(newVol) .. " percent.")
      if CurrentCombatMusic and Audio.isPlaying(CurrentCombatMusic) == 1 then
        return Audio.setVol(newVol, CurrentCombatMusic)
      end
    else
      Execute("tts_interrupt Combat Music currently disabled.")
    end

  elseif (ConfigTable.Settings.VolumeType == 4) then
    -- Music Volume
    if (ConfigTable.Settings.MusicSound == 1) then
      local newVol = ConfigTable.Settings.MusicVolume + CurrentVolume
      if newVol > 100 or newVol < 1 then
        PlayGlobalSound("Misc/Error.ogg")
        Execute("tts_interrupt Music volume must be between 1 and 100.")
        return
      end
      ConfigTable.Settings.MusicVolume = newVol
      PlayGlobalSound("Misc/Switch.ogg")
      Execute("tts_interrupt Music Volume: " .. tostring(newVol) .. " percent.")
      if CurrentMusicSound and Audio.isPlaying(CurrentMusicSound) == 1 then
        return Audio.setVol(newVol, CurrentMusicSound)
      end
    else
      Execute("tts_interrupt Music currently disabled.")
    end
  end
end
