wifi.setmode(wifi.STATION)
wifi.sta.config("ESP8266_PI","password")
  print("System Info:  ")
  print(wifi.sta.getip())
     majorVer, minorVer, devVer, chipid, flashid, flashsize, flashmode, flashspeed = node.info();
    print("NodeMCU "..majorVer.."."..minorVer.."."..devVer.."\nFlashsize: "..flashsize.."\nChipID: "..chipid)
    print("FlashID: "..flashid.."\n".."Flashmode: "..flashmode.."\nHeap: "..node.heap())
     -- get file system info
    remaining, used, total=file.fsinfo()
    print("\nFile system info:\nTotal : "..total.." Bytes\nUsed : "..used.." Bytes\nRemain: "..remaining.." Bytes")
    print("\n")
    --dofile("servernode.lua")
    --dofile("nightlight.lua")
    --dofile("mqtt2.lua")
