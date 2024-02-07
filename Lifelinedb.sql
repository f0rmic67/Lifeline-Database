CREATE TABLE student_user (
student_ID smallint unsigned NOT NULL AUTO_INCREMENT,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
email varchar(50) NOT NULL,
password varchar(30),
PRIMARY KEY (student_ID)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE student_medical_info (
ID smallint unsigned NOT NULL AUTO_INCREMENT,
student_ID smallint unsigned NOT NULL,
f_name varchar(30),
l_name varchar(30),
dob date ,
heart_problems bool,
pacemaker bool,
diabetes bool,
high_bp bool,
stroke bool,
asthma_copd bool,
seizures bool,
cancer bool,
allergies varchar(100),
other varchar(100),
last_update date,
PRIMARY KEY (ID),
FOREIGN KEY (student_ID)
	REFERENCES student_user(student_ID)
    ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;

CREATE TABLE emergency_contacts (
ID INT unsigned NOT NUll AUTO_INCREMENT,
student_ID smallint unsigned NOT NULL,
f_name varchar(30),
l_name varchar (30),
cphone_number varchar(10),
hphone_number varchar(10),
PRIMARY KEY (ID),
FOREIGN KEY (student_ID)
	REFERENCES student_user(student_ID)
    ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4;
