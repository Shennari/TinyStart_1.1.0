require("prototypes.tinyarmor")
require("prototypes.tinyarmor-recipes")

-- Krastorio 2 compatibility block
if mods["Krastorio2"] then
	data.raw["generator-equipment"]["micro-fusion-reactor-equipment"].categories = {"universal-equipment"}
	data.raw["equipment-grid"]["tiny-equipment-grid"].equipment_categories = {"universal-equipment", "robot-interaction-equipment"}
end