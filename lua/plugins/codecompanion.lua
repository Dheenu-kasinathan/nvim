return {
    'olimorris/codecompanion.nvim',
    cmd = 'CodeCompanion',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },

    config = function()
        require('codecompanion').setup {
            adapters = {
                openai = function()
                    return require('codecompanion.adapters').extend('openai', {
                        env = {
                            api_key = 'OPENAI_API_KEY',
                            -- model = 'gemini-2.0-pro-exp-02-05',
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = 'openai',
                },
                inline = {
                    adapter = 'openai',
                },
            },
            log_level = 'DEBUG',
        }

        local keymap = vim.keymap

        keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat<CR>', { desc = 'Open Code Companion Chat' })
        keymap.set('n', '<leader>ci', '<cmd>CodeCompanion<CR>', { desc = 'Open Code Companion Inline' })
    end,
}
