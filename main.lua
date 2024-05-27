---@diagnostic disable: undefined-global, lowercase-global

require("gridClass")
require("graphic")

love.graphics.setDefaultFilter("nearest", "nearest")

canvas = love.graphics.newCanvas(500, 400)

function love.load()
    spriteSheet = "images/DragonOfScales001.png"
    local x = 0
    local y = 0
    local width = 16
    local height = 16
    local rows = 5
    local columns = 10
    grid = Grid(spriteSheet, x, y, width, height, rows, columns)

    for y = 0, rows  do
        for x = 0, columns do
            grid:setTile(x, y, -1, -1)
        end
    end

    grid:setTile(0, 0, 9, 0)
    grid:setTile(5, 4, 9, 0)

end

function love.update(dt)
    
end

function love.draw()
    startCanvas({0.5, 0.5, 0})
    grid:draw()
    endCanvas()
end

function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        local px = math.floor(x / 16)
        local py = math.floor(y / 32)
        print(px)
        grid:setTile(px, py, 0, 0)
    end
end



