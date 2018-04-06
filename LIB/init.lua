local path = ...
if path:sub(-4) == "init" then
  path = path:sub(1, -6)
  if not (path) then
    path = "."
  end
end
return require(tostring(path) .. "/slab")
