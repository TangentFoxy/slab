import graphics from love

slab = require "slab"

clickers = {
  width: 1/3
  height: 1
  align: "left" -- if not set, will not align!
  menu: { -- block elements default to minimum space required (but we defined it)
    height: 1/3 -- defined here applies to children
    align: "center" -- defined here means the children are aligned this way
    {
      name: "cash_clicker"
      clicked: (btn, x, y) =>
        -- stuff
      spinner: {
        value: 0 -- a defined value means it is set instead of just spinning constantly ?
      }
      {
        size: 0.8
        align: "center"
        background: graphics.newImage "gfx/banknote.png"
      }
      {
        align: "bottom-left"
        text: "Lv. 0"
      }
    }
    {
      name: "danger_clicker"
      clicked: (btn, x, y) =>
        -- stuff
      spinner: { value: 0 }
      {
        size: 0.8
        align: "center"
        background: graphics.newImage "gfx/hazard-sign.png"
      }
      {
        align: "bottom-left"
        text: "Lv. 0"
      }
    }
    {
      name: "research_clicker"
      clicked: (btn, x, y) =>
        -- stuff
      spinner: { value: 0 }
      {
        size: 0.8
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

slab.make clickers

love.update = (dt) ->
  slab.update dt

love.draw = ->
  slab.draw!

love.keypressed = (key) ->
  if key == "escape"
    love.event.quit!
