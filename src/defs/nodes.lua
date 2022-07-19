
--- Registers a new mushroom-like block.
-- @param	name		string	The name of the new block.
-- @param	texture		string	The name of the texture for the new block.
-- @param	rotateable	bool	Whether the new block should be rotateable by the user or not.
-- @param	lumimnosity	number?	Optional. If specified, then this is the amoutn fo light that should be emitted. If not, specify nil.
local function register_mushroom_block(desc, name, texture, rotateable, luminosity)
	if type(texture) == "string" then texture = { texture } end
	local def = {
		description = desc,
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
	if luminosity then def.light_source = luminosity end
	
	minetest.register_node("shroomlands:"..name, def)
end

local function register_mushroom_block_many(defs)
	for i,def in ipairs(defs) do
		print("DEBUG registering", def[1])
		register_mushroom_block(def[1], def[2], def[3], def[4], def[5])
	end
end

register_mushroom_block_many({
	{ "Brown Mushroom Block", "mushroom_brown", "shroomlands_brown_block.png", false },
	{ "Brown Mushroom Pore Block", "mushroom_brown2", "shroomlands_brown_block_2.png", false },
	{ "Purple Mushroom Block", "mushroom_purple", "shroomlands_purple_block.png", false },
	{ "Purple Mushroom Spot Block", "mushroom_purplespot", "shroomlands_purple_spot.png", false, 5 },
	{ "Glowspore", "glowspore", "shroomlands_glowspore.png", false, minetest.LIGHT_MAX },
	{ "Blue Glowspore", "glowspore_blue", "shroomlands_glowspore_blue.png", false, 7 },
	{ "Purple Mushroom Stem", "mushroom_purplestem", {
		"shroomlands_purple_stem_top.png",
		"shroomlands_purple_stem_top.png",
		"shroomlands_purple_stem.png",
	}, true },
	{ "Mycelium Dirt", "mycelium", {
		"shroomlands_grass_mushroom_top.png",
		"shroomlands_grass_mushroom_side.png"
	}, false },
})

-- Ethereal mushroom blocks:
-- (Credit: TenPlus1 for textures)

register_mushroom_block_many({
	{ "Red Mushroom Block", "mushroom_red", "shroomlands_red_block.png", false },
	{ "Mushroom Pore Block", "mushroom_spore", "shroomlands_pore_block.png", false },
	{ "Mushroom Stem", "mushroom_stem", {
		"shroomlands_white_stem_top.png",
		"shroomlands_white_stem_top.png",
		"shroomlands_white_stem.png",
	}, true },
})
