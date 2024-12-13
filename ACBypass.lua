local AntiFind = ".PlayerScripts.LocalScript"

for i, v in pairs(getreg()) do
    if type(v) == 'thread' then
        Info = debug.info(v, 1, 's')
        if Info and string.find(Info, AntiFind, 1, true) then
            task.cancel(v)
        end
    elseif type(v) == 'function' then
        Info = debug.getinfo(v).source
        if string.find(tostring(Info), AntiFind, 1, true) then
            hookfunction(v, function()end)
        end
    end
end
