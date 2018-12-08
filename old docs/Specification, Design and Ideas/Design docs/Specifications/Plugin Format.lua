-- Hive plugin format
local plugin = {
  version = nil, -- major.minor.patch.build
  flavor = nil, -- uniqueString, use this to name your fork
  enable = nil, -- function, called when plugin is activated including on program start/resume
                  -- arg, string: 
                    -- "resume" - program restarted by checkpoint
                    -- "start" - program started by normaly
                    -- "enable" - plugin activated after program startup
  disable = nil, -- function, called when plugin is deactivated
  
}

return plugin
