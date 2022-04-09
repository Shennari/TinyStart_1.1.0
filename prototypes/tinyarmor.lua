data:extend{
  {
    type = "armor",
    name = "tiny-armor-mk0",
    icon = "__TinyStart__/graphics/icons/tiny-power-armor.png",
	icon_size = 32,
    flags = {},
    resistances =
    {
      {
        type = "physical",
        decrease = 0,
        percent = 0
      },
      {
        type = "acid",
        decrease = 0,
        percent = 0
      },
      {
        type = "explosion",
        decrease = 0,
        percent = 0
      },
      {
        type = "fire",
        decrease = 0,
        percent = 0
      }
    },
    subgroup = "armor",
    order = "a[tiny-armor-mk0]",
    stack_size = 1,
	infinite = true,
    equipment_grid = "tiny-equipment-grid",
    inventory_size_bonus = 0
  },
  {
    type = "armor",
    name = "tiny-armor-mk1",
    icon = "__TinyStart__/graphics/icons/tiny-power-armor-mk1.png",
	icon_size = 32,
    flags = {},
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "acid",
        decrease = 0,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 2,
        percent = 20
      },
      {
        type = "fire",
        decrease = 0,
        percent = 10
      }
    },
    subgroup = "armor",
    order = "a[tiny-armor-mk1]",
    stack_size = 1,
	infinite = true,
    equipment_grid = "tiny-equipment-grid",
    inventory_size_bonus = 10
  },
  {
    type = "armor",
    name = "tiny-armor-mk2",
    icon = "__TinyStart__/graphics/icons/tiny-power-armor-mk2.png",
	icon_size = 32,
    flags = {},
    resistances =
    {
      {
        type = "physical",
        decrease = 6,
        percent = 30
      },
      {
        type = "acid",
        decrease = 4,
        percent = 30
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 30
      },
      {
        type = "fire",
        decrease = 2,
        percent = 30
      }
    },
    subgroup = "armor",
    order = "a[tiny-armor-mk2]",
    stack_size = 1,
	infinite = true,
    equipment_grid = "tiny-equipment-grid",
    inventory_size_bonus = 20
  },
  {
    type = "equipment-grid",
    name = "tiny-equipment-grid",
    width = 5,
    height = 4,
    equipment_categories = {"armor"}
  },
  {
    type = "generator-equipment",
    name = "micro-fusion-reactor-equipment",
    sprite =
    {
      filename = "__TinyStart__/graphics/equipment/tiny-fusion-reactor-equipment.png",
      width = 128,
      height = 128,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "150kW",
    categories = {"armor"}
  },
  {
    type = "item",
    name = "micro-fusion-reactor-equipment",
    icon = "__TinyStart__/graphics/icons/tiny-fusion-reactor-equipment.png",
	icon_size = 32,
    placed_as_equipment_result = "micro-fusion-reactor-equipment",
    flags = {},
    subgroup = "equipment",
    order = "a[energy-source]-b[fusion-reactor]",
    stack_size = 20
  },
}  