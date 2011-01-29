image = display.newImage("Red1.png")

clicks = {}

function tap(event)
	
	local click = {}
	
	click.x = (event.x - image.x)
	click.y = (event.y - image.y)
	
	table.insert(clicks, click)
	
	local log = "{ "
	
	for i = 1,#clicks do
		
		log = log .. clicks[i].x .. "," .. clicks[i].y .. ", "
		
	end
	
	log = log .. " }"
	
	if #clicks > 1 then
	
		local line = display.newLine(event.x, event.y, clicks[#clicks-1].x + image.x, clicks[#clicks-1].y + image.y)
		line:setColor( 255, 255, 255, 255 )
		line.width = 2
	
	end
	
	print(log)
	
end

image.x = 160
image.y = 240

local myRectangle = display.newRect(image.x - image.width / 2, image.y - image.height / 2, image.width, image.height)
myRectangle.strokeWidth = 3
myRectangle:setFillColor(140, 140, 140)
myRectangle:setStrokeColor(180, 180, 180)

image:addEventListener("tap", tap)
image:toFront()