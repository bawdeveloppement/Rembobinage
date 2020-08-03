local Appart = require('middleclass')('Appart');

function Appart:initialize(x, y)
    self.x = x;
    self.y = y;
    self.w = love.math.random(3, 6);
    self.h = love.math.random(4, 15);
    self.space = love.math.random(1, 10) * 10;
    self.rooms = self.w * self.h;
end

function Appart:update(dt, camx)
    self.x = self.x - camx
end

function Appart:draw()
    self:drawoutline();
end

function Appart:drawoutline()
    love.graphics.setColor(50/255, 50/255, 48/255, 1)
    love.graphics.rectangle("fill", self.x, self.y - self.h * 20, self.w * 20, self.h * 20)
    love.graphics.setColor(55/255, 55/255, 51/255, 1)
    local i = 0
    local j = 0
    while i < self.h do
        j = 0
        while j < self.w do
            love.graphics.line(self.x + j * 20, self.y - i * 20, self.x + j * 20, self.y -  (i * 20 + 20))
            love.graphics.line(self.x + j * 20, self.y - i * 20, self.x + j * 20 + 20, self.y - i * 20)
            if i ~= self.h - 1 then
                love.graphics.line(self.x + j * 20 + 20, self.y - (i * 20 + 20), self.x + j * 20 + 20, self.y - i * 20)
            end
            if j ~= self.w - 1 then
                love.graphics.line(self.x + j * 20 + 20, self.y - (i * 20 + 20), self.x + j * 20, self.y - (i * 20 + 20))
            end
            if j == self.w - 1 and i == self.h - 1 then
                love.graphics.line(self.x + j * 20 + 20, self.y - (i * 20 + 20), self.x + j * 20, self.y - (i * 20 + 20))
                love.graphics.line(self.x + j * 20 + 20, self.y - (i * 20 + 20), self.x + j * 20 + 20, self.y - i * 20)
            end
            j = j + 1
        end
        i = i + 1
    end
end

return Appart;