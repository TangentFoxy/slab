import graphics from love

slab = {
  types: { "menu", "spinner" }
  screen: { x: 0, y: 0, width: graphics.getWidth!, height: graphics.getHeight! }
}

slab.generic = class
  new: (element={}, parent=slab.screen) =>
    for k,v in pairs element
      @[k] = v

    if @width
      if @width <= 1
        @w = parent.w * @width
      else
        @w = @width

    if @height
      if @height <= 1
        @h = parent.h * @height
      else
        @h = @height

slab.menu = class
  new: (parent=slab.screen) =>
    for child in *@
      if @menu.width
        child.width = @menu.width
      if @menu.height
        child.height = @menu.height
      if @menu.align
        child.align = @menu.align

    -- TODO menus are a vertical structure

slab.make = (element={}, parent=slab.screen) ->
  element = slab.generic element, parent
  for t in *slab.types
    element = slab[t](parent) if element[t]
  return element

-- b = slab.make sample_value: true
-- print(b.sample_value)

clickers = {
  width: 1/3
  height: 1
  menu: { -- block elements default to minimum space required
    height: 1/3 -- defined here applies to children
    align: "center" -- defined here means the children are aligned this way
    {
      name: "cash_clicker"
      clicked: (btn, x, y) ->
        -- stuff
      spinner: {
        value: 0 -- a defined value means it is set instead of just spinning constantly ?
        {
          width: 0.8
          align: "center"
          background: graphics.newImage "gfx/banknote.png"
        }
        {
          align: "bottom-left"
          text: "Lv. 0"
        }
      }
    }
    {
      name: "danger_clicker"
      clicked: (btn, x, y) ->
        -- stuff
      spinner: {
        value: 0
        {
          width: 0.8
          align: "center"
          background: graphics.newImage "gfx/hazard-sign.png"
        }
        {
          align: "bottom-left"
          text: "Lv. 0"
        }
      }
    }
    {
      name: "research_clicker"
      clicked: (btn, x, y) ->
        -- stuff
      spinner: {
        value: 0
        {
          width: 0.8
          align: "center"
          background: graphics.newImage "gfx/fizzing-flask.png"
        }
        {
          align: "bottom-left"
          text: "Lv. 0"
        }
      }
    }
  }
}
