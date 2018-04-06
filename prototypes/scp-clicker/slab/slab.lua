local path = (...):sub(1, -(("slab"):len() + 2))
local graphics
graphics = love.graphics
local slab = {
  _VERSION = "0.1.0",
  _DESCRIPTION = "GUI library for LÖVE.",
  _URL = nil,
  _LICENSE = "The MIT License (MIT)",
  _AUTHOR = "Paul Liverman III"
}
slab.ui = {
  x = 0,
  y = 0,
  w = graphics.getWidth(),
  h = graphics.getHeight()
}
slab.hovered = false
slab.focused = false
slab.types = {
  "menu",
  "spinner",
  "text"
}
slab.generic = require(tostring(path) .. "/types/generic")
local _list_0 = slab.types
for _index_0 = 1, #_list_0 do
  local t = _list_0[_index_0]
  slab[t] = require(tostring(path) .. "/types/" .. tostring(t))
end
slab.make = function(element, parent)
  if element == nil then
    element = { }
  end
  if parent == nil then
    parent = slab.ui
  end
  local _list_1 = slab.types
  for _index_0 = 1, #_list_1 do
    local t = _list_1[_index_0]
    if element[t] then
      return slab[t](element, parent)
    end
  end
  return slab.generic(element, parent)
end
slab.update = function(dt, element)
  if element == nil then
    element = slab.ui
  end
  if element.update then
    element:update(dt)
  end
  for _index_0 = 1, #element do
    local child = element[_index_0]
    slab.update(dt, child)
  end
end
slab.draw = function(element)
  if element == nil then
    element = slab.ui
  end
  if element == slab.ui then
    graphics.push("all")
    graphics.origin()
  end
  local drawChildren
  if element.visible and element.draw then
    drawChildren = element:draw()
  end
  if drawChildren ~= false then
    for _index_0 = 1, #element do
      local child = element[_index_0]
      slab.draw(child)
    end
  end
  if element == slab.ui then
    return graphics.pop()
  end
end
slab.mousemoved = function(x, y, dx, dy, element)
  if element == nil then
    element = slab.ui
  end
  local previous
  if element == slab.ui then
    previous = slab.hovered
  end
  if element.visible and element.hoverable and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h then
    slab.hovered = element
    for _index_0 = 1, #element do
      local child = element[_index_0]
      slab.mousemoved(x, y, dx, dy, child)
    end
  end
  if element == slab.ui then
    if slab.hovered ~= previous then
      if previous and previous.hovered then
        previous:hovered(false)
      end
      if slab.hovered.hovered then
        slab.hovered:hovered(true)
      end
    end
    if slab.focused and slab.focused.mousemoved then
      return slab.focused:mousemoved(x - slab.focused.x, y - slab.focused.y, dx, dy)
    end
  end
end
slab.mousepressed = function(x, y, btn, element)
  if element == nil then
    element = screen.ui
  end
  if element == screen.ui then
    if btn == "wd" then
      return slab.wheelmoved(0, -1)
    elseif btn == "wu" then
      return slab.wheelmoved(0, 1)
    end
  end
  local handled = false
  if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h then
    for i = #element, 1, -1 do
      handled = slab.mousepressed(x, y, btn, element[i])
      if handled ~= false then
        return handled
      end
    end
    if element.mousepressed then
      handled = element:mousepressed(btn, x, y)
    end
  end
  return handled
end
slab.mousereleased = function(x, y, btn, element)
  local clickHandled, mousereleaseHandled = false, false
  if element then
    if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h then
      for i = #element, 1, -1 do
        clickHandled, mousereleaseHandled = slab.mousereleased(x, y, btn, element[i])
        if clickHandled ~= false or mousereleaseHandled ~= false then
          return clickHandled, mousereleaseHandled
        end
      end
      if element.clicked then
        clickHandled = element:clicked(btn, x - element.x, y - element.y)
      end
      if element.mousereleased then
        mousereleaseHandled = element:mousereleased(btn, x - element.x, y - element.y)
      end
      if clickHandled then
        slab.focused = element
      end
    end
  else
    do
      element = slab.focused
      if element then
        if element.mousereleased then
          mousereleaseHandled = element:mousereleased(btn, x - element.x, y - element.y)
        end
        if element.visible and x >= element.x and x <= element.x + element.w and y >= element.y and y <= element.y + element.h then
          if element.clicked then
            clickHandled = element:clicked(btn, x - element.x, y - element.y)
          end
        end
        if clickHandled ~= false or mousereleaseHandled ~= false then
          return clickHandled, mousereleaseHandled
        end
        return slab.mousereleased(x, y, btn, slab.ui)
      end
    end
  end
end
slab.wheelmoved = function(x, y)
  if slab.hovered and slab.hovered.wheelmoved then
    return slab.hovered:wheelmoved(x, y)
  end
  return false
end
return slab
