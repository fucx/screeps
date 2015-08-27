# coffeelint: disable=max_line_length

module.exports = (creep) ->
  if creep.carry.energy > 0
    creep.moveTo creep.room.controller
    creep.upgradeController creep.room.controller
  else
    creep.memory.role = "harvester"
