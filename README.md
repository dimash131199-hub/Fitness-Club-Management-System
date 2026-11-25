# Fitness Club Management System

Реляционная база данных (PostgreSQL), тестовые данные, аналитические SQL-запросы и документация для системы управления фитнес-клубом (Case 13).

## Структура репозитория

- `README.md` — общее описание проекта и навигация
- `docs/` — техническое описание, документация БД, ER-диаграмма (`erd.png`) и отчёт (`final_report.pdf`)
- `database/` — DDL-скрипты создания таблиц, ограничений и наполнения тестовыми данными (`01_create_tables.sql`, `02_insert_data.sql`, `03_constraints.sql`)
- `queries/` — SQL-запросы от базовых выборок до бизнес-аналитики (`01`–`06`)
- `results/` — результаты запросов (`query_results/`) и сводка анализа (`analysis_summary.md`)

## ER-диаграмма

![ER Diagram](docs/erd.png)