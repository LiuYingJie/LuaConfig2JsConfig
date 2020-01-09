














local helper = {}






function helper:writeFileData(path,str,model)
    local file = io.open( path, model or "w" )
    if file then
        local content = file:write(str)
        io.close(file)
    end
end


--param tb:table
--param show_tab:是否显示\t
--param tab_num:\t的数量
function helper:toString(tb,show_tab,tab_num)

    if tb == nil then
        return "nil"
    elseif type(tb) ~= "table" then
        return tostring(tb)
    end

    local function getTabNum(n)
        local tab = {}
        for i = 1,n do
            table.insert(tab,"    ")
        end
        return table.concat(tab)
    end
    local str = {}
    if tab_num == nil then
        tab_num = 0
    end
    table.insert(str,"{")
    if show_tab then
        table.insert(str,"\n")
    end
    for key,val in pairs(tb) do

        local val_type = type(val)
        local key_type = type(key)

        if show_tab  then
            table.insert(str,getTabNum(tab_num+1))
        end

        table.insert(str,"[")
        if key_type == "string" then
            table.insert(str,"\"")
        end
        table.insert(str,key)
        if key_type == "string" then
            table.insert(str,"\"")
        end
        table.insert(str,"]")
        table.insert(str,"=")

        if val_type == "table" then
            table.insert(str,self:toString(val,show_tab,tab_num+1))
        elseif val_type == "boolean" then
            if val then
                table.insert(str,"true")
            else
                table.insert(str,"false")
            end
        elseif val_type == "nil" then--?a??¨°2??¨º2?¡ä¨®?
            table.insert(str,"nil")
        elseif val_type == "string" then
            table.insert(str,"\"")
            table.insert(str,val)
            table.insert(str,"\"")
        elseif val_type == "function" then--?a??¨°2??¨º2?¡ä¨®?
--            table.insert(str,"\"")
--            table.insert(str,string.dump(val))
--            table.insert(str,"\"")
        elseif val_type == "userdata" then
            table.insert(str,"userdata")
        else
            table.insert(str,val)
        end

        table.insert(str,",")
        if show_tab then
            table.insert(str,"\n")
        end
    end

    if show_tab  then
        table.insert(str,getTabNum(tab_num))
    end

    table.insert(str,"}")
    return table.concat(str)
end

















return helper


































