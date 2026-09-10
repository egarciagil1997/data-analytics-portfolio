# Caso 02 — Detección y corrección de duplicados

## Situación
Se simuló un problema de duplicación de registros sobre una copia de prueba del dataset Superstore. El objetivo fue evaluar si los duplicados podían inflar los indicadores de negocio.

> **Nota:** el problema fue simulado en una tabla de prueba. No representa un error existente en el archivo fuente original.

## Detección
Se utilizaron agrupaciones por `row_id`, conteo de ocurrencias y `HAVING COUNT(*) > 1` para identificar posibles registros duplicados.

Los registros afectados fueron `row_id` 10 y 20, con 3 ocurrencias cada uno debido a la inserción de copias duplicadas.

## Impacto
La comparación entre la tabla con duplicados y la tabla original mostró:

| Indicador | Original | Con duplicados | Impacto |
|---|---:|---:|---:|
| Sales | $2,297,200.86 | $2,297,857.62 | +$656.76 (+0.22%) |
| Profit | $286,397.02 | $286,497.98 | +$100.96 (+0.04%) |

Aunque el impacto porcentual global fue pequeño en este escenario, el problema demuestra que duplicados pueden alterar reportes, KPIs y decisiones si no se controlan.

## Corrección
Se eliminaron las copias adicionales manteniendo un único registro válido por cada `row_id` afectado.

## Validación
Después de la limpieza, la tabla de prueba volvió a 9,994 registros y los `row_id` afectados dejaron de aparecer como duplicados.

## Conclusión
El caso demuestra un flujo de trabajo de Data Quality: **detección → investigación → medición del impacto → corrección → validación**.

## Herramientas
- SQL
- SQLite
- GitHub
