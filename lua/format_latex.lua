function FormatLatex()
    local file_path = vim.api.nvim_buf_get_name(0)
    local cmd = "latexindent -w -s -y=defaultIndent:'  ' " .. file_path

    local output = vim.fn.system(cmd)
    local success = vim.v.shell_error == 0

    if not success then
        vim.api.nvim_echo({ { "Error: Failed to format LaTeX file using latexindent.", "ErrorMsg" } }, true, {})
        vim.api.nvim_echo({ { "Output: " .. output, "ErrorMsg" } }, true, {})
        return
    end

    vim.api.nvim_command("edit!") -- Reload the buffer to see the changes
    vim.api.nvim_echo({ { "LaTeX file formatted using latexindent.", "Normal" } }, true, {})
end

-- Create an autocmd for formatting LaTeX files on save
vim.api.nvim_exec(
    [[
  augroup latex_format_on_save
    autocmd!
    autocmd BufWritePre *.tex,*.latex lua FormatLatex()
  augroup END
]],
    false
)
