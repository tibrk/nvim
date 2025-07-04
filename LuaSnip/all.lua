local helpers = require 'helper_functions.luasnip'
local get_date = helpers.get_ISO_8601_date
local get_visual = helpers.get_visual

local tex = {}
tex.in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex.in_text = function()
  return not tex.in_mathzone()
end

-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match '^%s*$'
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match '[ :`=%{%(%["]'
  return line_begin or non_letter
end

return {
  s(
    { trig = '"', wordTrig = false, snippetType = 'autosnippet', priority = 2000 },
    fmta('"<>"', {
      d(1, get_visual),
    }),
    { condition = line_begin_or_non_letter }
  ),
  -- Paired single quotes
  s(
    { trig = "'", wordTrig = false, snippetType = 'autosnippet', priority = 2000 },
    fmta("'<>'", {
      d(1, get_visual),
    }),
    { condition = line_begin_or_non_letter }
  ),
  -- Today's date in YYYY-MM-DD (ISO 8601) format
  s(
    { trig = 'iso' },
    { f(get_date) }
    -- {f(get_ISO_8601_date)}
  ),
  -- Curly braces
  s(
    { trig = 'fds', snippetType = 'autosnippet' },
    fmta(
      [[
        {
          <>
        }
        ]],
      { d(1, get_visual) }
    )
  ),
  -- Square braces
  s(
    { trig = 'gds', snippetType = 'autosnippet' },
    fmta(
      [[
        [
          <>
        ]
        ]],
      { d(1, get_visual) }
    )
  ),
}
