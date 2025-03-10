local _M = {
   terminal    = 'kitty',
   editor      = 'nvim',
   browser     = 'zen',
   nitrogen    = 'nitrogen',
   files       = 'thunar',
   vscode      = 'code'
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
