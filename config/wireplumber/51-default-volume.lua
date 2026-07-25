rule = {
  matches = {
    {
      { "device.name", "matches", "alsa_card.*" },
    },
  },
  apply_properties = {
    ["volume"] = 1.0,
  },
}

table.insert(alsa_monitor.rules, rule)
