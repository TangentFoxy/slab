local path = (...):sub(1, -(("generic"):len() + 2))
local floor
floor = math.floor
local generic
do
  local _class_0
  local _base_0 = {
    draw = function(self)
      graphics.setColor(self.color)
      if self.background then
        return graphics.draw(self.background, self.x, self.y, 0, self.w / self.backgroundWidth, self.h / self.backgroundHeight)
      else
        return graphics.rectangle("fill", self.x, self.y, self.w, self.h)
      end
    end,
    _align = function(self)
      local _exp_0 = self.align
      if "top-left" == _exp_0 or "left" == _exp_0 or "bottom-left" == _exp_0 then
        self.x = self.parent.x
      elseif "top" == _exp_0 or "center" == _exp_0 or "bottom" == _exp_0 then
        self.x = self.parent.x + self.parent.w / 2 - self.w / 2
      elseif "top-right" == _exp_0 or "right" == _exp_0 or "bottom-right" == _exp_0 then
        self.x = self.parent.x + self.parent.w - self.w
      end
      local _exp_1 = self.align
      if "top-left" == _exp_1 or "top" == _exp_1 or "top-right" == _exp_1 then
        self.y = self.parent.y
      elseif "left" == _exp_1 or "center" == _exp_1 or "right" == _exp_1 then
        self.y = self.parent.y + self.parent.h / 2 - self.h / 2
      elseif "bottom-left" == _exp_1 or "bottom" == _exp_1 or "bottom-right" == _exp_1 then
        self.y = self.parent.y + self.parent.h - self.h
      end
      for _index_0 = 1, #self do
        local child = self[_index_0]
        child:_align()
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, element, parent)
      if element == nil then
        element = { }
      end
      if not (parent) then
        error("No parent element!")
      end
      self.parent = parent
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
        self.backgroundWidth = self.background:getWidth()
        self.backgroundHeight = self.background:getHeight()
        self.aspectRatio = self.backgroundWidth / self.backgroundHeight
      end
      if #self > 0 then
        local slab = require(tostring(path:sub(1, -7)) .. "/slab")
        for i = 1, #self do
          self[i] = slab.make(self[i], self)
        end
      end
      return self:_align()
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
