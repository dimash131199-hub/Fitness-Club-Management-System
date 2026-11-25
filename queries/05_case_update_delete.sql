SELECT
    membership_id,
    member_id,
    end_date,
    CASE
        WHEN status = 'active' THEN 'Активный абонемент'
        WHEN status = 'expired' THEN 'Срок истек'
        ELSE 'Другой статус'
    END AS status_label
FROM memberships;

UPDATE memberships
SET status = 'expired'
WHERE end_date < CURRENT_DATE AND status = 'active';

UPDATE personal_training
SET status = 'completed'
WHERE pt_id = 3 AND status = 'scheduled';

DELETE FROM class_registrations
WHERE status = 'cancelled';