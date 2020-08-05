local GameObject = require(_G.basedir .. "utils.middleclass");

GameObject.static.gameobjects = {};

function GameObject:initialise()
    self.debug = false;
    self.components = {};
    table.insert(self.gameobjects, self);
end

function GameObject:setTag(tagName)
    -- we should create a tagList & instantiate a tag in the tag list if when assigning, the tag doesnt exist
    self.tag = tagName;
end

function GameObject:addComponent(components)
    
end

function GameObject:setDebug(shouldDebug)
    self.debug = shouldDebug;
end

function GameObject:update(dt)
end

function GameObject:draw()
end

return GameObject