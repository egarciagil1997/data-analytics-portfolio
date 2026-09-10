# Caso 05 — Access Audit / Insider Risk

## Situación
Se diseñó un caso sintético de auditoría de accesos para analizar si el comportamiento de usuarios internos podía indicar un riesgo de acceso indebido o una posible exposición de información.

> **Nota:** los datos y eventos son sintéticos y se utilizan únicamente con fines de portfolio. No representan actividad real de usuarios.

## Objetivo
Auditar eventos de acceso, identificar patrones anómalos y proponer controles para reducir el riesgo de acceso excesivo, uso indebido de información y falta de trazabilidad.

## Riesgos considerados

- Usuarios con permisos superiores a los necesarios.
- Acceso a información sensible sin una necesidad de negocio clara.
- Volumen de consultas inusual.
- Accesos fuera del horario habitual.
- Acceso repetido a múltiples registros sensibles.
- Cuentas que mantienen privilegios después de cambiar de función.
- Falta de evidencia suficiente para investigar un incidente.

## Enfoque de auditoría

Los eventos de acceso pueden analizarse agrupando por usuario, recurso, fecha/hora, tipo de operación y nivel de sensibilidad. Los indicadores relevantes incluyen:

- número de accesos por usuario
- accesos a recursos sensibles
- accesos fuera del horario esperado
- cambios de permisos
- operaciones de lectura frente a operaciones de modificación
- concentración de accesos en periodos cortos
- usuarios con patrones significativamente diferentes a su comportamiento habitual

## Señales de riesgo

Una señal aislada no demuestra comportamiento malicioso. El análisis debe combinar varias evidencias antes de escalar un evento.

Ejemplos de señales que justifican investigación:

- incremento repentino del volumen de accesos
- acceso a recursos fuera del rol habitual
- combinación de acceso sensible y horario inusual
- múltiples recursos sensibles consultados en poco tiempo
- actividad inmediatamente después de un cambio de privilegios

## Controles recomendados

1. **Least privilege:** asignar únicamente los permisos necesarios para cada función.
2. **Role-based access control (RBAC):** administrar permisos mediante roles definidos.
3. **Access reviews periódicas:** revisar y retirar privilegios que ya no sean necesarios.
4. **Logging y auditoría:** registrar accesos relevantes y conservar evidencia suficiente para investigación.
5. **Alertas de anomalías:** detectar cambios significativos en volumen, horario o tipo de acceso.
6. **Separation of duties:** evitar que una sola cuenta concentre permisos incompatibles.
7. **Privileged access management:** aplicar controles adicionales a cuentas con privilegios elevados.
8. **Data minimization:** reducir el acceso a información sensible cuando no sea necesaria.

## Flujo de análisis

**Logs de acceso → segmentación por usuario/recurso → identificación de anomalías → evaluación contextual → priorización del riesgo → recomendación de controles**

## Conclusión
La auditoría de accesos permite transformar logs operativos en señales útiles para seguridad y gobierno de datos. El objetivo del analista es priorizar eventos que merecen investigación y proporcionar evidencia para que los equipos de seguridad puedan actuar.

Un patrón anómalo debe considerarse una **señal de riesgo**, no una acusación de comportamiento malicioso. La interpretación debe incorporar el rol del usuario, su actividad esperada y el contexto del negocio.

## Herramientas / conceptos

- SQL
- Access auditing
- Insider risk
- RBAC
- Least privilege
- Security logging
- Anomaly detection
- Data governance
