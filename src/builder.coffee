# coffeelint: disable=max_line_length

module.exports = (creep) ->
  if creep.carry.energy > 0
    # damaged ramparts first
    damagedRamparts = creep.room.find FIND_MY_STRUCTURES, {filter: (object) ->
      (object.structureType is STRUCTURE_RAMPART) and (object.hits < object.hitsMax - 50)}
    damagedRamparts.sort (a, b) ->
      a.hits - b.hits
    if damagedRamparts.length
      creep.moveTo damagedRamparts[0]
      creep.repair damagedRamparts[0]
      return
    # building with less than half hitpoints next
    damagedStructures = creep.room.find FIND_MY_STRUCTURES, {filter: (object) ->
      object.hits < object.hitsMax / 2}
    damagedStructures.sort (a, b) ->
      a.hits - b.hits
    if damagedStructures.length
      creep.moveTo damagedStructures[0]
      creep.repair damagedStructures[0]
      return
    #structuresNeedsRepair = creep.room.find FIND_MY_STRUCTURES
    #console.log structuresNeedsRepair
    # construction sites last
    site = creep.pos.findClosest FIND_CONSTRUCTION_SITES
    if site
      creep.moveTo site
      creep.build site
  else
    spawn = creep.pos.findClosest FIND_MY_SPAWNS
    creep.moveTo spawn
    spawn.transferEnergy creep
