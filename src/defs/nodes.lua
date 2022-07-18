
--- Registers a new mushroom-like block.
-- @param	name		string	The name of the new block.
-- @param	texture		string	The name of the texture for the new block.
-- @param	rotateable	bool	Whether the new block should be rotateable by the user or not.
-- @param	lumimnosity	number?	Optional. If specified, then this is the amoutn fo light that should be emitted. If not, specify nil.
local function register_mushroom_block(name, texture, rotateable, luminosity)
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
	if luminosity then def.light_source = luminosity end
	
	minetest.register_node("shroomlands:"..name, def)
end

local function register_mushroom_block_many(defs)
	for i,def in ipairs(defs) do
		print("DEBUG registering", def[1])
		register_mushroom_block(def[1], def[2], def[3], def[4])
	end
end

register_mushroom_block_many({
	{ "mushroom_brown", "shroomlands_brown_block_2.png", false },
	{ "mushroom_brown2", "shroomlands_brown_block.png", false },
	{ "mushroom_purple", "shroomlands_purple_block.png", false },
	{ "mushroom_purplespot", "shroomlands_purple_spot.png", false, 5 },
	{ "glowspore", "shroomlands_glowspore.png", false, minetest.LIGHT_MAX },
	-- { "glowspore_blue", "shroomlands_glowspore_blue.png", false, minetest.LIGHT_MAX },
	{ "mushroom_purplestem", "shroomlands_purple_stem.png", true },
	{ "mycelium", {
		"shroomlands_grass_mushroom_top.png",
		"shroomlands_grass_mushroom_side.png"
	}, false },
})
