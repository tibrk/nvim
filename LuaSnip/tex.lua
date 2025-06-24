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
function line_begin(line_to_cursor, matched_trigger)
  return line_to_cursor:sub(1, -(#matched_trigger + 1)):match '^%s*$'
end
-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match '[ :`=%{%(%["]'
  return line_begin(line_to_cursor, matched_trigger) or non_letter
end

return {
  -- em dash
  s({ trig = '---', wordTrig = false }, { t '—' }),
  -- Lorem ipsum
  s(
    { trig = 'lipsum' },
    fmta(
      [[
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        ]],
      {}
    )
  ),
  -- ANNOTATE (custom command for annotating equation derivations)
  s(
    { trig = 'ann', snippetType = 'autosnippet' },
    fmta(
      [[
      \annotate{<>}{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
      }
    )
  ),
  -- REFERENCE
  s(
    { trig = ' RR', snippetType = 'autosnippet', wordTrig = false },
    fmta(
      [[
      ~\ref{<>}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  -- DOCUMENTCLASS
  s(
    { trig = 'dcc', snippetType = 'autosnippet' },
    fmta(
      [=[
        \documentclass[<>]{<>}
        ]=],
      {
        i(1, 'a4paper'),
        i(2, 'article'),
      }
    ),
    { condition = line_begin }
  ),
  -- USE A LATEX PACKAGE
  s(
    { trig = 'pack', snippetType = 'autosnippet' },
    fmta(
      [[
        \usepackage{<>}
        ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- INPUT a LaTeX file
  s(
    { trig = 'inn', snippetType = 'autosnippet' },
    fmta(
      [[
      \input{<><>}
      ]],
      {
        i(1, '~/dotfiles/config/latex/templates/'),
        i(2),
      }
    ),
    { condition = line_begin }
  ),
  -- LABEL
  s(
    { trig = 'lbl', snippetType = 'autosnippet' },
    fmta(
      [[
      \label{<>}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  -- ACRONYM
  s(
    { trig = 'ac', snippetType = 'autosnippet' },
    fmta(
      [[
      \ac{<>}
      ]],
      {
        i(1, 'acronym'),
      }
    )
  ),
  s(
    { trig = 'nac', snippetType = 'autosnippet' },
    fmta(
      [[
      \acro{<>}[<>]{<>}      ]],
      {
        i(1, 'acronym'),
        i(2, 'short'),
        i(3, 'long'),
      }
    )
  ),
  -- HPHANTOM
  s(
    { trig = 'hpp', snippetType = 'autosnippet' },
    fmta(
      [[
      \hphantom{<>}
      ]],
      {
        d(1, get_visual),
      }
    )
  ),
  s(
    { trig = 'TODOO', snippetType = 'autosnippet' },
    fmta([[\TODO{<>}]], {
      d(1, get_visual),
    })
  ),
  s(
    { trig = 'nc' },
    fmta([[\newcommand{<>}{<>}]], {
      i(1),
      i(2),
    }),
    { condition = line_begin }
  ),
  s(
    { trig = 'sii', snippetType = 'autosnippet' },
    fmta([[\si{<>}]], {
      i(1),
    })
  ),
  s(
    { trig = 'qtt' },
    fmta([[\qty{<>}{<>}]], {
      i(1),
      i(2),
    })
  ),
  -- URL
  s(
    { trig = 'url' },
    fmta([[\url{<>}]], {
      d(1, get_visual),
    })
  ),
  -- href command with URL in visual selection
  s(
    { trig = 'LU', snippetType = 'autosnippet' },
    fmta([[\href{<>}{<>}]], {
      d(1, get_visual),
      i(2),
    })
  ),
  -- href command with text in visual selection
  s(
    { trig = 'LL', snippetType = 'autosnippet' },
    fmta([[\href{<>}{<>}]], {
      i(1),
      d(2, get_visual),
    })
  ),
  -- HSPACE
  s(
    { trig = 'hss', snippetType = 'autosnippet' },
    fmta([[\hspace{<>}]], {
      d(1, get_visual),
    })
  ),
  -- VSPACE
  s(
    { trig = 'vss', snippetType = 'autosnippet' },
    fmta([[\vspace{<>}]], {
      d(1, get_visual),
    })
  ),
  -- SECTION
  s(
    { trig = 'h1', snippetType = 'autosnippet' },
    fmta([[\section{<>}]], {
      d(1, get_visual),
    })
  ),
  -- SUBSECTION
  s(
    { trig = 'h2', snippetType = 'autosnippet' },
    fmta([[\subsection{<>}]], {
      d(1, get_visual),
    })
  ),
  -- SUBSUBSECTION
  s(
    { trig = 'h3', snippetType = 'autosnippet' },
    fmta([[\subsubsection{<>}]], {
      d(1, get_visual),
    })
  ),
  s({ trig = 'q' }, {
    t '\\quad ',
  }),
  s({ trig = 'qq', snippetType = 'autosnippet' }, {
    t '\\qquad ',
  }),
  s({ trig = 'npp', snippetType = 'autosnippet' }, {
    t { '\\newpage', '' },
  }, { condition = line_begin }),
  s({ trig = 'which', snippetType = 'autosnippet' }, {
    t '\\text{ for which } ',
  }, { condition = tex.in_mathzone }),
  s({ trig = 'all', snippetType = 'autosnippet' }, {
    t '\\text{ for all } ',
  }, { condition = tex.in_mathzone }),
  s({ trig = 'and', snippetType = 'autosnippet' }, {
    t '\\quad \\text{and} \\quad',
  }, { condition = tex.in_mathzone }),
  s({ trig = 'forall', snippetType = 'autosnippet' }, {
    t '\\text{ for all } ',
  }, { condition = tex.in_mathzone }),
  s({ trig = 'toc', snippetType = 'autosnippet' }, {
    t '\\tableofcontents',
  }, { condition = line_begin }),
  s({ trig = 'inff', snippetType = 'autosnippet' }, {
    t '\\infty',
  }),
  s({ trig = 'ii', snippetType = 'autosnippet' }, {
    t '\\item ',
  }, { condition = line_begin }),
  s({ trig = '--', snippetType = 'autosnippet' }, { t '% --------------------------------------------- %' }, { condition = line_begin }),
  -- HLINE WITH EXTRA VERTICAL SPACE
  s({ trig = 'hl' }, { t '\\hline {\\rule{0pt}{2.5ex}} \\hspace{-7pt}' }, { condition = line_begin }),
  -- GENERIC ENVIRONMENT
  s(
    { trig = 'new', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  -- ENVIRONMENT WITH ONE EXTRA ARGUMENT
  s(
    { trig = 'n2', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{<>}{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        d(3, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  -- ENVIRONMENT WITH TWO EXTRA ARGUMENTS
  s(
    { trig = 'n3', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{<>}{<>}{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        i(3),
        d(4, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  -- EQUATION
  s(
    { trig = 'nn', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
  -- SPLIT EQUATION
  s(
    { trig = 'ss', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{equation*}
            \begin{split}
                <>
            \end{split}
        \end{equation*}
      ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),
  -- ALIGN
  s(
    { trig = 'all', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{align*}
            <>
        \end{align*}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
  -- ITEMIZE
  s(
    { trig = 'itt', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{itemize}

            \item <>

        \end{itemize}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- ENUMERATE
  s(
    { trig = 'enn', snippetType = 'autosnippet' },
    fmta(
      [[
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
      {
        i(0),
      }
    )
  ),
  -- INLINE MATH
  s(
    { trig = '([^%l])mm', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('<>$<>$', {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  -- INLINE MATH ON NEW LINE
  s(
    { trig = '^mm', regTrig = true, wordTrig = false, snippetType = 'autosnippet' },
    fmta('$<>$', {
      i(1),
    })
  ),
  -- FIGURE
  s(
    { trig = 'fig' },
    fmta(
      [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    ),
    { condition = line_begin }
  ),
}
