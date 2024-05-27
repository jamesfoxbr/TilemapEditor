function startCanvas(color)
    love.graphics.setCanvas(canvas)
    love.graphics.clear(0, 0.5, 0) -- Background color
    love.graphics.setDefaultFilter("nearest", "nearest")
end

function endCanvas()
    love.graphics.setCanvas()
    local maxScaleX = love.graphics.getWidth() / canvas:getWidth()
    local maxScaleY = love.graphics.getHeight() / canvas:getHeight()
    local scale = math.min(maxScaleX, maxScaleY)
    love.graphics.draw(canvas, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, scale, scale, canvas:getWidth() / 2, canvas:getHeight() / 2)
end