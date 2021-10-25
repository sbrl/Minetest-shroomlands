minetest.register_node("shrromlands:mushroom_brown", {
	description = "Brown Mushroom Block",
	-- paramtype2 = "facedir",
	tiles = {
		"shrromlands_brown_block_2.png",
	},
	-- See https://dev.minetest.net/Groups/Custom_groups
	groups = {
		snappy = 3,
		oddly_breakable_by_hand = 2
	},
	
	-- Events
	-- on_place = minetest.rotate_node -- auto-rotate
})
