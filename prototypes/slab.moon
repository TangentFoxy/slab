props = {
  "toolbar"
  "window"
  "tabs"
  "area"
  "grid"
  "spinner"
  "dial"
  "slider"
  "title"
  "text"
  "checkbox"
  "radio"
  "class"
  "align"
  "clicked"
  "hovered"
  "wheelmoved"
  "mousepressed"
  "mousereleased"
  "textinput"
  "keypressed"
  "keyreleased"
  "margin"
  "padding"
  "border"
  "width"
  "height"
  "size"
  "background"
  "color"
  "tooltip"
}

-- all_handlers = { "update", "draw", "errhand" }
-- for handler in pairs love.handlers
--   table.insert all_handlers, handler
--
-- null = ->

slab = {
  -- load: (handlers=all_handlers) ->
  --   for handler in *handlers
  --     current = love[handler] or null
  --     love[handler] = (...) ->
  --       current(...)
  --       return slab[handler](...)
}

-- return a table w __call for building the UI ?
-- considering the way I am handling this library is by a bunch of properties that can be mixed, perhaps a
--  ECS system might help manage things ?

-- Method: add (adds new elements, possibly triggering a reflow)
-- Method: replace (removes all inner elements and adds new elements, possibly triggering a reflow)
-- dropdown (essentially a btn w hover or click -> and a vertical toolbar (menu?)), textinput
-- Enumeration: colors (red, blue, green, teal, black, white, etc -- for convienence)

return slab
