# Changelog

Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/).
Versionado según [SemVer](https://semver.org/lang/es/).

## [1.2.0] - 2026-08-02

### Agregado
- Sincronización de contenido con AniList: episodios, capítulos, estado
  de emisión, portada y géneros se refrescan sin tener que re-agregar la
  obra. Usa el `updatedAt` de AniList para saltar obras sin cambios, y
  agrupa las consultas en lotes de 50 (no una llamada por obra).
- Botón "Sincronizar biblioteca" en Ajustes (sincronización manual).
- Sincronización automática en segundo plano al abrir la app, si pasaron
  más de 6 horas desde la última vez.

### Fuera de esta versión (deliberado)
- Aún no se refrescan relaciones/sinónimos/títulos alternativos en la
  sincronización (solo al agregar o al usar "Buscar más contenido").
- Solo sincroniza obras con id de AniList; Jikan/MangaDex no tienen un
  campo `updatedAt` barato para saber "¿cambió?" sin una llamada por obra.

## [1.1.0] - 2026-08-02

### Agregado
- Importar biblioteca pegando una lista de títulos (busca en AniList/Jikan y
  agrega automáticamente los que matchean; revisión manual para el resto).
- Exportar/restaurar biblioteca como backup JSON.
- MangaDex como tercer fallback de búsqueda (manga/manhwa/manhua, incluye
  contenido +18 que AniList/Jikan no siempre catalogan).
- Agrupación de biblioteca por franquicia: una serie con sus temporadas,
  películas, OVAs, ONAs y especiales aparece como un único elemento,
  usando las relaciones directas de AniList (sin fusión multi-API ni
  similitud de texto, para evitar agrupar mal).
- Sugerencia de obras relacionadas al agregar una obra (agrupadas por
  categoría, con Temporadas/secuelas pre-marcadas).
- Aviso de contenido nuevo disponible en la ficha de franquicia.
- Banner "Continuar con..." y sección "Continuar viendo" ampliada para
  incluir la siguiente obra pendiente de una franquicia recién completada.
- Workflow de GitHub Actions para compilar y firmar el APK en cada push
  (`release-android.yml`), en vez de depender de Codemagic.

### Corregido
- El build "release" de Android firmaba con las llaves de debug porque
  `build.gradle.kts` nunca leía `key.properties`.
- "Tiempo total" no contaba películas/OVAs/especiales marcados como
  completados cuando `totalEpisodes` no se conocía al agregarlos; tampoco
  debía fabricar minutos estimados de lectura para manga/manhwa/manhua.

### Cambiado
- Cambio de estado y progreso ahora es instantáneo (UI optimista): se
  repinta antes de esperar la confirmación de la base de datos.
- Al subir/bajar episodios o capítulos, el estado pasa a "Completado"
  automáticamente al llegar al total, y vuelve a "En progreso" si el
  conteo baja de nuevo.

## [1.0.0] - 2026-07-22

Primera versión: seguimiento de anime/manga/manhwa/manhua con búsqueda en
AniList/Jikan, biblioteca local (Isar), estadísticas, sync opcional en la
nube (Supabase) y builds de Android/Windows/iOS.
