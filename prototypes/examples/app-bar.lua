local _ = {
  toolbar = {
    width = 1,
    padding = 5,
    {
      dropdown = {
        toggle = "click",
        background = hamburger,
        background = {
          hamburger,
          close_x
        },
        { }
      }
    },
    {
      text = "Title",
      clicked = function(btn, x, y) end
    },
    {
      align = "right",
      dropdown = {
        toggle = "click",
        background = down_arrow,
        { }
      }
    }
  }
}
return {
  toolbar = {
    padding = 5,
    {
      background = close_x
    },
    {
      textinput = {
        name = "title",
        value = "Title"
      }
    },
    {
      align = "right",
      text = "SAVE",
      clicked = function(btn, x, y) end
    }
  }
}
