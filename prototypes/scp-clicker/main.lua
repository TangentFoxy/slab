local graphics
graphics = love.graphics
local slab = require("slab")
local clickers = {
  width = 1 / 3,
  height = 1,
  align = "left",
  menu = {
    height = 1 / 3,
    align = "center",
    {
      name = "cash_clicker",
      clicked = function(self, btn, x, y) end,
      spinner = {
        value = 0
      },
      {
        size = 0.8,
        align = "center",
        background = graphics.newImage("gfx/banknote.png")
      },
      {
        align = "bottom-left",
        text = "Lv. 0"
      }
    },
    {
      name = "danger_clicker",
      clicked = function(self, btn, x, y) end,
      spinner = {
        value = 0
      },
      {
        size = 0.8,
        align = "center",
        background = graphics.newImage("gfx/hazard-sign.png")
      },
      {
        align = "bottom-left",
        text = "Lv. 0"
      }
    },
    {
      name = "research_clicker",
      clicked = function(self, btn, x, y) end,
      spinner = {
        value = 0
      },
      {
        size = 0.8,
        align = "center",
        background = graphics.newImage("gfx/fizzing-flask.png")
      },
      {
        align = "bottom-left",
        text = "Lv. 0"
      }
    }
  }
}
slab.make(clickers)
love.update = function(dt)
  return slab.update(dt)
end
love.draw = function()
  return slab.draw()
end
love.keypressed = function(key)
  if key == "escape" then
    return love.event.quit()
  end
end
