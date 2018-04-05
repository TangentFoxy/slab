-- http://www.material-ui.com/#/components/chip

{
  rounded: 5
  background: some_color
  padding: {right: 5}
  -- somehow this knows to expand to size of children horizontally, but not vertically...
  {
    rounded: true -- full circle instead of special pixel count
    background: an_image
  }
  {
    text: "Colored Chip"
  }
  {
    width: 0.8 -- 80% size of parent
    rounded: true
    background: an_x_image
  }
}
