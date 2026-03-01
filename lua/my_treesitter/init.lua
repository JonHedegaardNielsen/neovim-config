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
  			-- 'typescript',
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
    local parsers = {
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
	     'python',
	  'vue',
			'tsx',
			'jsx'
    }
    require('nvim-treesitter').install(parsers)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function(args)
		local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then return end

          -- check if parser exists and load it
          if not vim.treesitter.language.add(language) then return end
          -- enables syntax highlighting and other treesitter features
          vim.treesitter.start(buf, language)

          -- enables treesitter based folds
          -- for more info on folds see `:help folds`
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'

          -- enables treesitter based indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
