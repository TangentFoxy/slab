local path = (...):sub(1, -(("spinner"):len() + 2))
local generic = require(tostring(path) .. "/generic")
local graphics
graphics = love.graphics
local pi, min
do
  local _obj_0 = math
  pi, min = _obj_0.pi, _obj_0.min
end
local tau = pi * 2
local half_pi = pi / 2
local spinner
do
  local _class_0
  local _parent_0 = generic
  local _base_0 = {
    draw = function(self)
      return graphics.arc("line", self.x + self.w / 2, self.y + self.h / 2, min(self.w, self.h), self.offset, self.offset + self.value * tau)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, element, parent)
      if element == nil then
        element = { }
      end
      _class_0.__parent.__init(self, element, parent)
      if not (self.offset) then
        self.offset = 0
      end
      self.value = 0.1
    end,
    __base = _base_0,
    __name = "spinner",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  spinner = _class_0
  return _class_0
end
