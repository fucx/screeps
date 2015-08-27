# coffeelint: disable=max_line_length
_ = require("lodash")
harvester = require("harvester")
upgrader = require("upgrader")
builder = require("builder")

for name, creep of Game.creeps
  switch creep.memory.role
    when "harvester" then harvester creep
    when "upgrader" then upgrader creep
    when "builder" then builder creep
