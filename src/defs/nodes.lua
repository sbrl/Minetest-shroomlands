
local function register_mushroom_block(name, texture, rotateable)
	if type(texture) == "string" then texture = { texture } end
	local def = {
		description = "Brown Mushroom Block",
		tiles = texture,
		-- See https://dev.minetest.net/Groups/Custom_groups
		groups = {
			snappy = 3,
			oddly_breakable_by_hand = 2
		},
		
		-- Events
		-- on_place = 
	}
	
	if rotateable then
		def.on_place = minetest.rotate_node -- auto-rotate
		def.paramtype2 = "facedir"
	end
	
	minetest.register_node("shroomlands:"..name, def)
end

local function register_mushroom_block_many(defs)
	for i,def in ipairs(defs) do
		register_mushroom_block(def[0], def[1], def[2])
	end
end

register_mushroom_block_many({
	{ "mushroom_brown", "shroomlands_brown_block_2.png", false },
	{ "mushroom_brown", "shroomlands_brown_block.png", false },
	{ "mushroom_brown", "shroomlands_purple_block.png", false },
	{ "mushroom_brown", "shroomlands_purple_spot.png", false },
	{ "mushroom_brown", "shroomlands_purple_stem.png", true },
	{ "mushroom_brown", {
		"shroomlands_grass_mushroom_top.png",
		"shroomlands_grass_mushroom_side.png"
	}, false },
})
