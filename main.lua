image = display.newImage("Red1.png")

clicks = {}
lines = {}

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
		
		table.insert(lines, line)
		
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

function undo(event)
	
	if #clicks > 0 then
	
		table.remove(clicks, #clicks)
	
		if #lines > 0 then
	
			lines[#lines]:removeSelf()
	
			table.remove(lines, #lines)
	
		end
		
	end
	
end

local btnUndo = display.newImage("btn_undo.png")
btnUndo.x = 220
btnUndo.y = 80
btnUndo:addEventListener("tap", undo)

function reset(event)
	
	clicks = {}
	
	for i = 1, #lines do
		lines[i]:removeSelf()
	end
	
	lines = {}
	
end

local btnReset = display.newImage("btn_reset.png")
btnReset.x = 120
btnReset.y = 80
btnReset:addEventListener("tap", reset)