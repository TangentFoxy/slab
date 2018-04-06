path = (...)\sub 1, -("menu"\len! + 2)
generic = require "#{path}/generic"

import insert from table

class menu extends generic
  new: (element={}, parent) =>
    super element, parent

    for child in *@
      if @menu.width
        child.width = @menu.width unless child.width
      if @menu.height
        child.height = @menu.height unless child.height
      if @menu.align
        child.align = @menu.align unless child.align

    if #@menu > 0
      slab = require "#{path\sub 1, -7}/slab"
      for child in *@menu
        insert(@, slab.make child, @)
