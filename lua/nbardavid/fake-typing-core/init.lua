local M = {}

local stored_text = ""
local char_idx = 0        -- index en caractères (UTF-8)
local total_chars = 0
local is_active = false
local aug

local function next_char()
  if char_idx >= total_chars then return nil end
  local ch = vim.fn.strcharpart(stored_text, char_idx, 1)
  char_idx = char_idx + 1
  return ch
end

function M.start()
  -- Récupère le texte sélectionné dans "x"
  vim.cmd('normal! "xy')
  stored_text = vim.fn.getreg('x') or ""
  if stored_text == "" then
    vim.notify("Aucun texte sélectionné!", vim.log.levels.WARN)
    return
  end

  -- Supprime la sélection
  vim.cmd('normal! gvd')

  char_idx = 0
  total_chars = vim.fn.strchars(stored_text)
  is_active = true

  -- (Re)crée les autocmd
  aug = vim.api.nvim_create_augroup('fake_typing', { clear = true })

  vim.api.nvim_create_autocmd('InsertCharPre', {
    group = aug,
    callback = function()
      if not is_active then return end
      local ch = next_char()
      if not ch then
        -- Plus rien à insérer : on mange la frappe et on stoppe
        vim.v.char = ''
        M.stop()
        return
      end
      -- Remplace la touche tapée par le prochain caractère
      vim.v.char = ch
    end,
  })

  vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufLeave' }, {
    group = aug,
    callback = function()
      if is_active then M.stop() end
    end,
  })

  vim.cmd('startinsert')
  vim.notify("Fake typing activé. Tape n'importe quoi…", vim.log.levels.INFO)
end

function M.stop()
  is_active = false
  if aug then pcall(vim.api.nvim_del_augroup_by_id, aug); aug = nil end
  vim.notify("Fake typing terminé!", vim.log.levels.INFO)
end

return M
