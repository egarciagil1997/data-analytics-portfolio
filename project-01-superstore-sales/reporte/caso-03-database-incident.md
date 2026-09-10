# Caso 03 — Database Incident Analysis

## Situación
Se analizó un incidente de base de datos simulado en el que una interrupción del servicio dejó aproximadamente 10,000 solicitudes en cola. Durante la recuperación se produjo un segundo fallo asociado al aumento repentino de carga.

> **Nota:** los logs utilizados en este caso son sintéticos y fueron generados específicamente para el portafolio. No representan datos de producción reales.

## Objetivo
Investigar los logs de solicitudes, cuantificar el impacto del incidente, identificar patrones compatibles con la degradación del servicio y proponer controles preventivos.

## Hallazgos principales

- **10,000 solicitudes** fueron analizadas.
- **8,000 solicitudes** terminaron correctamente con HTTP 200.
- **2,000 solicitudes** terminaron con errores HTTP 500 o 503.
- La tasa global de error fue de **20%**.
- Las solicitudes HTTP 200 tuvieron un tiempo medio de respuesta de aproximadamente **299.5 ms**.
- Las solicitudes HTTP 500 tuvieron un tiempo medio de respuesta de aproximadamente **9.50 s**.
- Las solicitudes HTTP 503 tuvieron un tiempo medio de respuesta de aproximadamente **4.50 s**.
- Algunas solicitudes fallidas alcanzaron aproximadamente **10 segundos**, consistente con un límite de espera.
- Los registros fallidos mostraron una cantidad elevada de reintentos, lo que sugiere posible **amplificación de carga por retries**.
- Los errores estuvieron distribuidos entre diferentes tipos de consulta, por lo que los resultados no apuntaron a un único tipo de query como explicación exclusiva.

## Interpretación
El patrón observado es **consistente con una sobrecarga durante la recuperación**, potencialmente amplificada por solicitudes acumuladas y reintentos simultáneos.

Esto debe tratarse como una hipótesis basada en los logs sintéticos, no como una demostración de causalidad. Para confirmar una causa raíz en producción serían necesarios datos adicionales de infraestructura, conexiones, CPU, memoria, locks, throughput y métricas de la base de datos.

## Recomendaciones

1. **Queue y backpressure:** controlar la cantidad de solicitudes que pueden entrar al sistema durante una recuperación.
2. **Rate limiting:** limitar la velocidad de llegada de solicitudes para evitar picos de carga.
3. **Retries controlados:** utilizar límites de reintentos y exponential backoff en lugar de reintentos inmediatos.
4. **Circuit breaker:** evitar que un servicio siga enviando tráfico a una dependencia que está fallando.
5. **Connection pooling:** controlar el número máximo de conexiones concurrentes a la base de datos.
6. **Caching:** reducir consultas repetitivas cuando el caso de negocio lo permita.
7. **Optimización de queries e índices:** investigar las consultas más costosas mediante métricas reales de producción.
8. **Monitoreo y alertas:** establecer alertas para error rate, latency, retries, conexiones y saturación.

## Rol del analista
El objetivo del analista en este caso es **investigar, cuantificar el impacto, identificar patrones y recomendar controles**. La implementación de cambios de infraestructura corresponde a los equipos responsables de plataforma, backend y base de datos.

## Limitaciones

- Los datos son sintéticos.
- La línea temporal fue comprimida para facilitar el análisis.
- No se dispone de métricas reales de infraestructura.
- Las conclusiones son hipótesis analíticas y no una prueba definitiva de causa raíz.

## Flujo de análisis

**Logs → detección de errores → medición del impacto → análisis de latencia y retries → hipótesis → recomendaciones**

## Herramientas

- SQL
- SQLite
- Análisis de datos
- GitHub
