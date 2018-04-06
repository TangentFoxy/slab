path = (...)\sub 1, -("slab"\len! + 2)

import graphics from love

slab = {
  _VERSION: "0.1.0"
  _DESCRIPTION: "GUI library for LÖVE."
  _URL: nil
  _LICENSE: "The MIT License (MIT)"
  _AUTHOR: "Paul Liverman III"
}

slab.ui = { x: 0, y: 0, w: graphics.getWidth!, h: graphics.getHeight! }
slab.hovered = false
slab.focused = false
slab.types = { "menu", "spinner", "text" }
slab.generic = require "#{path}/types/generic"
for t in *slab.types
  slab[t] = require "#{path}/types/#{t}"
  -- slab[t]\load slab if slab[t].load

slab.make = (element={}, parent=slab.ui) ->
  for t in *slab.types
    return slab[t](element, parent) if element[t]
  return slab.generic element, parent

slab.update = (dt, element=slab.ui) ->
  element\update dt if element.update
  for child in *element
    slab.update dt, child

slab.draw = (element=slab.ui) ->
  if element == slab.ui
    graphics.push "all"
    graphics.origin!

  local drawChildren
  drawChildren = element\draw! if element.visible and element.draw
  if drawChildren != false
    for child in *element
      slab.draw child

  if element == slab.ui
    graphics.pop!

slab.mousemoved = (x, y, dx, dy, element=slab.ui) ->
  local previous
  if element == slab.ui
    previous = slab.hovered

  if element.visible and element.hoverable and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h
    slab.hovered = element
    for child in *element
      slab.mousemoved x, y, dx, dy, child

  if element == slab.ui
    if slab.hovered != previous
      previous\hovered false if previous and previous.hovered
      slab.hovered\hovered true if slab.hovered.hovered
    if slab.focused and slab.focused.mousemoved
      return slab.focused\mousemoved x - slab.focused.x, y - slab.focused.y, dx, dy

slab.mousepressed = (x, y, btn, element=screen.ui) ->
  if element == screen.ui
    if btn == "wd"
      return slab.wheelmoved 0, -1
    elseif btn == "wu"
      return slab.wheelmoved 0, 1

  handled = false
  if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h
    for i = #element, 1, -1
      handled = slab.mousepressed x, y, btn, element[i]
      return handled if handled != false

    if element.mousepressed
      handled = element\mousepressed btn, x, y

  return handled

slab.mousereleased = (x, y, btn, element) ->
  clickHandled, mousereleaseHandled = false, false
  if element
    if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h
      for i = #element, 1, -1
        clickHandled, mousereleaseHandled = slab.mousereleased x, y, btn, element[i]
        if clickHandled != false or mousereleaseHandled != false
          return clickHandled, mousereleaseHandled

      clickHandled = element\clicked btn, x - element.x, y - element.y if element.clicked
      mousereleaseHandled = element\mousereleased btn, x - element.x, y - element.y if element.mousereleased
      slab.focused = element if clickHandled

  elseif element = slab.focused
    mousereleaseHandled = element\mousereleased btn, x - element.x, y - element.y if element.mousereleased
    if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h
      clickHandled = element\clicked btn, x - element.x, y - element.y if element.clicked

    if clickHandled != false or mousereleaseHandled != false
      return clickHandled, mousereleaseHandled

    slab.mousereleased x, y, btn, slab.ui

slab.wheelmoved = (x, y) ->
  return slab.hovered\wheelmoved x, y if slab.hovered and slab.hovered.wheelmoved
  return false

return slab
