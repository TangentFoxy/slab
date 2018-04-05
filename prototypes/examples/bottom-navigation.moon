-- from http://www.material-ui.com/#/components/bottom-navigation

{
  toolbar: {
    width: 0.5
    padding: 3
    {
      -- default align is top-left (we want left, but in this case, vertical alignment doesn't mean anything)
      background: recents_icon
    }
    {
      align: "center"
      background: favorites_icon
    }
    {
      align: "right"
      background: nearby_icon
    }
  }
}
