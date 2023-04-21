return {
    "lervag/vimtex",
    init = function()
        vim.g.vimtex_compiler_latexmk = {
            build_dir = "./.build",
            options = {
                "-outdir=./.build",
                "-pdf",
                '-pdflatex="xelatex -synctex=1 -interaction=nonstopmode -file-line-error"',
                "-shell-escape",
            },
        }
        vim.opt_local.conceallevel = 0
    end,
}
