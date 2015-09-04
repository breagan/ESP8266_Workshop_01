   pin= 7  -- GPIO13
   gpio.mode(pin, gpio.OUTPUT) 
     -- create a server  
    sv=net.createServer(net.TCP, 10) 
    -- server listen on 80, if data received, print data to console, and send "hello world" to remote.
    sv:listen(80,function(conn)
      conn:on("receive", function(conn, pl) 
      payload = pl;
 -----------------------------------------     
      if string.find(pl,"led=on") then
      gpio.write(pin, gpio.HIGH) 
      print("led set to HIGH")
      end
------      
      if string.find(pl, "led=off") then
      gpio.write(pin, gpio.LOW) 
      print("led set to LOW")
      end
----------      
      conn:send("<html />")
      conn:send("<B/>ESP8266 chipID: "..node.chipid())
      conn:send("<br/>Hello world!")
      conn:send("<br />GPIO13: "..gpio.read(pin))
      print(pl)
      conn:close()
      collectgarbage()
         end)
      end)
  print("Server running...")
