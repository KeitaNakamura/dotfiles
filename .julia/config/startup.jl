using Revise

ENV["JULIA_EDITOR"] = "nvim"

#=
using OhMyREPL
OhMyREPL.Passes.SyntaxHighlighter.add!(
    "neodark",
    let
        scheme = OhMyREPL.Passes.SyntaxHighlighter.ColorScheme()
        OhMyREPL.Passes.SyntaxHighlighter.symbol!(scheme,       OhMyREPL.Crayon(foreground = ( 75, 177, 167)))
        OhMyREPL.Passes.SyntaxHighlighter.comment!(scheme,      OhMyREPL.Crayon(foreground = (101, 133, 149)))
        OhMyREPL.Passes.SyntaxHighlighter.string!(scheme,       OhMyREPL.Crayon(foreground = (225, 130,  84)))
        OhMyREPL.Passes.SyntaxHighlighter.call!(scheme,         OhMyREPL.Crayon(foreground = ( 99, 158, 228)))
        OhMyREPL.Passes.SyntaxHighlighter.op!(scheme,           OhMyREPL.Crayon(foreground = (132, 185, 124)))
        OhMyREPL.Passes.SyntaxHighlighter.keyword!(scheme,      OhMyREPL.Crayon(foreground = (132, 185, 124)))
        OhMyREPL.Passes.SyntaxHighlighter.text!(scheme,         OhMyREPL.Crayon(foreground = :default))
        OhMyREPL.Passes.SyntaxHighlighter.macro!(scheme,        OhMyREPL.Crayon(foreground = (184, 136, 226)))
        OhMyREPL.Passes.SyntaxHighlighter.function_def!(scheme, OhMyREPL.Crayon(foreground = ( 99, 158, 228)))
        OhMyREPL.Passes.SyntaxHighlighter.error!(scheme,        OhMyREPL.Crayon(foreground = (220, 101, 125)))
        OhMyREPL.Passes.SyntaxHighlighter.argdef!(scheme,       OhMyREPL.Crayon(foreground = (212, 174,  88)))
        OhMyREPL.Passes.SyntaxHighlighter.number!(scheme,       OhMyREPL.Crayon(foreground = (220, 101, 125)))
        scheme
    end
)
colorscheme!("neodark")
OhMyREPL.enable_pass!("RainbowBrackets", false)
OhMyREPL.enable_autocomplete_brackets(false)
# OhMyREPL.Passes.BracketHighlighter.setcrayon!(OhMyREPL.Crayon(foreground = (114, 199, 209)))
OhMyREPL.Passes.BracketHighlighter.setcrayon!(OhMyREPL.Crayon(foreground = :default))
OhMyREPL.input_prompt!("❯❯ ", :white)
=#
