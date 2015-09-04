--  Nightlight script

pin= 7  -- GPIO13
gpio.mode(pin, gpio.OUTPUT)     	-- sets GPIO13 
triggerlevel = 350              	-- sets the level that turns LED on 0-1024   
print("Nightlight running...")  	-- debug

tmr.alarm(1, 500, 1, function() 	-- script loops every half second 500ms
local ADClevel = adc.read(0)    	-- Reads ADC PIN
print("ADC: "..ADClevel)        	-- debug
  if ADClevel < triggerlevel then 	-- if,then turn GPIO on/off based on
     gpio.write(pin, gpio.HIGH)     -- ADC reading 0-1024 
   --  print("led on")                -- debug   
  else                            	-- turns GPIO off if condition not true   
     gpio.write(pin, gpio.LOW)
   --  print("led off")
  end
  collectgarbage()
  end ) 

