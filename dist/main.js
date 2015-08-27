// Generated by CoffeeScript 1.9.3
(function() {
  var _, builder, creep, harvester, name, ref, upgrader;

  _ = require("lodash");

  harvester = require("harvester");

  upgrader = require("upgrader");

  builder = require("builder");

  ref = Game.creeps;
  for (name in ref) {
    creep = ref[name];
    switch (creep.memory.role) {
      case "harvester":
        harvester(creep);
        break;
      case "upgrader":
        upgrader(creep);
        break;
      case "builder":
        builder(creep);
    }
  }

}).call(this);
