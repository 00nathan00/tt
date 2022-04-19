local tv = LocalPlayer():GetEyeTrace().Entity
local nwScreen = SimpleRP.config.network.nwScreen


timer.Create("btceur", 5, 0, function()
    http.Fetch("https://blockchain.info/ticker", function(body,,,code)
        local json = util.JSONToTable(body)

        net.Start(nwScreen)
        net.WriteEntity(tv)
        net.WriteString("BTC-EUR\n" .. tostring(json["EUR"].buy) .. "€\nUpdate: ".. os.date("%H:%M:%S"))


        net.WriteColor(Color(math.random(0,255), math.random(0,255), math.random(0,255)))
        net.SendToServer()
    end)
end)