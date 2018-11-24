local Lib = {}

-- IN RECTANGLE --
function Lib.inRectangle(x, y)
    return function(UpperX, UpperY, LowerX, LowerY)
        return (x >= UpperX and x <= LowerX) and (y >= UpperY and y <= LowerY)
    end
end

-- STRING SPLIT --> RETURN ARRAY TABLE --
function Lib.splitstring(s, delimiter)
    local result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

-- TABLE LENGTH --
function Lib.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

-- LOG 1 TIME ONLY --
Lib.LastMessage = ""
function Lib.log1time(msg)
    if Lib.LastMessage == msg then
    else
        log(msg)
        Lib.LastMessage = msg
    end
end

function Lib.ifNotThen(anything, call)
    if not anything then
        return call()
    end
end

function Lib.pairsByKeys(t, f) -- sort table keys by alpha order or f as alternative order.
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end

-- CHECK IF IN TABLE --
function Lib.inTable(tab, val)
   for index, value in ipairs(tab) do
       if value == val then
           return true
       end
   end
   return false
end

return Lib
