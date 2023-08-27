local wallpapers = {
  [1] = "~/Pictures/Wallpaper/wall.png",
  ["Chrome"] = "~/Pictures/Wallpaper/abstract-planet-space-purple-wallpaper-preview.jpg",
  ["Terminal"] = "~/Pictures/Wallpaper/ubuntu-lucid-wallpaper-preview.jpg",
  ["Others"] = "~/Pictures/Wallpaper/wall.png",
  -- Add more wallpapers for each tag here
}

for i, tag in ipairs(s.tags) do
  if wallpapers[tag.name] then
    tag:connect_signal("property::selected", function()
      if tag.selected then
        -- Set wallpaper for selected tag
        gears.wallpaper.maximized(wallpapers[tag.name], s)
      end
    end)
  else
    -- Set default wallpaper if no specific wallpaper is defined for the tag
    tag:connect_signal("property::selected", function()
      if tag.selected then
        -- Set default wallpaper for selected tag
        gears.wallpaper.maximized("~/Pictures/Wallpaper/wall.png", s)
      end
    end)
  end
end

for i, t in ipairs(s.tags) do
  if beautiful.wallpaper[t.name] then
    gears.wallpaper.maximized(beautiful.wallpaper[t.name], s, false)
  end
end


for i, t in ipairs(s.tags) do
  if wallpaper_path[t.name] then
    return wallpaper_path[t.name]
  else
    return wallpaper_path["tag2"]
  end
end


for tag, wallpaper in pairs(wallpaper_path) do
  awful.tag.attached_connect_signal(1, "property::selected", function()
    local focused = awful.screen.focused()

    if focused.selected_tag.name == tag then
      theme.wallpaper = wallpaper
      theme.wallpaper_cmd = { "feh", "--bg-fill", wallpaper }
      os.execute("feh --bg-fill " .. wallpaper)
    end
  end)
end


local tag_name = awful.tag.selected().name
local try = "my try"
if tag_name == nil then
  awful.spaw.with_shell("echo my_tags_is_nil > ~/lualog")
else
  awful.spawn.with_shell("echo tag_name: " .. tag_name .. " > ~/lualog")
end

local tags_array = {}

for _, t in ipairs(awful.screen.focused().tags) do
  table.insert(tags_array, t.name)
end

local wallpapers = {
  [1] = "~/Pictures/Wallpaper/ubuntu-lucid-wallpaper-preview.jpg",
  [2] = "~/Pictures/Wallpaper/abstract-planet-space-purple-wallpaper-preview.jpg",
  [3] = "~/Pictures/Wallpaper/wall.png",
  [4] = "~/Pictures/Wallpaper/autumn-forest-wallpaper.1920x1080.jpg"
  -- продолжайте для каждого тага
}

-- Установите обои для каждого тага
awful.screen.connect_for_each_screen(function(s)
  for i, tag in ipairs(tags_array) do
    if wallpapers[i] then
      awful.spawn.with_shell("echo " .. wallpapers[i] .. " >> ~/lualog")
    else
      awful.spawn.with_shell("echo wallpapers is ended index is " .. i .. " >> ~/lualog")
    end
  end
end)
