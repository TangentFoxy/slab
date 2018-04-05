-- reference http://www.material-ui.com/#/components/badge

{
  background: some_image -- or could be text or something
  badge: {
    -- can be any kind of element, will be sized and offset to top-right
    --  but will have a circular outer display color for whatever it is
    --  (so really should use transparent circular items or text only)
    -- this example: a count of 2 with a background color of red and text color white
    text: 2
    background: {255, 0, 0, 255}
    color: {255, 255, 255, 255}
  }
}
