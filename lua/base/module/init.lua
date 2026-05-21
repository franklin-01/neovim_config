local function new()
    local m = {}
    m.__index = m

    return m
end

return new()
