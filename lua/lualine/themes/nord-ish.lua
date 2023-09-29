local function hsl_to_rgb(hsl)
    local r, g, b
    local h, s, l = hsl.h, hsl.s, hsl.l

    if s == 0 then
        r, g, b = l, l, l -- achromatic
    else
        local function hue2rgb(p, q, t)
            if t < 0   then t = t + 1 end
            if t > 1   then t = t - 1 end
            if t < 1/6 then return p + (q - p) * 6 * t end
            if t < 1/2 then return q end
            if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
            return p
        end

        local q
        if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
        local p = 2 * l - q

        r = hue2rgb(p, q, h + 1/3)
        g = hue2rgb(p, q, h)
        b = hue2rgb(p, q, h - 1/3)
    end

    return {
        r = math.floor((r * 255) + 0.5),
        g = math.floor((g * 255) + 0.5),
        b = math.floor((b * 255) + 0.5)
    }
end

local function hsl_to_hex(hsl)
    local normalized = {
        h = hsl.h / 360,
        s = hsl.s / 100,
        l = hsl.l / 100,
    }
    local rgb = hsl_to_rgb(normalized)
    return string.format("#%02X%02X%02X", rgb.r, rgb.g, rgb.b)
end

local hsl_p = require('lua.palette')
local p = {
    white = hsl_to_hex(hsl_p.white),
    light_gray = hsl_to_hex(hsl_p.light_grey),
    mid_gray = hsl_to_hex(hsl_p.mid_grey),
    dark_gray = hsl_to_hex(hsl_p.dark_grey),
    black = hsl_to_hex(hsl_p.black),
    green = hsl_to_hex(hsl_p.green),
    yellow = hsl_to_hex(hsl_p.yellow),
    dark_blue = hsl_to_hex(hsl_p.dark_blue),
    light_blue = hsl_to_hex(hsl_p.light_blue),
    green_blue = hsl_to_hex(hsl_p.green_blue),
    purple = hsl_to_hex(hsl_p.purple),
    red = hsl_to_hex(hsl_p.red),
    orange = hsl_to_hex(hsl_p.orange),
}


return {
    normal = {
        a = {bg = p.mid_gray, fg = p.white, gui = 'bold'},
        b = {bg = p.mid_gray, fg = p.white},
        c = {bg = p.mid_gray, fg = p.white},
    },
    insert = {
        a = {bg = p.dark_blue, fg = p.white},
        b = {bg = p.dark_blue, fg = p.white},
        c = {bg = p.dark_blue, fg = p.white},
    },
    visual = {
        a = {bg = p.yellow, fg = p.black, gui = 'bold'},
        b = {bg = p.yellow, fg = p.black},
        c = {bg = p.yellow, fg = p.black},
    },
    replace = {
        a = {bg = p.red, fg = p.black, gui = 'bold'},
        b = {bg = p.red, fg = p.white},
        c = {bg = p.red, fg = p.white}
    },
    command = {
        a = {bg = p.green, fg = p.black, gui = 'bold'},
        b = {bg = p.green, fg = p.white},
        c = {bg = p.green, fg = p.black}
    },
    inactive = {
        a = {bg = p.dark_gray, fg = p.light_gray, gui = 'bold'},
        b = {bg = p.dark_gray, fg = p.light_gray},
        c = {bg = p.dark_gray, fg = p.light_gray}
    }
}
