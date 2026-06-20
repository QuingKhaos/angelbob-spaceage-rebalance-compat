if mods["angelsaddons-mobility"] then
  for i = 1, 3, 1 do
    local multiplier = math.pow(1.25, i - 1)
    local suffix = i == 1 and "" or "-" .. i

    data.raw["fluid-wagon"]["angels-petro-gas-wagon" .. suffix].air_resistance = 0.01 / multiplier
    data.raw["fluid-wagon"]["angels-petro-oil-wagon" .. suffix].air_resistance = 0.01 / multiplier
  end
end
