hyper = {"cmd", "alt", "ctrl"}
shift_hyper = {"cmd", "alt", "ctrl", "shift"}
ctrl_cmd = {"cmd", "ctrl"}

hs.loadSpoon("SpoonInstall")

-- Reload configuration when this file changes
spoon.SpoonInstall:andUse(
    "ReloadConfiguration",
    {
        start = true
    }
)

-- Show keyboard shortcuts for current application
spoon.SpoonInstall:andUse(
    "KSheet",
    {
        hotkeys = {
            toggle = { hyper, "/" }
        }
    }
)

-- Window sizing
hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind(hyper, "Return", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.maximized)
end)

-- Defeat paste blocking: https://www.hammerspoon.org/go/#pasteblock
hs.hotkey.bind(
    hyper,
    "V",
    function()
        hs.eventtap.keyStrokes(hs.pasteboard.getContents())
    end
)

hs.alert.show("Config loaded")
