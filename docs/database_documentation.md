# Database Documentation

База данных состоит из 15 связанных таблиц:
- `branches`, `employees`, `trainers` — филиалы, персонал и тренеры
- `members`, `membership_types`, `memberships`, `membership_payments` — клиенты, тарифы абонементов, договоры и платежи
- `workout_types`, `workouts`, `group_classes`, `class_registrations`, `personal_training` — программы тренировок, групповое расписание, записи и персональные сессии
- `attendance` — журнал входов и выходов клиентов
- `services`, `service_payments` — дополнительные услуги и оплаты по ним

Схема связей визуализирована в файле `docs/erd.png`.