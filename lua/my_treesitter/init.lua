return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter', -- Sets main module to use for opts
  branch = 'main',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			'gdscript',
  -- 			'godot_resource',
  -- 			'gdshader',
  -- 			'bash',
  -- 			'c',
  -- 			'c_sharp',
  -- 			'diff',
  -- 			'html',
  -- 			'xml',
  -- 			'css',
  -- 			'lua',
  -- 			'luadoc',
  -- 			'markdown',
  -- 			'markdown_inline',
  -- 			'query',
  -- 			'vim',
  -- 			'vimdoc',
  -- 			'json',
  -- 			'xml',
  -- 			'javascript',
  -- 			'typescript',
  -- 			'tsx',
  -- 		},
  -- 		-- Autoinstall languages that are not installed
  -- 		auto_install = true,
  -- 		highlight = {
  -- 			enable = true,
  --
  -- 			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
  -- 			--  If you are experiencing weird indenting issues, add the language to
  -- 			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
  -- 			additional_vim_regex_highlighting = { 'ruby' },
  -- 		},
  -- 		incremental_selection = {
  -- 			enable = false,
  -- 		},
  -- 		indent = { enable = true, disable = { 'ruby' } },
  -- 	},
  -- 	-- There are additional nvim-treesitter modules that you can use to interact
  -- 	-- with nvim-treesitter. You should go explore a few and see what interests you:
  -- 	--
  -- 	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- 	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- 	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  config = function()
    local filetypes = {
      'gdscript',
      'godot_resource',
      'gdshader',
      'bash',
      'c',
      'c_sharp',
      'diff',
      'html',
      'xml',
      'css',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'vim',
      'vimdoc',
      'json',
      'xml',
      'javascript',
      'typescript',
      'tsx',
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
