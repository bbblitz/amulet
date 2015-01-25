-- extra table functions

function table.shallow_copy(t)
    if type(t) ~= "table" then
        error("table expected, but got a "..type(t), 2)
    end
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = v
    end
    return copy
end

local
function deep_copy_2(t, seen)
    local s = seen[t]
    if s then
        return s
    else
        s = {}
        seen[t] = s
        for k, v in pairs(t) do
            if type(k) == "table" then
                k = deep_copy_2(k, seen)
            elseif type(k) == "userdata" then
                error("cannot deep copy userdata values", 3)
            end
            if type(v) == "table" then
                v = deep_copy_2(v, seen)
            elseif type(v) == "userdata" then
                if type(k) == "string" then
                    error("cannot copy userdata value '"..k.."'", 3)
                else
                    error("cannot deep copy userdata values", 3)
                end
            end
            s[k] = v
        end
        return s
    end
end

function table.deep_copy(t)
    if type(t) == "table" then
        return deep_copy_2(t, {})
    else
        error("table expected, but got a "..type(t), 2)
    end
end

function table.search(t, elem)
    for i = 1, #t do
        if t[i] == elem then
            return i
        end
    end
    return nil
end

function table.append(arr1, arr2)
    local i = #arr1 + 1
    for _, v in ipairs(arr2) do
        arr1[i] = v
        i = i + 1
    end
end

function table.clear(t)
    for k, _ in pairs(t) do
        t[k] = nil
    end
end

local
function table_tostring(t, indent)
    local tp = type(t)
    if tp == "table" then
        indent = indent or 4
        local tab = "    "
        local prefix = string.rep(tab, indent)
        local str = "{\n"
        for key, value in pairs(t) do
            local keystr
            if type(key) == "string" then
                keystr = key
            else
                keystr = "[" .. tostring(key) .. "]"
            end
            str = str .. prefix .. tab .. keystr .. " = " .. table_tostring(value, indent + 1) .. ",\n"
        end
        str = str .. prefix .. "}"
        return str
    elseif tp == "string" then
        return '"' .. t:gsub("\"", "\\\"") .. '"'
    else
        return tostring(t)
    end
end

table.tostring = table_tostring

-- extra math functions

function math.cycle(i, by, len)
    return (i + by - 1) % len + 1
end

function math.clamp(x, min, max)
    min = min or 0
    max = max or 1
    if x < min then
        return min
    elseif x > max then
        return max
    else
        return x
    end
end

function math.mix(x, y, a)
    return x * (1 - a) + y * a
end

-- extra string functions

function string.format_vec(v)
    local str = "<"..string.format("%0.2f", v.x)..", "
        ..string.format("%0.2f", v[2])
    if v.z then
        str = str..", "..string.format("%0.2f", v.b)
    end
    if v.w then
        str = str..", "..string.format("%0.2f", v.q)
    end
    str = str..">"
    return str
end

function string.format_mat(m)
    local str = "["
    for row = 1, 4 do
        for col = 1, 4 do
            local elem
            if m[col] then
                elem = m[col][row]
            end
            if elem then
                str = str..string.format("%0.2f", elem)
                if m[col+1] then
                    str = str.."  "
                end
            end
        end
        if m[1][row+1] then
            str = str.."\n "
        end
    end
    str = str.."]"
    return str
end

-- extra builtins

function log(fmt, ...)
    amulet.log(string.format(fmt, ...), false, 2)
end

function log1(fmt, ...)
    amulet.log(string.format(fmt, ...), true, 2)
end

vec2 = math.vec2
vec3 = math.vec3
vec4 = math.vec4
mat2 = math.mat2
mat3 = math.mat3
mat4 = math.mat4
