hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
	hs.reload()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "l", function()
	hs.caffeinate.lockScreen()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "s", function()
	local screen = hs.screen.mainScreen()
	local max = screen:frame()

	local wins = hs.window.orderedWindows()
	local n = #wins
	if n < 2 then return end

	local left = wins[1]
	local right = wins[2]

	left:setFrame({ x = max.x, y = max.y, w = max.w / 2, h = max.h })
	right:setFrame({ x = max.x + max.w / 2, y = max.y, w = max.w / 2, h = max.h })
end)

hs.alert.show("Hammerspoon config loaded")
