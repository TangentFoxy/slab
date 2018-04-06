local path = (...):sub(1, -(("menu"):len() + 2))
local generic = require(tostring(path) .. "/generic")
local insert
insert = table.insert
local menu
do
  local _class_0
  local _parent_0 = generic
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, element, parent)
      if element == nil then
        element = { }
      end
      _class_0.__parent.__init(self, element, parent)
      for _index_0 = 1, #self do
        local child = self[_index_0]
        if self.menu.width then
          if not (child.width) then
            child.width = self.menu.width
          end
        end
        if self.menu.height then
          if not (child.height) then
            child.height = self.menu.height
          end
        end
        if self.menu.align then
          if not (child.align) then
            child.align = self.menu.align
          end
        end
      end
      if #self.menu > 0 then
        local slab = require(tostring(path:sub(1, -7)) .. "/slab")
        local _list_0 = self.menu
        for _index_0 = 1, #_list_0 do
          local child = _list_0[_index_0]
          insert(self, slab.make(child, self))
        end
      end
    end,
    __base = _base_0,
    __name = "menu",
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
  menu = _class_0
  return _class_0
end
