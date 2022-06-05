-- Standard awesome library
local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Helpers
local helpers = require("helpers")

-- Bling Module
local bling = require("module.bling")

-- Layout Machi
local machi = require("module.layout-machi")
beautiful.layout_machi = machi.get_icon()

-- Desktop
-------------

-- Custom Layouts
local centered = bling.layout.centered
local equal = bling.layout.equalarea

machi.editor.nested_layouts = {
	["0"] = deck,
	["1"] = awful.layout.suit.spiral,
	["2"] = awful.layout.suit.fair,
	["3"] = awful.layout.suit.fair.horizontal,
}

-- Set the layouts
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.tile,
		awful.layout.suit.floating,
		centered,
		equal,
	})
end)

-- Screen Padding and Tags
screen.connect_signal("request::desktop_decoration", function(s)
	-- Screen padding
	screen[s].padding = { left = dpi(4), right = dpi(4), top = dpi(10), bottom = dpi(10) }
	-- -- Each screen has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])
end)

-- Wallpapers
awful.screen.connect_for_each_screen(function(s)
	gears.wallpaper.maximized(
		gears.surface.load_uncached(beautiful.wallpaper),
		s,
		false,
		nil
	)
end)

-- Set tile wallpaper
-- bling.module.tiled_wallpaper("", s, {
--     fg = beautiful.lighter_bg,
--     bg = beautiful.xbackground,
--     offset_y = 6,
--     offset_x = 18,
--     font = "Iosevka",
--     font_size = 17,
--     padding = 70,
--     zickzack = true
-- })

-- Import configuration stuff
require("configuration.keys")
require("configuration.ruled")
require("configuration.extras")
require("configuration.menu")
