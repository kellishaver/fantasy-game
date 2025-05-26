local inventory_manager = {}

function inventory_manager.collect_item(tile)
  item = items[tile.item]
  item.location = "inventory"
  tile.item = nil
  log.add_message("You found a "..item.name.."!")

  table.sort(items, function(a, b) return a.name < b.name end)
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

return inventory_manager