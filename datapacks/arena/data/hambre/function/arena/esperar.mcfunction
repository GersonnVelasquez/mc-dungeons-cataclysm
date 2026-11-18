# forceload only queues the chunks; building before they finish loading would fail silently.
execute in hambre:arena if loaded -256 64 -256 if loaded 255 64 -256 if loaded -256 64 255 if loaded 255 64 255 if loaded 0 64 0 if loaded 0 64 -300 run return run function hambre:arena/construir
schedule function hambre:arena/esperar 2s replace
