DROP DATABASE IF EXISTS Lifeline;
CREATE DATABASE Lifeline;
USE Lifeline;

CREATE TABLE user (
    id BIGINT UNSIGNED NOT NULL, -- Does not auto-increment because it is assigned using the number on a student's ID card
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) NOT NULL,
    pass VARCHAR(256), -- password is a reserved word in sql 
    username VARCHAR(30),
	account_type INT,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE student_medical_info (
    id BIGINT UNSIGNED NOT NULL, 
    student_id BIGINT UNSIGNED NOT NULL,
    dob DATE,
    heart_problems VARCHAR(24),
    heart_problems_medications VARCHAR(1024),
    pacemaker VARCHAR(24),
    pacemaker_medications VARCHAR(1024),
    diabetes VARCHAR(24),
    diabetes_medications VARCHAR(1024),
    high_bp VARCHAR(24),
    high_bp_medications VARCHAR(1024),
    stroke VARCHAR(24),
    stroke_medications VARCHAR(1024),
    asthma_copd VARCHAR(24),
    asthma_copd_medications VARCHAR(1024),
    seizures VARCHAR(24),
    seizures_medications VARCHAR(1024),
    cancer VARCHAR(24),
    cancer_medications VARCHAR(1024),
	allergies VARCHAR(24),
    allergies_medications VARCHAR(1024),
	other VARCHAR(24), 
    other_medications VARCHAR(1024),
    last_update DATE,
    PRIMARY KEY (student_id), -- uniqueness-- Primary key is foreign key to student_id since there is a one-to-zero-or-one relationship
    FOREIGN KEY (id)
        REFERENCES user(id)
        ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE emergency_contacts (
    id BIGINT UNSIGNED NOT NULL,
    student_id BIGINT UNSIGNED NOT NULL,
    e_first_name VARCHAR(30),
    e_last_name VARCHAR(30),
	relation VARCHAR(30),
    phone_number VARCHAR(14), -- Allows for hyphens and country code 1
    PRIMARY KEY (student_id),
    FOREIGN KEY (id)
        REFERENCES user(id)
        ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE recent_lookups ( 
	search_time TIMESTAMP NOT NULL, 
	student_id BIGINT UNSIGNED NOT NULL, 
	PRIMARY KEY (search_time), 
	FOREIGN KEY(student_id)
		REFERENCES user(id)
		ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE ems_employees (
	ems_id BIGINT NOT NULL, 
	fname VARCHAR(30), 
	lname VARCHAR(30),
	PRIMARY KEY (ems_id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
