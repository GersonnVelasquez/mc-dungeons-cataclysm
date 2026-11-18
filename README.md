# mc-dungeons-cataclysm

Servidor de Minecraft Java **NeoForge 1.21.1** con mazmorras y jefes, en Docker y expuesto a internet gratis con [playit.gg](https://playit.gg).

| Mod | Qué agrega | Dónde se instala |
|---|---|---|
| [When Dungeons Arise](https://modrinth.com/mod/when-dungeons-arise) | Estructuras y mazmorras enormes | Solo servidor |
| [YUNG's Better Dungeons](https://modrinth.com/mod/yungs-better-dungeons) | Mazmorras vanilla rehechas | Solo servidor |
| [L_Ender's Cataclysm](https://modrinth.com/mod/l_enders-cataclysm) | Jefes difíciles, armas y armaduras | Servidor **y** jugadores |
| [Waystones](https://modrinth.com/mod/waystones) | Piedras para teletransportarse entre lugares ya visitados | Servidor **y** jugadores |
| [Sophisticated Backpacks](https://modrinth.com/mod/sophisticated-backpacks) | Mochilas con mejoras (recoger objetos, imán, comer solo…) | Servidor **y** jugadores |
| [Immersive Aircraft](https://modrinth.com/mod/immersive-aircraft) | Aviones rústicos y dirigibles | Servidor **y** jugadores |
| [Small Ships](https://modrinth.com/mod/small-ships) | Barcos medievales con velas y cañones | Servidor **y** jugadores |
| [GraveStone Mod](https://modrinth.com/mod/gravestone-mod) | Al morir, el inventario queda guardado en una tumba | Servidor **y** jugadores |
| [ChoiceTheorem's Overhauled Village](https://modrinth.com/mod/ct-overhaul-village) | Aldeas más grandes y distintas según el bioma | Solo servidor |
| [Villager Names](https://modrinth.com/mod/villager-names-serilum) | Nombres propios para los aldeanos | Solo servidor |
| [Guard Villagers](https://modrinth.com/mod/guard-villagers) | Guardias que patrullan y defienden las aldeas | Servidor **y** jugadores |
| [Apotheosis](https://modrinth.com/mod/apotheosis) | Encantamientos mejorados, gemas, equipo con rarezas y mobs élite | Servidor **y** jugadores |
| [Mowzie's Mobs](https://modrinth.com/mod/mowzies-mobs) | Criaturas y jefes nuevos | Servidor **y** jugadores |
| [Pufferfish's Skills](https://modrinth.com/mod/skills) + [Default Skill Trees](https://modrinth.com/mod/default-skill-trees) | Árboles de habilidades que se suben con experiencia (tecla **K**) | Servidor **y** jugadores |
| [PVP Flagging](https://modrinth.com/mod/pvp-flagging) | PvP opcional: solo pelean los que lo activan con `/pvpFlag`, y los operadores pueden crear zonas PvP | Servidor **y** jugadores |
| [Distant Horizons](https://modrinth.com/mod/distanthorizons) | Terreno lejano hasta el horizonte; el servidor lo envía a quien tenga el mod | Servidor y, opcional, jugadores |
| [Lithium](https://modrinth.com/mod/lithium), [ModernFix](https://modrinth.com/mod/modernfix) y [FerriteCore](https://modrinth.com/mod/ferrite-core) | Rendimiento: menos CPU por tick, menos RAM y arranque más rápido, sin cambiar el juego | Servidor y, opcional, jugadores |
| [Custom BattleRoyale](https://modrinth.com/mod/custom-battleroyale) | Partidas tipo Juegos del Hambre en una arena aparte del mundo | Servidor **y** jugadores |

Los mods y sus dependencias (bibliotecas como Curios, Balm, GeckoLib o Placebo) se descargan solos desde Modrinth al arrancar.

## Requisitos

- Un servidor Linux con Docker y el plugin `docker compose`.
- 12 GB de RAM o más (el servidor de Minecraft usa 8 GB por defecto).
- Una cuenta gratis en [playit.gg](https://playit.gg).
- Cada jugador necesita su propio **Minecraft Java Edition** original. Bedrock (consola, móvil, Microsoft Store) no puede entrar.

## Levantar el servidor

```bash
git clone https://github.com/GersonnVelasquez/mc-dungeons-cataclysm.git
cd mc-dungeons-cataclysm
cp .env.example .env
nano .env
```

En `.env` rellena:

- `PLAYIT_SECRET_KEY`: en playit.gg entra a **Add Agent → Docker** y copia la clave secreta.
- `MC_OPS`: tu nick de Minecraft, para tener permisos de operador.
- `MC_MEMORY`: RAM del servidor (por defecto `8G`).

Arranca todo:

```bash
docker compose up -d
docker compose logs -f minecraft
```

El primer arranque tarda unos minutos (descarga NeoForge, los mods y genera el mundo). Está listo cuando aparece `Done (...)! For help, type "help"`.

## Exponerlo a internet con playit.gg

1. En el panel de playit.gg el agente aparecerá como conectado.
2. Crea un túnel de tipo **Minecraft Java** con dirección local `127.0.0.1` y puerto `25565`.
3. playit te da una dirección fija (por ejemplo `algo.joinmc.link`). Esa es la que compartes.

No hace falta abrir puertos en el router. Cualquiera con la dirección y un Minecraft original puede entrar: no hay lista blanca.

## Qué instalan los jugadores

1. Instalar [Modrinth App](https://modrinth.com/app) o [Prism Launcher](https://prismlauncher.org) e iniciar sesión con la cuenta de Microsoft.
2. Crear una instancia **NeoForge 1.21.1**.
3. Agregar estos mods; sus dependencias se instalan solas. Sin ellos no se puede entrar al servidor:
   - L_Ender's Cataclysm
   - Waystones
   - Sophisticated Backpacks
   - Immersive Aircraft
   - Small Ships
   - GraveStone Mod
   - Guard Villagers
   - Apotheosis
   - Mowzie's Mobs
   - Pufferfish's Skills
   - Default Skill Trees
   - PVP Flagging
   - Custom BattleRoyale
4. Multijugador → Agregar servidor → la dirección de playit.

Pufferfish's Skills e Iris usan la misma tecla (**K**); hay que cambiar una en **Opciones → Controles**.

Lo más fácil es que el administrador exporte su instancia de Modrinth App como modpack (tres puntos de la instancia → **Export**) y los demás la importen con **+ → Import**: quedan con los mismos mods y versiones.

When Dungeons Arise y YUNG's Better Dungeons no hacen falta en el cliente: las estructuras las genera el servidor.

Opcionales, cada jugador decide (no hacen falta para entrar):

| Mod | Para qué |
|---|---|
| Sodium | Más FPS |
| ModernFix, FerriteCore, ImmediatelyFast, Entity Culling, More Culling, Dynamic FPS | Más FPS y menos RAM; Dynamic FPS además baja los FPS con el juego minimizado. Ninguno cambia el juego |
| Iris Shaders | Cargar shaders; necesita Sodium. Después, en **Add content → Shaders**, instalar uno como Photon Shaders |
| Distant Horizons | Ver hasta el horizonte; como el servidor también lo tiene, el terreno lejano llega solo |
| JEI | Ver todos los objetos y sus recetas; buscar `@cataclysm` para ver los del mod |
| Xaero's Minimap + Xaero's World Map | Minimapa, mapa completo (**M**) y waypoints (**B**) |
| Xaero's Maps x Waystones | Muestra las waystones en el mapa de Xaero's |

Con shaders y Distant Horizons conviene darle 6–8 GB de RAM a la instancia (**Settings → Java and memory**).

## PvP

Un jugador solo puede lastimar a otro si **los dos** tienen el PvP activo. Cada uno lo maneja desde el chat:

| Comando | Qué hace |
|---|---|
| `/pvpFlag` | Activa o apaga tu PvP |
| `/pvpFlag on` / `/pvpFlag off` | Lo activa / lo apaga |
| `/pvpFlag status` | Dice si lo tienes activo |

- Quien tiene el PvP activo lleva una daga roja junto al nombre.
- Apagarlo tarda 15 segundos, y se cancela si en ese tiempo pegas o te pega otro jugador.
- Al morir se apaga solo.

Los operadores pueden crear zonas PvP: un rectángulo entre dos esquinas, a cualquier altura, en la dimensión donde estén. Al entrar, el PvP se activa solo y no se puede apagar adentro; al salir sigue activo hasta usar `/pvpFlag off`.

```
/pvpZone add arena 100 200 140 240 5
/pvpZone list
/pvpZone remove arena
```

`100 200` y `140 240` son las coordenadas X y Z de dos esquinas opuestas (se ven con **F3**). El último número son los bloques alrededor de la zona donde avisa que estás por entrar.

Los tiempos y el estado al morir o al conectarse se cambian en `data/world/serverconfig/pvp_flagging-server.toml`.

## Juegos del Hambre

La arena es el mapa [Downstream](https://www.planetminecraft.com/project/downstream-survival-games-map/) de Schnogot, hecho con eti28 y flashced. Es una isla de unos 400 × 300 bloques con cascadas, ruinas, túneles y 166 cofres, y la cornucopia en el centro (X 0, Z 0) con 24 pedestales. Vive en una dimensión aparte, `hambre:arena`, donde siempre es de día y alrededor solo hay vacío. El autor permite usarlo en servidores dando crédito; el mapa no está en este repo.

### Instalar el mapa (una sola vez)

1. Descarga el mapa desde su página. Es de Minecraft 1.7, y el servidor no puede convertir mapas tan viejos dentro de una dimensión nueva (`Unknown dimension type` en el log), así que primero se convierte con un servidor vanilla 1.21.1 vacío: pon la carpeta `region` del mapa en `world/DIM1/region` de ese servidor y arráncalo una vez con `java -jar server.jar --forceUpgrade --nogui`. Se usa el End porque conserva la altura antigua (0 a 255), igual que la dimensión de la arena.
2. Con el servidor detenido, deja esa carpeta `world/DIM1/region` ya convertida en `data/world/dimensions/hambre/arena/region`. Los archivos tienen que quedar del mismo dueño que el resto del mundo:

   ```bash
   sudo chown -R --reference=data/world data/world/dimensions
   ```

3. Arranca el servidor y, con nadie conectado, prepara la arena:

   ```bash
   docker exec mc-dungeons rcon-cli function hambre:arena/preparar
   ```

   Carga el mapa por partes, arma un lobby flotante al sur de la isla y marca la arena como zona PvP de PVP Flagging. Termina cuando en los logs sale `Arena lista`.

### Jugar una partida

1. Cada jugador guarda sus cosas en un cofre: **al empezar la partida se vacía el inventario**.
2. Cada jugador se une con `/battleroyale team join`, desde donde esté. `/battleroyale team leave` lo saca.
3. El operador escribe `/function hambre:partida/preparar` y todos los que se unieron van al lobby de la arena.
4. El operador escribe `/battleroyale game start` y cada uno aparece en un pedestal alrededor de la cornucopia, con 10 segundos sin recibir daño.

- Se juega en modo aventura: no se rompen ni se ponen bloques, y los cofres se llenan solos cuando alguien se acerca.
- La zona empieza a cerrarse a los 5 minutos y llega a la cornucopia en unos 20; fuera de ella se pierde vida.
- Quien muere pasa a espectador. Gana el último en pie y todos vuelven al lobby.
- En el lobby, pisar el bloque de oro devuelve al spawn del mundo normal y apaga el PvP.
- `/battleroyale game stop` cancela la partida y regresa a todos al lobby.

Equipos, tiempos, lobby y botín se cambian en `config/battleroyale/`; esos archivos se copian al servidor en cada arranque.

Después de la primera partida, `/battleroyale game toLobby` lleva a cualquier jugador al lobby, juegue o no. El mod no permite quitarlo; se desactiva solo al reiniciar el servidor.

## Comandos útiles

Ejecutar un comando en la consola del servidor:

```bash
docker exec mc-dungeons rcon-cli op NickDeAlguien
docker exec mc-dungeons rcon-cli say Reinicio en 5 minutos
```

Consola interactiva (salir con `Ctrl+P` y luego `Ctrl+Q`, no con `Ctrl+C`):

```bash
docker attach mc-dungeons
```

Detener, reiniciar y actualizar imágenes:

```bash
docker compose down
docker compose restart minecraft
docker compose pull && docker compose up -d
```

Copia de seguridad del mundo:

```bash
mkdir -p backups
docker compose stop minecraft
tar czf backups/mundo-$(date +%F).tar.gz data
docker compose start minecraft
```

Empezar un mundo nuevo (el anterior queda guardado en `backups/`):

```bash
docker compose stop minecraft
mkdir -p backups
mv data/world backups/world-$(date +%F)
docker compose start minecraft
```

El mundo nuevo usa la semilla de `SEED` en `docker-compose.yml`: 2786386421968123439, que aparece en un valle entre montañas (Jagged Peaks) y un bosque de cerezos, con una aldea de llanura en X 64, Z -192 y océano a los lados. Para otro terreno, cambia `SEED` antes de mover el mundo, o quítala para que salga uno al azar.

Se conservan los operadores y la configuración de `data/config`. Se pierde todo lo que vive en el mundo: terreno, inventarios, waystones, progreso de habilidades, zonas PvP y la configuración por mundo (`serverconfig`). Para volver al mundo anterior, detén el servidor y devuelve esa carpeta a `data/world`.

Cada jugador debe borrar en su instancia las carpetas de este servidor dentro de `xaero/minimap`, `xaero/world-map` y `Distant_Horizons_server_data`. Si no, verá el mapa y el horizonte del mundo anterior.

## Actualizaciones de mods

En cada arranque el servidor descarga la última versión compatible de cada mod. Si después de un reinicio alguien no puede entrar por "versión distinta", que actualice sus mods en el launcher (en Modrinth App, **Content → Update all**).

Distant Horizons genera el terreno lejano en el servidor y lo guarda dentro de `data/`, así que usa más CPU y disco mientras haya jugadores explorando.

## Problemas comunes

- **`PKIX path building failed` en los logs:** un firewall de la red está interceptando o bloqueando HTTPS. El servidor necesita salir sin inspección SSL hacia `*.mojang.com`, `*.minecraft.net`, `*.minecraftservices.com`, `*.modrinth.com`, `*.neoforged.net` y `*.playit.gg`.
- **El servidor se cae al arrancar con `Chunky is not loaded`:** Distant Horizons 3.3.3 intenta usar Chunky antes de que Chunky termine de cargar. No agregues Chunky mientras el servidor tenga Distant Horizons.

## Agregar más mods

Añade el *slug* de Modrinth (la última parte de la URL del mod) a `MODRINTH_PROJECTS` en `docker-compose.yml` y ejecuta `docker compose up -d`. El mod debe tener versión **NeoForge 1.21.1**. Si el mod agrega objetos, mobs o bloques, los jugadores también deben instalarlo.

Estos mods tienen versión NeoForge 1.21.1 y encajan con este servidor:

- Clases: `wizards`, `paladins-and-priests`, `rogues-and-warriors`, `archers` (RPG Series)
- Niveles y habilidades: `skills` (Pufferfish's Skills)
- Loot con rarezas: `apotheosis`

## ¿Por qué NeoForge y no Fabric?

L_Ender's Cataclysm y Apotheosis solo existen para Forge/NeoForge. Fabric y NeoForge no se pueden mezclar en el mismo servidor, así que NeoForge es el único loader que soporta todos los mods. La 1.21.1 es la versión con más mods al día en NeoForge.

Mundo existente: las estructuras nuevas solo aparecen en zonas que todavía no se han explorado.
