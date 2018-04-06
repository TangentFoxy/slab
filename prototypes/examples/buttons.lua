local _ = {
  text = "click me"
}
_ = {
  padding = 3,
  text = "button",
  background = {
    0,
    255,
    255,
    255
  },
  color = {
    255,
    255,
    255,
    255
  }
}
_ = {
  padding = 8,
  text = "+",
  background = {
    0,
    255,
    255,
    255
  },
  color = {
    255,
    255,
    255,
    255
  },
  round = true,
  round = 5
}
return {
  background = some_image,
  clicked = function(btn, x, y) end,
  hovered = function(x, y) end
}
