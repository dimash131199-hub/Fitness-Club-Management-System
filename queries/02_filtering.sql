SELECT member_id, full_name, phone, joined_at
FROM members
WHERE joined_at >= '2026-02-01'
ORDER BY joined_at DESC;

SELECT membership_id, member_id, start_date, end_date, status
FROM memberships
WHERE status = 'active' AND end_date >= '2026-03-01';

SELECT trainer_id, specialization, hourly_rate
FROM trainers
WHERE hourly_rate >= 6500.00;

SELECT class_id, branch_id, scheduled_at, max_capacity
FROM group_classes
WHERE max_capacity >= 15 AND scheduled_at >= '2026-03-10 00:00:00';