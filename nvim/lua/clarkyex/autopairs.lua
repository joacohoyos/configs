vim.api.nvim_set_var('closetag_filenames', '*.html,*.xhtml,*.phtml,*.jsx,*.tsx,*.jsx')

-- filenames like *.xml, *.xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
--
vim.api.nvim_set_var('closetag_xhtml_filenames', '*.xml,*.xhtml,*.jsx,*.tsx,*.js')

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.
--
vim.api.nvim_set_var('closetag_filetypes', 'html,xhtml,phtml,jsx,tsx,js')

-- filetypes like xml, xhtml, ...
-- This will make the list of non-closing tags self-closing in the specified files.
--
vim.api.nvim_set_var('closetag_xhtml_filetypes', 'xml,xhtml,jsx,tsx,js')

vim.api.nvim_set_var('closetag_regions', {
    ['typescript.tsx'] = 'jsxRegion,tsxRegion',
    ['javascript.jsx'] = 'jsxRegion',
})

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
--
vim.api.nvim_set_var('closetag_emptyTags_caseSensitive', 1)

-- Shortcut for closing tags, default is '>'
--
vim.api.nvim_set_var('closetag_shortcut' ,'>')

-- Add > at current position without closing the current tag, default is ''
--
vim.api.nvim_set_var('closetag_close_shortcut', '<leader>>')
