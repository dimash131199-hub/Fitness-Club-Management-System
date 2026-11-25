ALTER TABLE membership_types
ADD CONSTRAINT chk_membership_types_duration CHECK (duration_days > 0),
ADD CONSTRAINT chk_membership_types_price CHECK (price >= 0);

ALTER TABLE memberships
ADD CONSTRAINT chk_memberships_dates CHECK (end_date >= start_date),
ADD CONSTRAINT chk_memberships_status CHECK (status IN ('active', 'expired', 'frozen', 'cancelled'));

ALTER TABLE membership_payments
ADD CONSTRAINT chk_membership_payments_amount CHECK (amount > 0);

ALTER TABLE trainers
ADD CONSTRAINT chk_trainers_rate CHECK (hourly_rate >= 0);

ALTER TABLE workouts
ADD CONSTRAINT chk_workouts_duration CHECK (duration_minutes > 0);

ALTER TABLE group_classes
ADD CONSTRAINT chk_group_classes_capacity CHECK (max_capacity > 0);

ALTER TABLE class_registrations
ADD CONSTRAINT chk_class_reg_status CHECK (status IN ('registered', 'attended', 'cancelled', 'no_show'));

ALTER TABLE attendance
ADD CONSTRAINT chk_attendance_checkout CHECK (check_out IS NULL OR check_out >= check_in);

ALTER TABLE personal_training
ADD CONSTRAINT chk_pt_duration CHECK (duration_hours > 0),
ADD CONSTRAINT chk_pt_status CHECK (status IN ('scheduled', 'completed', 'cancelled'));

ALTER TABLE services
ADD CONSTRAINT chk_services_price CHECK (price >= 0);

ALTER TABLE service_payments
ADD CONSTRAINT chk_service_payments_amount CHECK (amount > 0);

CREATE INDEX idx_memberships_member_id ON memberships(member_id);
CREATE INDEX idx_memberships_status ON memberships(status);
CREATE INDEX idx_attendance_member_id ON attendance(member_id);
CREATE INDEX idx_group_classes_scheduled ON group_classes(scheduled_at);