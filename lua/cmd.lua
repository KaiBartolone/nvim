-- Prints full filepath of current buffer
vim .api.nvim_create_user_command('Sneeze', '!echo %:p', {})
