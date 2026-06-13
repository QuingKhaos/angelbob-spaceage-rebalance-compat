if mods["factorissimo-2-notnotmelon"] then
  -- Unlock factories via trigger tech
  data.raw["technology"]["factory-architecture-t1"].unit = nil
  data.raw["technology"]["factory-architecture-t1"].prerequisites = nil
  data.raw["technology"]["factory-architecture-t1"].research_trigger = {
    type = "craft-item",
    item = "stone",
    count = 1000
  }

  -- Configure factory upgrades as trigger techs
  data.raw["technology"]["factory-interior-upgrade-lights"].unit = nil
  data.raw["technology"]["factory-interior-upgrade-lights"].research_trigger = {
    type = "craft-item",
    item = "small-lamp",
    count = 100
  }

  data.raw["technology"]["factory-interior-upgrade-display"].unit = nil
  data.raw["technology"]["factory-interior-upgrade-display"].prerequisites = {"factory-architecture-t1", "lamp"}
  data.raw["technology"]["factory-interior-upgrade-display"].research_trigger = {
    type = "craft-item",
    item = "small-lamp",
    count = 10
  }

  data.raw["technology"]["factory-connection-type-fluid"].unit = nil
  data.raw["technology"]["factory-connection-type-fluid"].research_trigger = {
    type = "craft-item",
    item = "pipe",
    count = 100
  }

  data.raw["technology"]["factory-connection-type-chest"].unit = nil
  data.raw["technology"]["factory-connection-type-chest"].prerequisites = {"factory-architecture-t1"}
  data.raw["technology"]["factory-connection-type-chest"].research_trigger = {
    type = "craft-item",
    item = "iron-chest",
    count = 100
  }

  data.raw["technology"]["factory-connection-type-circuit"].unit = nil
  data.raw["technology"]["factory-connection-type-circuit"].prerequisites = {"factory-architecture-t1"}
  data.raw["technology"]["factory-connection-type-circuit"].research_trigger = {
    type = "craft-item",
    item = "electronic-circuit",
    count = 100
  }

  table.insert(data.raw["technology"]["factory-connection-type-circuit"].effects,
    {
      type = "unlock-circuit-network",
      modifier = true
    }
  )

  if mods["bobelectronics"] then
    data.raw["technology"]["factory-connection-type-circuit"].research_trigger = {
      type = "craft-item",
      item = "bob-basic-circuit-board",
      count = 100
    }

    -- Update recipe for circuit connector
    data.raw["recipe"]["factory-circuit-connector"].ingredients = {
      {type = "item", name = "bob-basic-circuit-board", amount = 2},
      {type = "item", name = "copper-cable",            amount = 5}
    }
  end
end
