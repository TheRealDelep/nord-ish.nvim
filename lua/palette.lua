local lush = require('lush')
local hsl = lush.hsl

local palette = {
    black = hsl(220,10, 11),
    dark_grey = hsl(220,20,25),
    mid_grey = hsl(219, 10, 50),
    light_grey = hsl(219,10, 75) ,
    white = hsl(218,10, 95),
    green = hsl(90, 35, 70),
    yellow = hsl(40, 50, 70),
    dark_blue = hsl(210, 30, 65),
    light_blue = hsl(190, 40, 70),
    green_blue = hsl(180, 25, 65),
    purple = hsl(310, 30, 70),

    red = hsl(354, 42, 56),
    orange = hsl(20, 60, 70)
}

return palette
