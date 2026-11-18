# Loading every map chunk once converts the 1.7 map to the current format before anyone plays on it.
execute in hambre:arena run forceload add -256 -256 -1 -1
execute in hambre:arena run forceload add 0 -256 255 -1
execute in hambre:arena run forceload add -256 0 -1 255
execute in hambre:arena run forceload add 0 0 255 255
execute in hambre:arena run forceload add -16 -320 15 -288
say Preparando la arena: convirtiendo el mapa Downstream, puede tardar un par de minutos...
schedule function hambre:arena/esperar 2s replace
