-- Author: Atlan
-- Description: numpad 

function NumpadInit()
  if (ConfigTable.Settings.Numpad == 1) then
    Accelerator("Numpad1", "southwest")
    Accelerator("Numpad2", "south")
    Accelerator("Numpad3", "southeast")
    Accelerator("Numpad4", "west")
    Accelerator("Numpad5", "look")
    Accelerator("Numpad6", "east")
    Accelerator("Numpad7", "northwest")
    Accelerator("Numpad8", "north")
    Accelerator("Numpad9", "northeast")
    Accelerator("Add", "down")
    Accelerator("Subtract", "up")
    Accelerator("Ctrl+I", "north")
    Accelerator("Alt+i","north")
    Accelerator("Alt+k", "south")
    Accelerator("Alt+l", "east")
    Accelerator("Alt+j", "west")
    Accelerator("Alt+o", "northeast")
    Accelerator("Alt+u", "northwest")
    Accelerator("Alt+,", "southeast")
    Accelerator("Alt+n", "southwest")
    Accelerator("Alt+r", "up")
    Accelerator("Alt+f", "down")
  elseif (ConfigTable.Settings.Numpad == 2) then
    Accelerator("Numpad1", "swim sw")
    Accelerator("Numpad2", "swim s")
    Accelerator("Numpad3", "swim se")
    Accelerator("Numpad4", "swim w")
    Accelerator("Numpad5", "look")
    Accelerator("Numpad6", "swim e")
    Accelerator("Numpad7", "swim nw")
    Accelerator("Numpad8", "swim n")
    Accelerator("Numpad9", "swim ne")

  end
end