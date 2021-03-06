local Sprite = require(_G.engineDir.."middleclass")("Sprite");
local Vector2 = require(_G.engineDir.."baw.utils.Vector2");
local Transform = require(_G.componentDir.."transform");

function Sprite:initialize(entityRef, data)
    self.entity, self.relativity, self.image = entityRef, nil, nil;
    self.transform = self.entity:getComponent(Transform);

    self.scale = Vector2(55, 37);
    
    if data.relativity ~= nil then self:setRelativity(data.relativity) else
        self.relativity = Vector2(0, 0);
    end

    if data.scale ~= nil then self.scale = Vector2(data.scale.x, data.scale.y) end

    if data.imageUri ~= nil then self:setImage(data.imageUri) end

    print(self.image)
end

function Sprite:setRelativity(relativity)
    self.relativity = Vector2(relativity.x, relativity.y);
end

function Sprite:setImage(imageUri)
    self.image = love.graphics.newImage(imageUri);
end

function Sprite:draw()
    -- Soon draw all image on GameObject.layer
    -- & Insert the referrence of the methods in GameObject.layer {}
    love.graphics.setColor(1,1,1,1);
    if self.image ~= nil then
        love.graphics.draw(self.image, self:getSpriteIndex(0), self.transform.position.x, self.transform.position.y, 0, 2);
    else
        love.graphics.rectangle("fill",
            self.transform.position.x,
            self.transform.position.y,
            self.scale.x,
            self.scale.y
        );
    end
end

function Sprite:getSpriteIndex(x)
    print(self.scale.x)
    return love.graphics.newQuad(x, x, self.scale.x, self.scale.y, self.image:getDimensions())
end

return  Sprite