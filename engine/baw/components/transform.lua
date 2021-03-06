local Component = require(_G.engineDir .. "baw.components.component")
local Transform = require(_G.engineDir .. "middleclass")("Transform", Component);
local Vector2 = require(_G.engineDir .. "baw.utils.Vector2");

--[[ Implementation
    V = Done
    ! = NextTodo
    ? = ShouldTodo
    Implementation Properties to do :
        -V parent = The parent of the transform.
        -! childCount = The number of children the parent Transform has.
        -! eulerAngles = The rotation as Euler angles in degrees.
        -? forward = Returns a normalized vector representing the blue axis of the transform in world space.
        -? hasChanged = Has the transform changed since the last time the flag was set to 'false'?
        -? hierarchyCapacity = The transform capacity of the transform's hierarchy data structure.
        -? hierarchyCount The number of transforms in the transform's hierarchy data structure.
        -! localPosition = Position of the transform relative to the parent transform.
        -V localRotation = The rotation of the transform relative to the transform rotation of the parent.
        -V localScale = The scale of the transform relative to the GameObjects parent.
        -V position = The world space position of the Transform.
    Implementation Methods

]]--

function Transform:initialize(entityRef, data)
    self.entity = entityRef;
    self.position = Vector2(data.position.x, data.position.y);
    -- self.position = Vector2:new(arg.ax, arg.ay);
    -- self.rotation = Vector2(data.rotation.x or 0, data.rotation.y or 0);
    -- self.scale = Vector2:new(arg.sx, arg.sy);
    -- -- self.child = {}
    -- self.parent = nil;
    -- self.gameobject = arg.gameobject;
end

function Transform:getVector()
    return self.position;
end

function Transform:getRotation()
    return self.rotation;
end

function Transform:draw()
    -- if Config.debug ~= nil and Config.debug then
    --     love.graphics.print(self.position.x)
    -- end
end

function Transform:getScale()
    return self.scale;
end

function Transform:translate(vector)
    self.position = vector;
end

return Transform