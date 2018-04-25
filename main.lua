-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Wendi Yu
-- Created on: Apr 2018
--
-- Calculate PI
-----------------------------------------------------------------------------------------

local result = display.newText( "", 700, 770, native.systemFont, 80 )

local instruction1 = display.newText( "What number of iteration you want to choose?", 1000, 350, native.systemFont, 90 )

local numberTextField = native.newTextField( display.contentCenterX - 550 , display.contentCenterY - 200 , 550, 100)
numberTextField.id = "number"

local enterButton = display.newImageRect("./assets/sprites/enterButton.png", 500, 157 )
enterButton.x = display.contentCenterX + 500
enterButton.y = display.contentCenterY - 180
enterButton.id = "enter button"

local function onButtonTouched( event )
    if ( event.phase == "ended" ) then
       print( "Touch event ended on: " .. event.target.id )
   
    end
    
    return true
end

local function calculatePi ( event )
    local numberUser = tonumber(numberTextField.text)
    local answer = 0.0
    local pi = 0
    local initial = 0
    
    if (numberUser < 0 ) then
		result.text = ("Please, put a positive integer number!")
     elseif (numberUser > 0 ) then
		repeat
			answer = answer + ((-1)^initial/((2*initial)+1))
			initial = initial + 1
		until numberUser == initial
			result.text = (" PI is "..answer*4)
     else
		result.text = ("Pleasse, put a digit!")
	end		
end

enterButton:addEventListener( "touch", onButtonTouched )
enterButton:addEventListener( "touch", calculatePi )
