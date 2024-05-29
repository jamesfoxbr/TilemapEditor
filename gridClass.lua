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
    if love.keyboard.isDown('right') then
        self.x = self.x + 20 * dt
    end
end

function Grid:draw()
    love.graphics.print(#self.tiles, 20, 20)
    for k, v in pairs(self.tiles) do
        v:draw()
    end
end

function Grid:setTile(row, column, cellX, cellY)
    -- check if the grid location is already occupied and if yes remove it before put a new one
    local b, i = Grid:checkIfEmpty(self, row, column) 
    if b then
        table.remove( self.tiles, i )
    end

    -- Place the new tile
    local gridX = row * self.width + self.x
    local gridY = column * self.height + self.y
    local tile = Tile(self.img, gridX, gridY, self.width, self.height, cellX, cellY)

    table.insert(self.tiles, tile)
    
end

function Grid:deleteTile(row, column)
    -- check if the tile is occupied and if yes it remove.
    local b, i = Grid:checkIfEmpty(self, row, column) 
    if b then
        table.remove( self.tiles, i )
    end
end

function Grid:checkIfEmpty(self, row, column)
    for i = 1, #self.tiles do
        if math.floor(self.tiles[i].row / self.width) == row and math.floor(self.tiles[i].column / self.height) == column then
            return true, i
        end
    end
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
    --love.graphics.rectangle("line", self.row, self.column, self.width, self.height)
    love.graphics.draw(self.image, self.quad, self.row, self.column)
end