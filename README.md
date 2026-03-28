# 🏥 MediSistema — Examen de Gestión Hospitalaria

> Desarrollado como ejercicio de modelado relacional y consultas SQL.

---

## 📋 Descripción

MediSistema es una base de datos diseñada para gestionar un centro de salud.
Permite administrar médicos, sus especialidades, pacientes, citas y consultas médicas,
aplicando principios de normalización e integridad referencial.

---

## 🗂️ Estructura del Repositorio

```
medisistema_taller/
├── README.md
└── almacenamiento/
    ├── mysql/
    │   ├── db.sql          → Estructura de la base de datos (DDL)
    │   ├── insert.sql      → Datos de prueba generados con IA (DML)
    │   └── consultas.sql   → Resolución de las 20 consultas
   
```

---



## 🛠️ Herramientas Utilizadas

| Herramienta | Uso |
|---|---|
| StarUML | Diseño del diagrama lógico |
| MySQL | Motor de base de datos |
| IA (Claude) | Generación del archivo insert.sql |
| GitHub | Control de versiones |

---

## 📁 Archivos

### `db.sql`
Contiene la creación de la base de datos y todas las tablas con sus
relaciones, claves primarias, foráneas y restricciones ON DELETE.

### `insert.sql`
Datos de prueba generados con inteligencia artificial.
Incluye 10 médicos, 15 pacientes, 20 citas y 18 consultas
con escenarios variados para validar todas las consultas SQL.

### `consultas.sql`
Resolución de los 20 enunciados propuestos, organizados en tres bloques:
- Gestión de personal y especialidades (1–5)
- Gestión de pacientes y citas (6–10)
- Análisis y reportes (11–20)

---

## 🚀 ¿Cómo ejecutar?

```sql
-- 1. Crear la base de datos y tablas
source almacenamiento/mysql/db.sql

-- 2. Insertar datos de prueba
source almacenamiento/mysql/insert.sql

-- 3. Ejecutar las consultas
source almacenamiento/mysql/consultas.sql
```

---

## 👨‍💻 Autor

| Campo | Dato |
|---|---|
| Nombre | María Alejandra |
| Camper | Desarrollo de Software |
| Fecha | 27 Marzo 2026 |

---

> 💡 *"Primero hazlo funcionar, luego hazlo bien."*
