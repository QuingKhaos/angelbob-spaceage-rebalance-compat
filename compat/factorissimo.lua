if mods["factorissimo-2-notnotmelon"] then
  -- Unlock factory 1 via trigger tech
  data.raw["technology"]["factory-architecture-t1"].unit = nil
  data.raw["technology"]["factory-architecture-t1"].prerequisites = nil
  data.raw["technology"]["factory-architecture-t1"].research_trigger = {
    type = "craft-item",
    item = "stone",
    count = 500
  }

  -- Configure factory upgrades as trigger techs
  data.raw["technology"]["factory-interior-upgrade-lights"].unit = nil
  data.raw["technology"]["factory-interior-upgrade-lights"].research_trigger = {
    type = "craft-item",
    item = "small-lamp",
    count = 10
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
    count = 10
  }

  data.raw["technology"]["factory-connection-type-chest"].unit = nil
  data.raw["technology"]["factory-connection-type-chest"].prerequisites = {"factory-architecture-t1"}
  data.raw["technology"]["factory-connection-type-chest"].research_trigger = {
    type = "craft-item",
    item = "iron-chest",
    count = 10
  }

  data.raw["technology"]["factory-connection-type-circuit"].unit = nil
  data.raw["technology"]["factory-connection-type-circuit"].prerequisites = {"factory-architecture-t1"}
  data.raw["technology"]["factory-connection-type-circuit"].research_trigger = {
    type = "craft-item",
    item = "electronic-circuit",
    count = 10
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
      count = 10
    }

    -- Update recipe for circuit connector
    data.raw["recipe"]["factory-circuit-connector"].ingredients = {
      {type = "item", name = "bob-basic-circuit-board", amount = 2},
      {type = "item", name = "copper-cable",            amount = 5}
    }
  end

  -- Make factory 2 available as in vanilla Factorissimo
  data.raw.technology["factory-architecture-t2"].unit = {
    count = 600,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack",   1},
    },
    time = 45
  }

  data.raw.technology["factory-architecture-t2"].prerequisites = {
      "factory-architecture-t1",
      "steel-processing",
      "electric-energy-distribution-1",
  }

  -- Roboport upgrade without chemical science packs
  data.raw.technology["factory-interior-upgrade-roboport"].unit = {
    count = 600,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack",   1},
    },
    time = 45
  }

  -- Heat pipe upgrade costs as in vanilla Factorissimo
  data.raw.technology["factory-connection-type-heat"].unit = {
    count = 600,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack",   1},
    },
    time = 45
  }

  data.raw.technology["factory-connection-type-heat"].prerequisites = {
      "factory-architecture-t2",
      "bob-heat-pipe-1",
  }

  -- Fix factory pump speed back to original speed from Factorissimo
  local highest_quality_level = 0
  for _, quality in pairs(data.raw.quality) do
      if quality.level > highest_quality_level then highest_quality_level = quality.level end
  end

  local pumping_speed = 200
  local pumping_speed_with_quality = pumping_speed * (1 + highest_quality_level * 0.3)

  data.raw["pump"]["factory-inside-pump-input"].fluid_box.volume = pumping_speed_with_quality
  data.raw["pump"]["factory-inside-pump-input"].pumping_speed = pumping_speed

  data.raw["pump"]["factory-inside-pump-output"].fluid_box.volume = pumping_speed_with_quality
  data.raw["pump"]["factory-inside-pump-output"].pumping_speed = pumping_speed

  data.raw["pump"]["factory-outside-pump-input"].fluid_box.volume = pumping_speed_with_quality
  data.raw["pump"]["factory-outside-pump-input"].pumping_speed = pumping_speed

  data.raw["pump"]["factory-outside-pump-output"].fluid_box.volume = pumping_speed_with_quality
  data.raw["pump"]["factory-outside-pump-output"].pumping_speed = pumping_speed
end
