path = (...)\sub 1, -("generic"\len! + 2)

import floor from math

-- local slab
class generic
  -- @load: (lib) =>
  --   print "LOAD", self, lib
  --   slab = lib

  new: (element={}, parent) =>
    error "No parent element!" unless parent
    @parent = parent
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
      @backgroundWidth = @background\getWidth!
      @backgroundHeight = @background\getHeight!
      @aspectRatio = @backgroundWidth / @backgroundHeight

    if #@ > 0
      slab = require "#{path\sub 1, -7}/slab"
      for i = 1, #@
        @[i] = slab.make(@[i], @)

    @_align!

  draw: =>
    graphics.setColor @color
    if @background
      graphics.draw @background, @x, @y, 0, @w / @backgroundWidth, @h / @backgroundHeight
    else
      graphics.rectangle "fill", @x, @y, @w, @h

  _align: =>
    switch @align
      when "top-left", "left", "bottom-left"
        -- align left
        @x = @parent.x
      when "top", "center", "bottom"
        -- align center
        @x = @parent.x + @parent.w / 2 - @w / 2
      when "top-right", "right", "bottom-right"
        -- align right
        @x = @parent.x + @parent.w - @w

    switch @align
      when "top-left", "top", "top-right"
        -- align top
        @y = @parent.y
      when "left", "center", "right"
        -- align center
        @y = @parent.y + @parent.h / 2 - @h / 2
      when "bottom-left", "bottom", "bottom-right"
        -- align bottom
        @y = @parent.y + @parent.h - @h

    for child in *@
      child\_align!
