if mods["compaktcircuit"] then
  data.raw.technology["compaktcircuit-tech"].unit = {
    count = 100,
    ingredients = {
      {'automation-science-pack', 1},
      {'logistic-science-pack', 1}
    },
    time = 15
  }

  data.raw.technology["compaktcircuit-tech"].prerequisites = {
      "circuit-network",
  }

  for _, recipe in pairs({"compaktcircuit-processor", "compaktcircuit-processor_1x1"}) do
    local new_ingredients = {}

    for _, existing_ingredient in pairs(data.raw["recipe"][recipe].ingredients) do
      if existing_ingredient.name == "electronic-circuit" then
        table.insert(new_ingredients, {type = "item", name = "bob-tinned-copper-cable", amount = existing_ingredient.amount})
      elseif existing_ingredient.name == "advanced-circuit" then
        table.insert(new_ingredients, {type = "item", name = "electronic-circuit", amount = existing_ingredient.amount})
      elseif existing_ingredient.name == "processing-unit" then
        table.insert(new_ingredients, {type = "item", name = "advanced-circuit", amount = existing_ingredient.amount})
      else
        table.insert(new_ingredients, existing_ingredient)
      end
    end

    data.raw["recipe"][recipe].ingredients = new_ingredients
  end
end
