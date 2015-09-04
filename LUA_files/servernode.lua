   -- create a server
    sv=net.createServer(net.TCP, 10) 
    -- server listen on 80, if data received, print data to console, and send "hello world" to remote.
    sv:listen(80,function(conn)
      conn:on("receive", function(conn, pl) 
      payload = pl;
      conn:send("<html />")
      conn:send("<B/>ESP8266 chipID: "..node.chipid())
      conn:send("<br/>Hello world!")
      conn:send("<br />ADC: "..adc.read(0))
      print(pl)
      collectgarbage()
      conn:close()
         end)
      end)
  print("Server running...")
