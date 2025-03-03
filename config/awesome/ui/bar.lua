local awful = require'awful'
local beautiful = require'beautiful'
local wibox = require'wibox'
local dpi = beautiful.xresources.apply_dpi
local gears = require'gears'

local cairo = require("lgi").cairo
local helpers = require'config.helpers'
local apps = require'config.apps'

local awesomemenu = {
   {'reload', awesome.restart},
   {'end', awesome.quit},
}

local mainmenu = awful.menu{
   items = {
    {'awesome', awesomemenu},
    {'vscode', apps.vscode},
    {'files', apps.files},
    {'browser', apps.browser},
    {'wallpaper', apps.nitrogen},
    {'terminal', apps.terminal}
   }
}

local clock_widget = wibox.widget {
    {
        format = '%I:%M %p',
        widget = wibox.widget.textclock,
        font = "SF Pro Display Bold 11",
    },
    fg = beautiful.fg_focus,
    widget = wibox.container.background
}

local clock_with_padding = wibox.container.margin(clock_widget, dpi(10), dpi(10), dpi(8), dpi(8))

local clock_with_border = wibox.container.background(clock_with_padding, "#1a1a1a")
clock_with_border.shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
end

clock_with_border.bg = "#1a1a1a"

local clock_with_margin = wibox.container.margin(clock_with_border, dpi(5), dpi(5), dpi(5), dpi(5))

local launcher = awful.widget.launcher {
    image = beautiful.awesome_icon,
    menu = mainmenu
}

local launcher_with_padding = wibox.container.margin(launcher, dpi(10), dpi(10), dpi(8), dpi(8))

local launcher_with_border = wibox.container.background(launcher_with_padding, "#1a1a1a")
launcher_with_border.shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
end

launcher_with_border.bg = "#1a1a1a"

local launcher_with_margin = wibox.container.margin(launcher_with_border, dpi(5), dpi(5), dpi(5), dpi(5))

screen.connect_signal('request::desktop_decoration', function(s)

    s.mainbar = awful.wibar({
        screen = s,
        position = "bottom",
        height = dpi(50),
        width = dpi(148),
        floating = true,
        visible = true,
        ontop = false,
        bg = beautiful.bg_normal,
    })

    s.mainbar:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            launcher_with_margin,
            clock_with_margin,
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
    }

    awful.placement.bottom_left(s.mainbar, {margins = {left = dpi(10), bottom = dpi(10)}})

end)