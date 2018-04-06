path = (...)\sub 1, -("spinner"\len! + 2)
generic = require "#{path}/generic"

import graphics from love
import pi, min from math
tau = pi * 2
half_pi = pi / 2

class spinner extends generic
  new: (element={}, parent) =>
    super element, parent

    -- @offset = -half_pi
    @offset = 0 unless @offset
    @value = 0.1 -- temporary

    -- slab = require "#{path\sub 1, -7}/slab"

  draw: =>
    -- TODO should be setting color!
    graphics.arc "line", @x + @w / 2, @y + @h / 2, min(@w, @h), @offset, @offset + @value * tau
