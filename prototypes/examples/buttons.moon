{
  text: "click me"
  -- define a clicked fn here
}
{
  padding: 3
  text: "button"
  background: {0, 255, 255, 255} -- teal
  color: {255, 255, 255, 255} -- white
}
{
  padding: 8
  text: "+"
  background: {0, 255, 255, 255} -- teal
  color: {255, 255, 255, 255} -- white
  round: true -- to make a rounded button (like a badge)
  round: 5    -- round the background box by this percent/pixels
}
{
  background: some_image
  clicked: (btn, x, y) -> -- now its a button! :D
  hovered: (x, y) ->      -- with optional hoverable capability
}
