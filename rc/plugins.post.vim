
lua << END
require 'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent    = { enable = true },
  incremental_selection = {
    enable  = true,
    keymaps = {
      init_selection     = 'gnn',
      node_incremental   = 'gA',
      node_decremental   = 'gX',
      scope_incremental  = 'gS'
    }
  },

  textobjects = {
    select = {
      enable = true,
      keymaps = {
        af     = '@function.outer',
        ["if"] = '@function.inner',
        ac     = '@class.outer',
        ic     = '@class.inner',
        ao     = '@object.outer',
        io     = '@object.inner',
        ia     = '@parameter.inner',
        aa     = '@parameter.inner',
      }
    },

    swap = {
      enable = true,
      swap_next = {
        gb = '@parameter.inner',
      },
      swap_previous = {
        gB = '@parameter.inner',
      }
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = '@method',
        ["]f"] = '@function.outer',
        ["]c"] = '@class.outer',
        ["]}"] = '@block.outer',
        ["]z"] = { query = '@fold',  query_group = 'folds' },
        ["]a"] = '@parameter.inner',
        ["]A"] = '@parameter.outer'
      },
      goto_next_end = {
        ["]M"] = '@method',
        ["]F"] = '@function.outer',
        ["]C"] = '@class.outer',
      },
      goto_previous_start = {
        ["[m"] = '@method',
        ["[f"] = '@function.outer',
        ["[c"] = '@class.outer',
        ["[}"] = '@block.outer',
        ["[z"] = { query = '@fold',  query_group = 'folds' },
        ["[a"] = '@parameter.inner',
        ["[A"] = '@parameter.outer'
      },
      goto_previous_end = {
        ["[M"] = '@method',
        ["[F"] = '@function.outer',
        ["[C"] = '@class.outer',
      },
      goto_next = {
      },
      goto_previous = {
      }
    }
  }
}

END

set wildignore^=$HOME/.vim/plugs/*

