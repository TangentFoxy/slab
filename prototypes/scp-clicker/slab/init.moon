path = ...

if path\sub(-4) == "init"
  path = path\sub 1, -6
  path = "." unless path

return require "#{path}/slab"
