local inventory_manager = {}

function inventory_manager.draw_item_at(tile, x, y)
  local item = items[tile.item]
  love.graphics.draw(item.sprite, (x-1)*32, (y-1)*32)
end

function inventory_manager.collect_item(tile)
  local inventory = inventory_manager.get_inventory()
  if #inventory < 25 then
    local item = items[tile.item]
    item.location = "inventory"
    tile.item = nil
    log.add_message("You found a "..item.name.."!")
    sfx_manager.pick_up()
    table.sort(items, function(a, b) return a.name < b.name end)
  else
    log.add_message("Your inventory is full!")
  end
end

function inventory_manager.get_inventory()
  local result = {}
  for _, item in ipairs(items) do
    if item.location == "inventory" then
      table.insert(result, item)
    end
  end
  return result
end

function inventory_manager.render_inventory()
  slots = {}

  local cols = 5
  local rows = 5

  local inventory = inventory_manager.get_inventory()
  local inventory_slot = 1
  local slot_id = 1

  y = 110
  for r = 1, rows do
    x = 554
    for c = 1, cols do

      if inventory_slot <= #inventory then
        local item = inventory[inventory_slot]
        tab_manager.inv_slot(x, y, item)
        table.insert(slots, {id = slot_id, item = item})
      else
        tab_manager.inv_slot(x, y, false)
      end
      x = x + 90
      inventory_slot = inventory_slot + 1
      slot_id = slot_id + 1
    end
    y = y + 90
  end
end

function inventory_manager.use_item(slot_index)
  log.add_message("Left click ".. slot_index)
end

function inventory_manager.discard_item(slot_index)
  log.add_message("Right click ".. slot_index)
end

function inventory_manager.handle_inventory_click(x, y, button)
  local grid_start_x = 554
  local grid_start_y = 110
  local slot_size = 90
  local slots_per_row = 5
  local slots_per_col = 5
  local inventory = inventory_manager.get_inventor()
  
  if x >= grid_start_x and x <= grid_start_x + (slots_per_row * slot_size) and
     y >= grid_start_y and y <= grid_start_y + (slots_per_col * slot_size) then
    
    local slot_x = math.floor((x - grid_start_x) / slot_size)
    local slot_y = math.floor((y - grid_start_y) / slot_size)
    local slot_index = (slot_y * slots_per_row) + slot_x + 1  -- +1 for 1-based indexing
    
    if inventory[slot_index] then
      if button == 1 then  -- Left click = use
        inventory_manager.use_item(slot_index)
      elseif button == 2 then  -- Right click = discard
        inventory_manager.discard_item(slot_index)
      end
    end
  end
end

return inventory_manager