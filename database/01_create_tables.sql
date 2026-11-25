CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    branch_name VARCHAR(120) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(30)
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branches(branch_id),
    full_name VARCHAR(150) NOT NULL,
    position VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    hire_date DATE NOT NULL
);

CREATE TABLE trainers (
    trainer_id SERIAL PRIMARY KEY,
    employee_id INT UNIQUE REFERENCES employees(employee_id),
    specialization VARCHAR(120) NOT NULL,
    hourly_rate NUMERIC(10, 2) NOT NULL
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE,
    birth_date DATE,
    joined_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE membership_types (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    duration_days INT NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE memberships (
    membership_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    type_id INT REFERENCES membership_types(type_id),
    branch_id INT REFERENCES branches(branch_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE membership_payments (
    payment_id SERIAL PRIMARY KEY,
    membership_id INT REFERENCES memberships(membership_id),
    amount NUMERIC(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL
);

CREATE TABLE workout_types (
    workout_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE workouts (
    workout_id SERIAL PRIMARY KEY,
    workout_type_id INT REFERENCES workout_types(workout_type_id),
    workout_name VARCHAR(150) NOT NULL,
    duration_minutes INT NOT NULL
);

CREATE TABLE group_classes (
    class_id SERIAL PRIMARY KEY,
    branch_id INT REFERENCES branches(branch_id),
    workout_id INT REFERENCES workouts(workout_id),
    trainer_id INT REFERENCES trainers(trainer_id),
    scheduled_at TIMESTAMP NOT NULL,
    max_capacity INT NOT NULL
);

CREATE TABLE class_registrations (
    registration_id SERIAL PRIMARY KEY,
    class_id INT REFERENCES group_classes(class_id),
    member_id INT REFERENCES members(member_id),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    branch_id INT REFERENCES branches(branch_id),
    check_in TIMESTAMP NOT NULL,
    check_out TIMESTAMP
);

CREATE TABLE personal_training (
    pt_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    trainer_id INT REFERENCES trainers(trainer_id),
    branch_id INT REFERENCES branches(branch_id),
    session_date TIMESTAMP NOT NULL,
    duration_hours NUMERIC(4, 2) NOT NULL,
    status VARCHAR(30) NOT NULL
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(120) NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE service_payments (
    service_payment_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members(member_id),
    service_id INT REFERENCES services(service_id),
    branch_id INT REFERENCES branches(branch_id),
    amount NUMERIC(10, 2) NOT NULL,
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);