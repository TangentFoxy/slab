local path = (...):sub(1, -(("generic"):len() + 2))
local floor
floor = math.floor
local generic
do
  local _class_0
  local _base_0 = {
    draw = function(self) end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, element, parent)
      if element == nil then
        element = { }
      end
      if parent == nil then
        parent = slab.ui
      end
      for k, v in pairs(element) do
        self[k] = v
      end
      if self.visible == nil then
        self.visible = true
      end
      if self.hovered then
        self.hoverable = true
      end
      if self.hoverable == nil then
        self.hoverable = false
      end
      if self.width then
        if self.width <= 1 then
          self.w = floor(parent.w * self.width)
        else
          self.w = floor(self.width)
        end
      else
        self.width = 0
        self.w = 0
      end
      if self.height then
        if self.height <= 1 then
          self.h = floor(parent.h * self.height)
        else
          self.h = floor(self.height)
        end
      else
        self.height = 0
        self.h = 0
      end
      if "table" == type(self.background) then
        if not (self.color) then
          self.color = self.background
        end
        self.background = nil
      else
        if not (self.color) then
          self.color = {
            255,
            255,
            255,
            255
          }
        end
      end
      if self.background then
        self.aspectRatio = self.background:getWidth() / self.background:getHeight()
      end
      if #self > 0 then
        local slab = require(tostring(path:sub(1, -7)) .. "/slab")
        for _index_0 = 1, #self do
          local child = self[_index_0]
          slab.make(child, self)
        end
      end
    end,
    __base = _base_0,
    __name = "generic"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  generic = _class_0
  return _class_0
end
