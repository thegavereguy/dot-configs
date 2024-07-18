vim.api.nvim_command('colorscheme horizon')

local Command = vim.api.nvim_command

Command('hi Pmenu guibg=#0f1a2b guifg=#ffffff') -- colore sfondo menù completamento, questo cambia anche il testo per suggerimenti nel terminale
Command('hi PmenuThumb guibg=#79a1e0') -- colore indicatore scrollbar menù a tendina

Command('hi CmpItemAbbrDefault guifg=#ffffff') -- colore testo primario 

Command('hi CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080') -- colore elemento deprecato

Command('hi CmpItemAbbrMatch guibg=NONE guifg=#569CD6') -- colore caratteri corrispondeti 
Command('hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6') -- stessa roba ma solo per la ricerca

Command('hi CmpItemKindVariable guibg=NONE guifg=#9CDCFE') -- colore tipo variabile 
Command('hi CmpItemKindInterface guibg=NONE guifg=#9CDCFE') -- colore tipo interfaccia
Command('hi CmpItemKindText guibg=NONE guifg=#9CDCFE') -- colore tipo testo
Command('hi CmpItemKindFunction guibg=NONE guifg=#C586C0') -- colore tipo funzione
Command('hi CmpItemKindMethod guibg=NONE guifg=#C586C0') -- colore tipo metodo
Command('hi CmpItemKindKeyword guibg=NONE guifg=#D4D4D4') -- colore tipo parola chiave
Command('hi CmpItemKindProperty guibg=NONE guifg=#D4D4D4') -- colore tipo proprietà
Command('hi CmpItemKindUnit guibg=NONE guifg=#D4D4D4') -- colore tipo unità

Command('hi DiagnosticUnderlineWarn gui=underline') -- colore tipo unità
Command('hi DiagnosticUnderlineError gui=underline') -- colore tipo unità
Command('hi DiagnosticUnderlineHint gui=underline') -- colore tipo unità
Command('hi DiagnosticUnderlineInfo gui=underline') -- colore tipo unità

Command('hi FloatBorder guifg=#ffffff')

Command('hi LspDiagnosticsVirtualTextHint guifg=#ffffff') -- colore testo suggerimento
Command('hi DiagnosticsVirtualTextHint guifg=#ffffff') -- colore testo suggerimento
