local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

awful.screen.connect_for_each_screen(function(s)
	local awesome_icon = wibox.widget({
		widget = wibox.widget.imagebox,
		image = beautiful.awesome_logo,
		resize = true,
	})

	local launcher = wibox.widget({
		{
			awesome_icon,
			top = dpi(6),
			bottom = dpi(6),
			left = dpi(12),
			right = dpi(12),
			widget = wibox.container.margin,
		},
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, dpi(5))
		end,
		bg = beautiful.wibar_widget_bg,
		widget = wibox.container.background,
	})

	launcher:buttons(gears.table.join(awful.button({}, 1, function()
		central_panel:toggle()
	end)))

	helpers.add_hover_cursor(awesome_icon, "hand2")

	local search_icon = wibox.widget({
		font = "icomoon bold 14",
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox(),
	})

	local reset_search_icon = function()
		search_icon.markup = helpers.colorize_text("", beautiful.accent)
	end
	reset_search_icon()

	local search_text = wibox.widget({
		markup = helpers.colorize_text("Search", beautiful.xcolor8),
		align = "center",
		valign = "center",
		font = beautiful.prompt_font,
		widget = wibox.widget.textbox(),
	})

	local search = wibox.widget({
		{
			{
				search_icon,
				search_text,
				spacing = dpi(10),
				layout = wibox.layout.fixed.horizontal,
			},
			left = dpi(15),
			widget = wibox.container.margin,
		},
		forced_height = dpi(35),
		forced_width = dpi(200),
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, dpi(5))
		end,
		bg = beautiful.wibar_widget_bg,
		widget = wibox.container.background,
	})

	local function generate_prompt_icon(icon, color)
		return "<span font='icomoon 14' foreground='" .. color .. "'>" .. icon .. "</span> "
	end

	function activate_prompt(action)
		search_icon.visible = false
		local prompt
		prompt = generate_prompt_icon("", beautiful.accent)
		helpers.prompt(action, search_text, prompt, function()
			search_icon.visible = true
		end)
	end

	search:buttons(gears.table.join(
		awful.button({}, 1, function()
			activate_prompt("web_search")
		end)
	))

	helpers.add_hover_cursor(search, "hand2")

	-- battery
	local charge_icon = wibox.widget({
		markup = helpers.colorize_text("", beautiful.xbackground .. "80"),
		align = "center",
		valign = "center",
		font = beautiful.icon_font_name .. "Round 16",
		widget = wibox.widget.textbox,
		visible = false,
	})

	local batt = wibox.widget({
		color = beautiful.battery_happy_color,
		background_color = beautiful.battery_happy_color .. "55",
		bar_shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, dpi(5))
		end,
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, dpi(5))
		end,
		value = 50,
		max_value = 100,
		widget = wibox.widget.progressbar,
	})

	local batt_container = wibox.widget({
		{
			batt,
			forced_height = dpi(35),
			forced_width = dpi(100),
			shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, dpi(5))
			end,
			bg = beautiful.wibar_widget_bg,
			widget = wibox.container.background,
		},
		charge_icon,
		valign = "center",
		layout = wibox.layout.stack,
	})

	local batt_last_value = 100
	local batt_low_value = 40
	local batt_critical_value = 20
	awesome.connect_signal("signal::battery", function(value)
		batt.value = value
		batt_last_value = value
		local color

		if charge_icon.visible then
			color = beautiful.battery_charging_color
		elseif value <= batt_critical_value then
			color = beautiful.battery_sad_color
		elseif value <= batt_low_value then
			color = beautiful.battery_ok_color
		else
			color = beautiful.battery_happy_color
		end

		batt.color = color
		batt.background_color = color .. "44"
	end)

	awesome.connect_signal("signal::charger", function(state)
		local color
		if state then
			charge_icon.visible = true
			color = beautiful.battery_charging_color
		elseif batt_last_value <= batt_critical_value then
			charge_icon.visible = false
			color = beautiful.battery_sad_color
		elseif batt_last_value <= batt_low_value then
			charge_icon.visible = false
			color = beautiful.battery_ok_color
		else
			charge_icon.visible = false
			color = beautiful.battery_happy_color
		end

		batt.color = color
		batt.background_color = color .. "44"
	end)

	local vertical_separator = wibox.widget({
		orientation = "vertical",
		color = beautiful.wibar_bg,
		forced_height = dpi(1),
		forced_width = dpi(1),
		span_ratio = 0.90,
		widget = wibox.widget.separator,
	})

	-- Clock
	local clock = wibox.widget({
		font = beautiful.font_name .. "Bold 12",
		format = "%I:%M %p",
		align = "center",
		valign = "center",
		widget = wibox.widget.textclock,
	})

	-- Layoutbox
	local layoutbox_buttons = gears.table.join(
		-- Left click
		awful.button({}, 1, function(c)
			awful.layout.inc(1)
		end),

		-- Right click
		awful.button({}, 3, function(c)
			awful.layout.inc(-1)
		end),

		-- Scrolling
		awful.button({}, 4, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(1)
		end)
	)

	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(layoutbox_buttons)

	local layoutbox = wibox.widget({
		s.mylayoutbox,
		margins = dpi(2),
		widget = wibox.container.margin,
	})

	helpers.add_hover_cursor(layoutbox, "hand2")

	local right_container = wibox.widget({
		{
			{
				clock,
				vertical_separator,
				layoutbox,
				layout = wibox.layout.fixed.horizontal,
				spacing = dpi(10),
			},
			top = dpi(4),
			bottom = dpi(4),
			left = dpi(10),
			right = dpi(10),
			widget = wibox.container.margin,
		},
		shape = function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, dpi(5))
		end,
		bg = beautiful.wibar_widget_bg,
		widget = wibox.container.background,
	})

	right_container:connect_signal("mouse::enter", function()
		right_container.bg = beautiful.wibar_widget_bg .. 55
		tooltip_toggle()
	end)

	right_container:connect_signal("mouse::leave", function()
		right_container.bg = beautiful.wibar_widget_bg
		tooltip_toggle()
	end)

	-- Create the wibox
	s.mywibar = awful.wibar({
		type = "dock",
		position = "top",
		screen = s,
		height = dpi(50),
		width = s.geometry.width - dpi(25),
		bg = beautiful.transparent,
		ontop = true,
		visible = true,
	})

	awful.placement.top(s.mywibar, { margins = beautiful.useless_gap * 2})

	-- Remove wibar on full screen
	local function remove_wibar(c)
		if c.fullscreen or c.maximized then
			c.screen.mywibar.visible = false
		else
			c.screen.mywibar.visible = true
		end
	end

	-- Remove wibar on full screen
	local function add_wibar(c)
		if c.fullscreen or c.maximized then
			c.screen.mywibar.visible = true
		end
	end

	-- Hide bar when a splash widget is visible
	awesome.connect_signal("widgets::splash::visibility", function(vis)
		screen.primary.mywibar.visible = not vis
	end)

	client.connect_signal("property::fullscreen", remove_wibar)

	client.connect_signal("request::unmanage", add_wibar)

	-- Create the taglist widget
	s.mytaglist = require("ui.bar.taglist")(s)

	-- Add widgets to the wibox
	s.mywibar:setup({
		{
			{
				layout = wibox.layout.align.horizontal,
				expand = "none",
				{
					launcher,
					nil,
					search,
					spacing = dpi(10),
					layout = wibox.layout.fixed.horizontal,
				},
				{
					widget = s.mytaglist,
				},
				{
					batt_container,
					right_container,
					spacing = dpi(10),
					layout = wibox.layout.fixed.horizontal,
				},
			},
			margins = dpi(10),
			widget = wibox.container.margin,
		},
		bg = beautiful.wibar_bg,
		shape = helpers.rrect(beautiful.border_radius),
		widget = wibox.container.background,
	})
end)
