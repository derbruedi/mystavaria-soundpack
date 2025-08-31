-- Start plugin for modern mystavaria plugin structure
-- Core dependencies
module("mystavaria.main",package.seeall)
require("mystavaria.core.config")
require("mystavaria.core.sound")
require("mystavaria.core.plugin")
require("mystavaria.core.bootstrap")

-- import macros
require("mystavaria.macros.misc")
require("mystavaria.macros.numpad")

-- Utils
require("mystavaria.util")
