-- based on http://www.material-ui.com/#/components/app-bar

{
  toolbar: {
    width: 1
    -- height not defined, it will be defined by largest sub-element (in this case, the text)
    -- sub-items' heights will be equal, widths according to aspect ratio
    padding: 5
    {
      dropdown: {
        toggle: "click" -- vs hover (default)
        background: hamburger -- a drawable hamburger icon
        background: { hamburger, close_x } -- idea: first is default state, second is when activated
        {} -- sub-items (not shown unless activated)
      }
    }
    {
      text: "Title"
      clicked: (btn, x, y) ->
        -- func that replaces (switch method?) toolbar w one defined below
    }
    {
      align: "right"
      dropdown: {
        toggle: "click"
        background: down_arrow
        {} -- sub-items (not shown unless activated)
      }
    }
  }
}

{
  toolbar: {
    padding: 5
    {
      background: close_x
    }
    {
      textinput: {
        name: "title" -- something to make it easier to access whatever value is stored here currently ?
        value: "Title"
        -- something to style it to just be the text
      }
    }
    {
      align: "right"
      text: "SAVE"
      clicked: (btn, x, y) ->
        -- do something to save what has been put in the textinput
    }
  }
}
