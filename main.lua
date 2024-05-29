---@diagnostic disable: undefined-global, lowercase-global

require("gridClass")
require("graphic")

love.graphics.setDefaultFilter("nearest", "nearest")

CANVAS_WIDTH = 700
CANVAS_HEIGHT = 400
canvas = love.graphics.newCanvas(CANVAS_WIDTH, CANVAS_HEIGHT)

TILE_WIDTH  = 16
TILE_HEIGHT = 16

GRID_X = 0
GRID_Y = 0

PANEL_X = 500
PANEL_Y = 0

function love.load()
    spriteSheet = "images/DragonOfScales001.png"
    local rows = 5
    local columns = 5
    grid = Grid(spriteSheet, GRID_X, GRID_Y, TILE_WIDTH, TILE_HEIGHT, rows, columns)

    grid:setTile(0, 0, 9, 0)
    grid:setTile(5, 4, 9, 0)

    preview = love.graphics.newImage(spriteSheet)

end

function love.update(dt)
    grid:update(dt)
end

function love.draw()
    startCanvas()
    drawTileset()
    grid:draw()
    endCanvas()
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 and x < 500 * 2 then
        local x, y = love.mouse.getPosition( )
        local px = math.floor(x / (TILE_WIDTH  * math.floor(love.graphics.getPixelWidth() / CANVAS_WIDTH)))
        local py = math.floor(y / (TILE_HEIGHT * math.floor(love.graphics.getPixelHeight()/ CANVAS_HEIGHT)))
        grid:setTile(px, py, 9, 0)
    end
    if button == 2 and x < 500 * 2 then
        local x, y = love.mouse.getPosition( )
        local px = math.floor(x / (TILE_WIDTH  * math.floor(love.graphics.getPixelWidth() / CANVAS_WIDTH)))
        local py = math.floor(y / (TILE_HEIGHT * math.floor(love.graphics.getPixelHeight()/ CANVAS_HEIGHT)))
        grid:deleteTile(px, py)
    end
end

function drawTileset()    
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", PANEL_X, PANEL_Y, 500, 500)
    love.graphics.setColor(1, 1, 1, 1)
end



