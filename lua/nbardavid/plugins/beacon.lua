return {
    'danilamihailov/beacon.nvim',
    opts = {
        enabled = true,            -- Active/désactive le plugin
        speed = 2,                 -- Vitesse de l'animation
        width = 40,                -- Largeur du halo
        winblend = 70,             -- Transparence initiale
        fps = 60,                  -- Fluidité de l'animation
        min_jump = 10,             -- Nombre de lignes considérées comme un "saut"
        cursor_events = { 'CursorMoved' },  -- Événements qui déclenchent le beacon
        window_events = { 'WinEnter', 'FocusGained' }, -- Événements de fenêtre qui déclenchent
        highlight = { bg = 'white', ctermbg = 15 },    -- Style du highlight
    },
}
