---@diagnostic disable: undefined-global, lowercase-global

require("gridClass")
require("graphic")

love.graphics.setDefaultFilter("nearest", "nearest")

canvas = love.graphics.newCanvas(256, 256)

TILE_WIDTH  = 16
TILE_HEIGHT = 16

function love.load()
    spriteSheet = "images/DragonOfScales001.png"
    local x = 0
    local y = 0
    local rows = 5
    local columns = 5
    grid = Grid(spriteSheet, x, y, TILE_WIDTH, TILE_HEIGHT, rows, columns)

    for y = 0, rows - 1  do
        for x = 0, columns - 1 do
            grid:setTile(x, y, -1, -1)
        end
    end

    grid:setTile(0, 0, 9, 0)
    grid:setTile(5, 4, 9, 0)

    print(math.floor(grid.tiles[3].row / 16))

end

function love.update(dt)
    
end

function love.draw()
    startCanvas()
    grid:draw()
    endCanvas()
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        local x, y = love.mouse.getPosition( )
        local px = math.floor(x / (TILE_WIDTH  * 2))
        local py = math.floor(y / (TILE_HEIGHT * 2))
        grid:setTile(px, py, 9, 0)
    end
end



