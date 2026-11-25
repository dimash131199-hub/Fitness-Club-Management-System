INSERT INTO branches (branch_name, city, address, phone) VALUES
('Fitness Club Prime', 'Алматы', 'пр. Абая, 150', '+7 727 310 11 22'),
('Fitness Club Aqua & Spa', 'Алматы', 'ул. Розыбакиева, 247', '+7 727 310 33 44');

INSERT INTO employees (branch_id, full_name, position, phone, hire_date) VALUES
(1, 'Нурлан Сериков', 'Старший тренер', '+7 701 555 10 01', '2024-02-15'),
(1, 'Айгерим Касымова', 'Тренер групповых программ', '+7 701 555 10 02', '2024-05-01'),
(2, 'Данияр Оспанов', 'Персональный тренер', '+7 702 555 10 03', '2024-08-10'),
(1, 'Мадина Нурпеисова', 'Администратор рецепции', '+7 705 555 10 04', '2025-01-20'),
(2, 'Тимур Садыков', 'Менеджер филиала', '+7 707 555 10 05', '2023-11-05');

INSERT INTO trainers (employee_id, specialization, hourly_rate) VALUES
(1, 'Силовой тренинг и функционал', 7000.00),
(2, 'Йога, пилатес и стретчинг', 6000.00),
(3, 'Бокс и кардио-подготовка', 6500.00);

INSERT INTO members (full_name, phone, email, birth_date, joined_at) VALUES
('Алихан Жумабаев', '+7 777 200 01 01', 'alikhan.zh@example.com', '1998-04-12', '2026-01-10'),
('Динара Ахметова', '+7 777 200 01 02', 'dinara.akhm@example.com', '2001-09-23', '2026-01-18'),
('Ержан Токтаров', '+7 777 200 01 03', 'erzhan.t@example.com', '1995-12-03', '2026-02-05'),
('Аружан Смагулова', '+7 777 200 01 04', 'aruzhan.sm@example.com', '2000-07-19', '2026-02-14'),
('Максат Бекенов', '+7 777 200 01 05', 'maksat.b@example.com', '1992-03-28', '2026-03-01');

INSERT INTO membership_types (type_name, duration_days, price) VALUES
('Базовый (1 месяц)', 30, 18000.00),
('Стандарт (3 месяца)', 90, 48000.00),
('Безлимит + SPA (6 месяцев)', 180, 95000.00);

INSERT INTO memberships (member_id, type_id, branch_id, start_date, end_date, status) VALUES
(1, 2, 1, '2026-01-10', '2026-04-10', 'active'),
(2, 1, 1, '2026-01-18', '2026-02-17', 'expired'),
(3, 3, 2, '2026-02-05', '2026-08-04', 'active'),
(4, 2, 2, '2026-02-14', '2026-05-15', 'active'),
(5, 1, 1, '2026-03-01', '2026-03-31', 'expired');

INSERT INTO membership_payments (membership_id, amount, payment_date, payment_method) VALUES
(1, 48000.00, '2026-01-10 10:15:00', 'Kaspi QR'),
(2, 18000.00, '2026-01-18 14:20:00', 'Банковская карта'),
(3, 95000.00, '2026-02-05 11:05:00', 'Apple Pay'),
(4, 48000.00, '2026-02-14 18:40:00', 'Kaspi QR'),
(5, 18000.00, '2026-03-01 09:30:00', 'Наличные');

INSERT INTO workout_types (type_name, description) VALUES
('Тренажерный зал', 'Самостоятельные и силовые тренировки на тренажерах'),
('Групповые занятия', 'Занятия в группе под руководством тренера'),
('Единоборства', 'Бокс, кикбоксинг и функциональная выносливость');

INSERT INTO workouts (workout_type_id, workout_name, duration_minutes) VALUES
(2, 'Утренняя Hatha Yoga', 60),
(2, 'Full Body Functional', 50),
(3, 'Boxing Technique', 60),
(1, 'Strength & Conditioning', 75);

INSERT INTO group_classes (branch_id, workout_id, trainer_id, scheduled_at, max_capacity) VALUES
(1, 1, 2, '2026-03-10 08:30:00', 15),
(1, 2, 1, '2026-03-10 19:00:00', 20),
(2, 3, 3, '2026-03-11 18:00:00', 12),
(1, 1, 2, '2026-03-12 08:30:00', 15);

INSERT INTO class_registrations (class_id, member_id, registered_at, status) VALUES
(1, 2, '2026-03-09 15:00:00', 'attended'),
(1, 4, '2026-03-09 16:10:00', 'attended'),
(2, 1, '2026-03-10 12:00:00', 'attended'),
(2, 5, '2026-03-10 13:45:00', 'cancelled'),
(3, 3, '2026-03-11 10:20:00', 'attended');

INSERT INTO attendance (member_id, branch_id, check_in, check_out) VALUES
(1, 1, '2026-03-10 18:50:00', '2026-03-10 20:25:00'),
(2, 1, '2026-03-10 08:20:00', '2026-03-10 09:40:00'),
(3, 2, '2026-03-11 17:45:00', '2026-03-11 19:30:00'),
(4, 2, '2026-03-11 11:00:00', '2026-03-11 12:20:00'),
(1, 1, '2026-03-12 18:30:00', '2026-03-12 20:00:00');

INSERT INTO personal_training (member_id, trainer_id, branch_id, session_date, duration_hours, status) VALUES
(1, 1, 1, '2026-03-10 17:00:00', 1.50, 'completed'),
(3, 3, 2, '2026-03-11 16:00:00', 1.00, 'completed'),
(4, 2, 2, '2026-03-12 12:00:00', 1.00, 'scheduled'),
(1, 1, 1, '2026-03-14 17:00:00', 1.50, 'scheduled');

INSERT INTO services (service_name, price) VALUES
('Финская сауна и хаммам', 5000.00),
('Аренда шкафчика и полотенца', 1500.00),
('InBody анализ состава тела', 8000.00);

INSERT INTO service_payments (member_id, service_id, branch_id, amount, paid_at) VALUES
(3, 1, 2, 5000.00, '2026-03-11 19:35:00'),
(1, 3, 1, 8000.00, '2026-03-10 20:30:00'),
(4, 2, 2, 1500.00, '2026-03-11 12:25:00');