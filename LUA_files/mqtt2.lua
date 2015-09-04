pin= 7  -- GPIO13
gpio.mode(pin, gpio.OUTPUT)

m = mqtt.Client(wifi.sta.getmac(), 120, "", "")
--m:lwt("/lwt", wifi.sta.getmac(), 0, 0)
--m:on("offline", function(con) 
--     print ("reconnecting...") 
--     print(node.heap())
--     tmr.alarm(1, 10000, 0, function()
      --    m:connect("192.168.10.1", 1883, 0)
--     end)
--end)
-- on publish message receive event
m:on("message", function(conn, topic, data) 
  print(topic .. ":" ) 
  if data ~= nil then
    print(data)
             if topic == "LED_Status" and data == "ON" then
               gpio.write(pin, gpio.HIGH) 
             else
               gpio.write(pin, gpio.LOW)  
             end  
  end
end)

tmr.alarm(0, 1000, 1, function()
 if wifi.sta.status() == 5 then
     tmr.stop(0)
     m:connect("192.168.10.1", 1883, 0, function(conn) 
          print("connected")
          m:subscribe("LED_Status",0, function(conn) 
          m:publish("ADC","ChipID: "..node.chipid().." ONLINE !!",0,0, function(conn) print("sent") end)
          end)
         
     tmr.alarm(2, 5000, 1, function()
          adcval = adc.read(0)
          m:publish("ADC","ChipID: "..node.chipid().." ADC: "..adcval,0,0, function(conn) 
          print("sent "..adcval) end)

     end)
    end)
 end
end)

