data.raw["technology"]["logistic-system"].prerequisites = {"construction-robotics", "logistic-robotics"}
data.raw["technology"]["logistic-system"].unit = {
  count = 100,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1}
  },
  time = 30
}

data.raw["recipe"]["active-provider-chest"].ingredients = data.raw["recipe"]["storage-chest"].ingredients
data.raw["recipe"]["requester-chest"].ingredients = data.raw["recipe"]["storage-chest"].ingredients
data.raw["recipe"]["buffer-chest"].ingredients = data.raw["recipe"]["storage-chest"].ingredients

data.raw["recipe"]["angels-logistic-chest-active-provider"].ingredients = data.raw["recipe"]["angels-logistic-chest-storage"].ingredients
data.raw["recipe"]["angels-logistic-chest-requester"].ingredients = data.raw["recipe"]["angels-logistic-chest-storage"].ingredients
data.raw["recipe"]["angels-logistic-chest-buffer"].ingredients = data.raw["recipe"]["angels-logistic-chest-storage"].ingredients

data.raw["technology"]["angels-logistic-silos"].unit = {
  count = 50,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
  },
  time = 15
}

data.raw["technology"]["angels-logistic-warehouses"].unit = {
  count = 75,
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
  },
  time = 15
}
