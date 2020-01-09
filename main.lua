








local helper = require("helper")
local json = require("json")


local fileConfig = require("fileConfig")


local function main()


    for key,val in pairs(fileConfig) do
        print(val)
        local config = require("configs/" ..val)
        -- print(helper:toString(config,true))
        local str = json:encode(config)
        print(str)
        helper:writeFileData(string.format("./configOutPut/%s.json",val),str)
    end

end
main()



























