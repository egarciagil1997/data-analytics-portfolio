# Caso 04 — AI Guardrails: seguridad de IA y protección de PII

## Situación
Se diseñó un caso sintético para evaluar controles de seguridad alrededor de una aplicación de IA que recibe texto de usuarios y puede procesar información sensible.

> **Nota:** este caso utiliza datos sintéticos y se presenta como un ejercicio de análisis de seguridad. No contiene información personal real.

## Objetivo
Definir controles que permitan detectar entradas potencialmente peligrosas o que contengan información de identificación personal (PII), reducir la exposición de datos sensibles y registrar los eventos relevantes para auditoría.

## Riesgos considerados

- Exposición accidental de nombres, correos, teléfonos u otros identificadores.
- Inclusión de datos sensibles en prompts o respuestas.
- Intentos de evadir las reglas de validación mediante entradas no esperadas.
- Falta de trazabilidad sobre qué entradas fueron bloqueadas, redactadas o permitidas.
- Uso de datos reales en entornos de prueba.

## Controles propuestos

1. **Input validation:** validar y clasificar las entradas antes de enviarlas al modelo.
2. **PII detection:** identificar patrones asociados con información personal.
3. **Redaction:** ocultar o reemplazar datos sensibles antes del procesamiento cuando no sean necesarios.
4. **Output validation:** revisar las respuestas antes de entregarlas al usuario.
5. **Allowlist / denylist de casos de uso:** limitar las operaciones permitidas según el contexto.
6. **Logging seguro:** registrar eventos de seguridad sin almacenar innecesariamente la PII original.
7. **Human review:** escalar casos de alto riesgo para revisión humana.
8. **Least privilege:** limitar los datos y sistemas a los que la aplicación de IA puede acceder.

## Flujo recomendado

**Entrada → detección de riesgo/PII → decisión (permitir, redactar o bloquear) → procesamiento → validación de salida → auditoría**

## Enfoque analítico
El análisis no busca demostrar que una aplicación es completamente segura. Busca establecer controles verificables y métricas que permitan detectar desviaciones.

Indicadores útiles:

- porcentaje de entradas bloqueadas
- porcentaje de entradas con PII detectada
- cantidad de eventos escalados a revisión humana
- tipos de riesgo más frecuentes
- falsos positivos y falsos negativos
- incidentes repetidos por usuario o aplicación

## Conclusión
Los guardrails deben funcionar como una capa de control alrededor del modelo, no como sustituto de una estrategia completa de seguridad. La protección de PII requiere minimizar la cantidad de datos procesados, aplicar controles de acceso y mantener trazabilidad sobre los eventos relevantes.

## Herramientas / conceptos

- SQL
- Data Quality
- PII detection
- Input/output validation
- Access control
- Security logging
- AI safety guardrails
