# coffeelint: disable=max_line_length

module.exports = (creep) ->
  if creep.carry.energy < creep.carryCapacity
    source = creep.pos.findClosest FIND_SOURCES
    creep.moveTo source
    creep.harvest source
  else
    spawn = creep.pos.findClosest FIND_MY_SPAWNS
    if spawn.energy < spawn.energyCapacity
      creep.moveTo spawn
      creep.transferEnergy spawn
    else
      extensions = creep.room.find FIND_MY_STRUCTURES, {filter: {structureType: STRUCTURE_EXTENSION}}
      for extension in extensions
        if extension.energy < extension.energyCapacity
          creep.moveTo extension
          creep.transferEnergy extension
    # creep.memory.role = "builder"
    # else
    #   creep.moveTo creep.room.controller while creep.carry.energy > 0
    #   creep.upgradeController creep.room.controller while creep.carry.energy > 0
