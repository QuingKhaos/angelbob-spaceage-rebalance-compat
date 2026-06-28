if mods["lane-balancers"] then
  -- Add basic lane balancer.
  ---@diagnostic disable-next-line: undefined-global
  lane_balancers_handle({
    prefix = "bob-basic-",
    tech = "logistics-0",
    order = "1a",
  })

	data.raw["item"]["bob-basic-lane-splitter"].icons = { { icon = "__angelbob-spaceage-rebalance-compat__/graphics/icons/bob-basic-lane-splitter.png" } }
	data.raw["lane-splitter"]["bob-basic-lane-splitter"].icons = { { icon = "__angelbob-spaceage-rebalance-compat__/graphics/icons/bob-basic-lane-splitter.png" } }

  -- Modify lane balancer recipes to use the same resources as the same tier splitter.
  local lane_balancers = {
    {recipe = "lane-splitter", base_recipe = "splitter", base_item = "bob-basic-splitter", replacement_item = "bob-basic-lane-splitter"},
    {recipe = "fast-lane-splitter", base_recipe = "fast-splitter", base_item = "splitter", replacement_item = "lane-splitter"},
    {recipe = "express-lane-splitter", base_recipe = "express-splitter", base_item = "fast-splitter", replacement_item = "fast-lane-splitter"},
    {recipe = "turbo-lane-splitter", base_recipe = "turbo-splitter", base_item = "express-splitter", replacement_item = "express-lane-splitter"},
    {recipe = "planetaris-hyper-lane-splitter", base_recipe = "bob-ultimate-splitter", base_item = "turbo-splitter", replacement_item = "turbo-lane-splitter"}
  }

  for _, lb in pairs(lane_balancers) do
    if data.raw["recipe"][lb.recipe] and data.raw["recipe"][lb.base_recipe] then
      local new_ingredients = {}
      for _, existing_ingredient in pairs(data.raw["recipe"][lb.base_recipe].ingredients) do
        if existing_ingredient.name == lb.base_item then
          table.insert(new_ingredients, {type = "item", name = lb.replacement_item, amount = existing_ingredient.amount * 2})
        else
          table.insert(new_ingredients, existing_ingredient)
        end
      end

      data.raw["recipe"][lb.recipe].ingredients = new_ingredients
    end
  end
end
