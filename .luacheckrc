quiet = 1
codes = true

ignore = {
	"631", "61[124]",
	"542",
	"412",
	"321/bit",
	"21[123]"
}

-- Read-write globals (i.e. they can be defined)
globals = {
	"worldedit",
	"worldeditadditions",
	"worldeditadditions_commands",
	"worldeditadditions_core",
	"shroomlands"
}
-- Read-only globals
read_globals = {
	"minetest",
	"default",
	"vector",
	"assert",
	"bit",
	"it",
	"describe",
	"bonemeal",
	"dofile",
	"flowerpot",
	"VoxelArea",
}
std = "max"
