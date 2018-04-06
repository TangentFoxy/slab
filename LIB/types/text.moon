path = (...)\sub 1, -("text"\len! + 2)
generic = require "#{path}/generic"

import graphics from love

class text extends generic
  new: (element={}, parent) =>
    super element, parent

    -- @font = graphics.newFont 14

    -- slab = require "#{path\sub 1, -7}/slab"

  draw: =>
    -- TODO
