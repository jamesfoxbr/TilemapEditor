---@diagnostic disable: undefined-global

Object = require "classic"

----------------------------------------------------------------------------------
--                                 GRID CLASS
----------------------------------------------------------------------------------

Grid = Object:extend()

function Grid:new(spriteSheet, x, y, width, height, rows, columns)
    self.x       = x
    self.y       = y 
    self.width   = width 
    self.height  = height 
    self.rows    = rows
    self.columns = columns
    self.img     = love.graphics.newImage(spriteSheet)
    self.tiles   = {}
end

function Grid:update(dt)

end

function Grid:draw()
    for k, v in pairs(self.tiles) do
        v:draw()
    end
end

function Grid:setTile(row, column, cellX, cellY)
    local gridX = row * self.width + self.x
    local gridY = column * self.height + self.y

    local tile = Tile(self.img, gridX, gridY, self.width, self.height, cellX, cellY)
    table.insert(self.tiles, tile)
end

----------------------------------------------------------------------------------
--                                 TILE CLASS
----------------------------------------------------------------------------------

Tile = Object:extend()

function Tile:new(img, row, column, width, height, cellX, cellY)
    self.row      = row
    self.column   = column
    self.tileType = tileType
    self.image    = img
    self.width    = width
    self.height   = height
    self.quad     = love.graphics.newQuad(cellX * width, cellY * height, width, height, img)
end

function Tile:draw()
    love.graphics.rectangle("line", self.row, self.column, self.width, self.height)
    love.graphics.draw(self.image, self.quad, self.row, self.column)
end