DROP DATABASE IF EXISTS Lifeline;
CREATE DATABASE Lifeline;
USE Lifeline;

CREATE TABLE student_user (
    student_id BIGINT UNSIGNED NOT NULL, -- Does not auto-increment because it is assigned using the number on a student's ID card
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) NOT NULL,
    pass VARCHAR(30), -- password is a reserved word in sql 
    username VARCHAR(30),
    PRIMARY KEY (student_id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE student_medical_info (
    id INT UNSIGNED NOT NULL, 
    student_id BIGINT UNSIGNED NOT NULL,
    dob DATE,
    heart_problems BOOL,
    heart_problems_medications VARCHAR(100),
    pacemaker BOOL,
    pacemaker_medications VARCHAR(100),
    diabetes BOOL,
    diabetes_medications VARCHAR(100),
    high_bp BOOL,
    high_bp_medications VARCHAR(100),
    stroke BOOL,
    stroke_medications VARCHAR(100),
    asthma_copd BOOL,
    asthma_copd_medications VARCHAR(100),
    seizures BOOL,
    seizures_medications VARCHAR(100),
    cancer BOOL,
    cancer_medications VARCHAR(100),
    allergies VARCHAR(100),
    other VARCHAR(100),
    last_update DATE,
    PRIMARY KEY (id), -- uniqueness-- Primary key is foreign key to student_id since there is a one-to-zero-or-one relationship
    FOREIGN KEY (student_id)
        REFERENCES student_user(student_id)
        ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE emergency_contacts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT, -- Separate id is used since a student can have more than one emergency contact
    student_id BIGINT UNSIGNED NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    cphone_number VARCHAR(14), -- Allows for hyphens and country code 1
    hphone_number VARCHAR(14),
    PRIMARY KEY (id),
    FOREIGN KEY (student_id)
        REFERENCES student_user(student_id)
        ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;


