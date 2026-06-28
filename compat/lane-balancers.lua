-- Modify lane balancer recipes to use similar resources as the same tier splitter.
local lane_balancers = {
  {recipe = "lane-splitter", base_recipe = "splitter", base_item = "bob-basic-splitter", replacement_item = "transport-belt", multiplier = 4},
  {recipe = "fast-lane-splitter", base_recipe = "fast-splitter", base_item = "splitter", replacement_item = "lane-splitter", multiplier = 2},
  {recipe = "express-lane-splitter", base_recipe = "express-splitter", base_item = "fast-splitter", replacement_item = "fast-lane-splitter", multiplier = 2},
  {recipe = "turbo-lane-splitter", base_recipe = "turbo-splitter", base_item = "express-splitter", replacement_item = "express-lane-splitter", multiplier = 2},
  {recipe = "planetaris-hyper-lane-splitter", base_recipe = "bob-ultimate-splitter", base_item = "turbo-splitter", replacement_item = "turbo-lane-splitter", multiplier = 2}
}

for _, lb in pairs(lane_balancers) do
  if data.raw["recipe"][lb.recipe] and data.raw["recipe"][lb.base_recipe] then
    local new_ingredients = {}
    for _, existing_ingredient in pairs(data.raw["recipe"][lb.base_recipe].ingredients) do
      if existing_ingredient.name == lb.base_item then
        table.insert(new_ingredients, {type = "item", name = lb.replacement_item, amount = existing_ingredient.amount * lb.multiplier})
      else
        table.insert(new_ingredients, {type = "item", name = existing_ingredient.name, amount = existing_ingredient.amount * 2})
      end
    end

    data.raw["recipe"][lb.recipe].ingredients = new_ingredients
  end
end
