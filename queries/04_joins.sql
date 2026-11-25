SELECT
    m.full_name,
    m.phone,
    mt.type_name,
    b.branch_name,
    ms.start_date,
    ms.end_date,
    ms.status
FROM memberships ms
JOIN members m ON ms.member_id = m.member_id
JOIN membership_types mt ON ms.type_id = mt.type_id
JOIN branches b ON ms.branch_id = b.branch_id
ORDER BY ms.end_date DESC;

SELECT
    gc.class_id,
    w.workout_name,
    b.branch_name,
    e.full_name AS trainer_name,
    gc.scheduled_at,
    gc.max_capacity
FROM group_classes gc
JOIN workouts w ON gc.workout_id = w.workout_id
JOIN branches b ON gc.branch_id = b.branch_id
JOIN trainers t ON gc.trainer_id = t.trainer_id
JOIN employees e ON t.employee_id = e.employee_id
ORDER BY gc.scheduled_at;

SELECT
    m.full_name AS member_name,
    s.service_name,
    b.branch_name,
    sp.amount,
    sp.paid_at
FROM service_payments sp
JOIN members m ON sp.member_id = m.member_id
JOIN services s ON sp.service_id = s.service_id
JOIN branches b ON sp.branch_id = b.branch_id;