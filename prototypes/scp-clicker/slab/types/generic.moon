path = (...)\sub 1, -("generic"\len! + 2)

import floor from math

-- local slab
class generic
  -- @load: (lib) =>
  --   print "LOAD", self, lib
  --   slab = lib

  new: (element={}, parent=slab.ui) =>
    for k,v in pairs element
      @[k] = v

    @visible = true if @visible == nil
    @hoverable = true if @hovered
    @hoverable = false if @hoverable == nil

    if @width
      if @width <= 1
        @w = floor parent.w * @width
      else
        @w = floor(@width)
    else
      @width = 0
      @w = 0

    if @height
      if @height <= 1
        @h = floor parent.h * @height
      else
        @h = floor(@height)
    else
      @height = 0
      @h = 0

    if "table" == type @background
      @color = @background unless @color
      @background = nil
    else
      @color = {255, 255, 255, 255} unless @color

    if @background
      @aspectRatio = @background\getWidth! / @background\getHeight!

    -- print @__class.__name
    if #@ > 0
      slab = require "#{path\sub 1, -7}/slab"
      for child in *@
        slab.make child, @

    -- align if generic

  draw: =>
    -- TODO set color and draw background

------------------------ NOTE s -----------------------
-- 1. menu size set (full height, 1/3 width)
-- 2. spinner size set to zero width, 1/3 height, no aspect ratio
-- 3. generic size set to zero width (0.8*0) and zero height
-- 4. text -> size handled by font

-- { -- menu (set size based on parent)
--   { -- spinner (size NOT set, menu sets height only, need to set width based on aspect ratio (which is unknown initially))
--     {} -- generic (w background image) (width set based on parent, height needs to be set by aspect ratio)
--     {} -- text (size will be set by slab's default font size)
--   }
--   { -- spinner
--     {} -- generic (w background image)
--     {} -- text
--   }
--   { -- spinner
--     {} -- generic (w background image)
--     {} -- text
--   }
-- }
