# forceload only queues the chunks; building before they finish generating would fail silently.
execute if loaded -1414 64 -590 if loaded -1214 64 -590 if loaded -1414 64 -390 if loaded -1214 64 -390 if loaded -1314 64 -490 run return run function hambre:arena/construir
schedule function hambre:arena/esperar 1s replace
