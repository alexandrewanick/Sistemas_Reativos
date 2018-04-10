local w = 200
local h = 150

function naimagem(mx, my, x, y) 
  return (mx>x) and (mx<x+w) and (my>y) and (my<y+h)
end

function retangulo(x, y, w, h)
  local originalx, originaly, rx, ry, rw, rh = x, y, x, y, w, h
  
  return {
    draw =
      function()
        love.graphics.rectangle("line", rx, ry, rw, rh)
      end,
    keypressed = 
      function(key)
        local mx, my = love.mouse.getPosition()
        if key == 'b' and naimagem(mx, my, rx, ry) then
          ry = 200
          rx = 50
        end
      end,
    update =
      function(dt)
        local mx, my = love.mouse.getPosition()
        if love.keyboard.isDown("down") and naimagem(mx, my, rx, ry) then
          ry = ry + 10
        end
        if love.keyboard.isDown("right") and naimagem(mx, my, rx, ry) then
          rx = rx + 10
        end
      end
  }
end

function love.load()
  ret1 = retangulo(50, 200, 200, 150)
end

function love.keypressed(key)
  ret1.keypressed(key)
end

function love.update(dt)
  ret1.update(dt)
end

function love.draw()
  ret1.draw()
end
