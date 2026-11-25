SELECT
    mt.type_name AS membership_type,
    COUNT(mp.payment_id) AS payments_count,
    COALESCE(SUM(mp.amount), 0) AS total_revenue
FROM membership_types mt
LEFT JOIN memberships m ON mt.type_id = m.type_id
LEFT JOIN membership_payments mp ON m.membership_id = mp.membership_id
GROUP BY mt.type_id, mt.type_name
ORDER BY total_revenue DESC;

SELECT
    b.branch_name,
    b.city,
    COALESCE(mp_sum.membership_revenue, 0) AS membership_revenue,
    COALESCE(sp_sum.service_revenue, 0) AS service_revenue,
    COALESCE(mp_sum.membership_revenue, 0) + COALESCE(sp_sum.service_revenue, 0) AS total_branch_revenue
FROM branches b
LEFT JOIN (
    SELECT m.branch_id, SUM(mp.amount) AS membership_revenue
    FROM memberships m
    JOIN membership_payments mp ON m.membership_id = mp.membership_id
    GROUP BY m.branch_id
) mp_sum ON b.branch_id = mp_sum.branch_id
LEFT JOIN (
    SELECT branch_id, SUM(amount) AS service_revenue
    FROM service_payments
    GROUP BY branch_id
) sp_sum ON b.branch_id = sp_sum.branch_id
ORDER BY total_branch_revenue DESC;

SELECT
    e.full_name AS trainer_name,
    t.specialization,
    t.hourly_rate,
    COALESCE(gc_hours.group_hours, 0) AS group_class_hours,
    COALESCE(pt_hours.personal_hours, 0) AS personal_training_hours,
    COALESCE(gc_hours.group_hours, 0) + COALESCE(pt_hours.personal_hours, 0) AS total_hours,
    (COALESCE(gc_hours.group_hours, 0) + COALESCE(pt_hours.personal_hours, 0)) * t.hourly_rate AS estimated_payout
FROM trainers t
JOIN employees e ON t.employee_id = e.employee_id
LEFT JOIN (
    SELECT
        gc.trainer_id,
        ROUND(SUM(w.duration_minutes) / 60.0, 2) AS group_hours
    FROM group_classes gc
    JOIN workouts w ON gc.workout_id = w.workout_id
    GROUP BY gc.trainer_id
) gc_hours ON t.trainer_id = gc_hours.trainer_id
LEFT JOIN (
    SELECT
        trainer_id,
        ROUND(SUM(duration_hours), 2) AS personal_hours
    FROM personal_training
    WHERE status IN ('completed', 'scheduled')
    GROUP BY trainer_id
) pt_hours ON t.trainer_id = pt_hours.trainer_id
ORDER BY total_hours DESC;

SELECT
    m.member_id,
    m.full_name,
    COUNT(a.attendance_id) AS visits_count,
    ROUND(
        COALESCE(SUM(EXTRACT(EPOCH FROM (a.check_out - a.check_in)) / 3600.0), 0)::numeric,
        2
    ) AS total_hours_in_club,
    MAX(a.check_in) AS last_visit
FROM members m
LEFT JOIN attendance a ON m.member_id = a.member_id
GROUP BY m.member_id, m.full_name
ORDER BY visits_count DESC, total_hours_in_club DESC;

SELECT
    gc.class_id,
    w.workout_name,
    b.branch_name,
    e.full_name AS trainer_name,
    gc.scheduled_at,
    gc.max_capacity,
    COUNT(cr.registration_id) FILTER (WHERE cr.status = 'attended') AS attended_count,
    ROUND(
        (COUNT(cr.registration_id) FILTER (WHERE cr.status = 'attended')::numeric / NULLIF(gc.max_capacity, 0)) * 100,
        1
    ) AS occupancy_percent
FROM group_classes gc
JOIN workouts w ON gc.workout_id = w.workout_id
JOIN branches b ON gc.branch_id = b.branch_id
JOIN trainers t ON gc.trainer_id = t.trainer_id
JOIN employees e ON t.employee_id = e.employee_id
LEFT JOIN class_registrations cr ON gc.class_id = cr.class_id
GROUP BY gc.class_id, w.workout_name, b.branch_name, e.full_name, gc.scheduled_at, gc.max_capacity
ORDER BY gc.scheduled_at;

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