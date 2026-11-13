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
| [Distant Horizons](https://modrinth.com/mod/distanthorizons) | Terreno lejano hasta el horizonte; el servidor lo envía a quien tenga el mod | Servidor y, opcional, jugadores |

Los mods y sus dependencias (YUNG's API, Curios API, Lionfish API, Balm, Sophisticated Core) se descargan solos desde Modrinth al arrancar.

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
4. Multijugador → Agregar servidor → la dirección de playit.

Lo más fácil es que el administrador exporte su instancia de Modrinth App como modpack (tres puntos de la instancia → **Export**) y los demás la importen con **+ → Import**: quedan con los mismos mods y versiones.

When Dungeons Arise y YUNG's Better Dungeons no hacen falta en el cliente: las estructuras las genera el servidor.

Opcionales, cada jugador decide (no hacen falta para entrar):

| Mod | Para qué |
|---|---|
| Sodium | Más FPS |
| Iris Shaders | Cargar shaders; necesita Sodium. Después, en **Add content → Shaders**, instalar uno como Photon Shaders |
| Distant Horizons | Ver hasta el horizonte; como el servidor también lo tiene, el terreno lejano llega solo |
| JEI | Ver todos los objetos y sus recetas; buscar `@cataclysm` para ver los del mod |
| Xaero's Minimap + Xaero's World Map | Minimapa, mapa completo (**M**) y waypoints (**B**) |
| Xaero's Maps x Waystones | Muestra las waystones en el mapa de Xaero's |

Con shaders y Distant Horizons conviene darle 6–8 GB de RAM a la instancia (**Settings → Java and memory**).

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

## Actualizaciones de mods

En cada arranque el servidor descarga la última versión compatible de cada mod. Si después de un reinicio alguien no puede entrar por "versión distinta", que actualice sus mods en el launcher (en Modrinth App, **Content → Update all**).

Distant Horizons genera el terreno lejano en el servidor y lo guarda dentro de `data/`, así que usa más CPU y disco mientras haya jugadores explorando.

## Problemas comunes

- **`PKIX path building failed` en los logs:** un firewall de la red está interceptando o bloqueando HTTPS. El servidor necesita salir sin inspección SSL hacia `*.mojang.com`, `*.minecraft.net`, `*.minecraftservices.com`, `*.modrinth.com`, `*.neoforged.net` y `*.playit.gg`.

## Agregar más mods

Añade el *slug* de Modrinth (la última parte de la URL del mod) a `MODRINTH_PROJECTS` en `docker-compose.yml` y ejecuta `docker compose up -d`. El mod debe tener versión **NeoForge 1.21.1**. Si el mod agrega objetos, mobs o bloques, los jugadores también deben instalarlo.

Estos mods tienen versión NeoForge 1.21.1 y encajan con este servidor:

- Clases: `wizards`, `paladins-and-priests`, `rogues-and-warriors`, `archers` (RPG Series)
- Niveles y habilidades: `skills` (Pufferfish's Skills)
- Loot con rarezas: `apotheosis`

## ¿Por qué NeoForge y no Fabric?

L_Ender's Cataclysm y Apotheosis solo existen para Forge/NeoForge. Fabric y NeoForge no se pueden mezclar en el mismo servidor, así que NeoForge es el único loader que soporta todos los mods. La 1.21.1 es la versión con más mods al día en NeoForge.

Mundo existente: las estructuras nuevas solo aparecen en zonas que todavía no se han explorado.
