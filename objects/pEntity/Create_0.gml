//
z = 0;
spd = 0;
flash = 0;
lifted = 0;
thrown = false;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
entityDroplist = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));