
local function has_class(el, class)
  if el.classes ~= nil then
    for _,v in ipairs(el.classes) do
      if v == class then
        return true
      end
    end
  end
  
  return false
end

local function get_attribute_val(el, attribute)
  if el.attributes ~= nil then
    for k,v in pairs(el.attributes) do
      if k == attribute then
        return v
      end
    end
  end
  
  return nil
end

function Div(el)
  -- check for the presence of "cell-code" inside a "cell"
  local echoed_code_cell = has_class(el, "cell") and has_class(el.content[1], "cell-code")
  local format_condition = get_attribute_val(el, "no-echo-when-format")
  -- check whether the format of "no-echo-when-format" is the same as the doc format
  local matching_format = quarto.doc.is_format(tostring(format_condition))
  if echoed_code_cell and matching_format then
    -- remove the echoed "cell-code" part of the "cell"
    el.content:remove(1)
  end
  return(el)
end


