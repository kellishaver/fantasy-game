local tab_manager = {
  active_tab = "inv.",
  tab_count = 4,
  tabs = {
    {name = "inv.", x = nil, y = 10, w = 100, h = 30},
    {name = "combat", x = nil, y = 10, w = 100, h = 30},
    {name = "quests", x = nil, y = 10, w = 100, h = 30},
    {name = "char.", x = nil, y = 10, w = 100, h = 30},
  }
}

function tab_manager.draw_tab_interface()
  local tab_x = 422
  local prev_x = tab_x
  local tab_w = 100
  for i = 1, tab_manager.tab_count do
    tab = tab_manager.tabs[i]

    prev_x = tab_x
    tab_x = prev_x + tab_w + 10
    text_x = tab_x + 10

    tab_manager.tabs[i].x = tab_x

    if tab.name == tab_manager.active_tab then
      love.graphics.setColor(1,1,1,0.6)
      love.graphics.rectangle("fill", tab_x,10, tab_w,30, 4,4)
      love.graphics.setColor(0, 0, 0)
    else
      love.graphics.setColor(0,0,0,0.6)
      love.graphics.rectangle("fill", tab_x,10, tab_w,30, 4,4)
      love.graphics.setColor(1, 1, 1)
    end
    love.graphics.print(tab.name, font, text_x, 15)
  end
  love.graphics.setColor(0, 0, 0, 0.6)
  love.graphics.rectangle("fill", 532,50, 484,520, 4,4)
end

function tab_manager.click_tab(x, y)
  for i = 1, tab_manager.tab_count do
    tab = tab_manager.tabs[i]
    x_min = tab.x
    x_max = x_min + tab.w

    y_min = tab.y
    y_max = y_min + tab.h

    if x >= x_min and x <= x_max and y >= y_min and y <= y_max then
      tab_manager.active_tab = tab.name
    end
  end
end

function tab_manager.show_combat_tab()
  love.graphics.print("COMBAT", font, 554, 66)
end

function tab_manager.show_inventory_tab()
  love.graphics.print("INVENTORY", font, 554, 66)
  inventory_manager.render_inventory()
end

function tab_manager.show_quests_tab()
  love.graphics.print("QUESTS", font, 554, 66)
end

function tab_manager.show_character_tab()
  love.graphics.print("CHARACTER", font, 554, 66)
end

function tab_manager.inv_slot(x,y, item)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", x,y, 80,80, 8,8)
  love.graphics.setColor(1, 1, 1, 0.6)
  love.graphics.rectangle("line", x,y, 80,80, 8,8)

  if item then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(item.sprite, x+8, y+8, 0, 2,2)
  end
end

return tab_manager