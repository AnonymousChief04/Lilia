MODULE.name = "Doors"
MODULE.author = "Chessnut"
MODULE.desc = "A simple door system."
DOOR_OWNER = 3
DOOR_TENANT = 2
DOOR_GUEST = 1
DOOR_NONE = 0
lia.config.DoorCost = 10
lia.config.DoorSellRatio = 0.5
lia.config.DoorLockTime = 0.5
lia.util.include("sv_module.lua")
lia.util.include("cl_module.lua")