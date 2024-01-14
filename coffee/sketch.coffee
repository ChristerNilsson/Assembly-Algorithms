range = _.range
print = console.log
# goldenRatio = (Math.sqrt(5) + 1) / 2

window.setup = -> 
    createCanvas 600,600
    frameRate 5

pol2cart = (r, theta) ->
    theta *= Math.PI / 180
    {x : r * Math.cos(theta), y : r * Math.sin(theta)}

s5 = (n, r) -> 
    result = []
    a = 2
    b = 3
    for i in range n
        result.push ({r : r*i**0.5, t : i*360/(b/a) % 360} )
        [a,b] = [b,a+b]
    result

calculate_coordinates = (n=350, r=15) -> pol2cart(r, t) for {r, t} in s5 n,r
coords = calculate_coordinates()
n = 0

window.draw = ->
    background 'gray'
    n += 1
    if n > coords.length then n = coords.length
    for i in range n
        {x,y} = coords[i]
        fill if i==n-1 then 'black' else 'white'
        circle width/2 + x, height/2 + y, 30
