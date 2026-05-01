create database edu_pro;
use edu_pro;

create table teachers (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    salary decimal(10,2) check (salary >= 0)
);

create table courses (
    id int primary key auto_increment,
    course_name varchar(100) not null,
    teacher_id int,
    credits int check (credits > 0),
    tuition_fee decimal(10,2) check (tuition_fee >= 0),
    foreign key (teacher_id) references teachers(id)
);

create table students (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    date_of_birth date,
    gender enum('male','female','other')
);

create table enrollments (
    id int primary key auto_increment,
    student_id int,
    course_id int,
    date date,
    score decimal(5,2),
    foreign key (student_id) references students(id),
    foreign key (course_id) references courses(id)
);

insert into teachers (full_name, salary) values
	('Nguyễn Văn An', 10000000),
	('Trần Thị Bình', 12000000),
	('Lê Văn Cường', 11000000);

insert into courses (course_name, teacher_id, credits, tuition_fee) values
	('IT Cơ Bản', 1, 3, 2000000),
	('Lập Trình IT Nâng Cao', 1, 4, 3000000),
	('Toán Cao Cấp', 2, 3, 1800000),
	('Tiếng Anh Giao Tiếp', 3, 2, 1500000),
	('Khoa Học Dữ Liệu IT', 1, 4, 3500000),
	('Kỹ Năng Mềm', null, 2, 1000000);

insert into students (full_name, date_of_birth, gender) values
	('Nguyễn Minh Anh', '2000-01-01', 'male'),
	('Trần Thị Mai', '2000-02-01', 'female'),
	('Lê Quốc Bảo', '2000-03-01', 'male'),
	('Phạm Thu Hà', '2000-04-01', 'female'),
	('Hoàng Gia Huy', '2000-05-01', 'male'),
	('Võ Ngọc Linh', '2000-06-01', 'female'),
	('Đặng Văn Nam', '2000-07-01', 'male'),
	('Bùi Thị Lan', '2000-08-01', 'female'),
	('Ngô Quang Huy', '2000-09-01', 'male'),
	('Phan Thị Hương', '2000-10-01', 'female');

insert into enrollments (student_id, course_id, date, score) values
	(1,1,'2024-01-01',8),
	(2,1,'2024-01-02',7),
	(3,2,'2024-01-03',9),
	(4,2,'2024-01-04',6),
	(5,3,'2024-01-05',8.5),
	(6,3,'2024-01-06',7.5),
	(7,4,'2024-01-07',9),
	(8,4,'2024-01-08',8),
	(9,5,'2024-01-09',7),
	(10,5,'2024-01-10',6),
	(1,3,'2024-01-11',8),
	(2,4,'2024-01-12',null),
	(3,5,'2024-01-13',null),
	(4,1,'2024-01-14',7),
	(5,2,'2024-01-15',8);

update teachers
set salary = salary * 1.1
where id in (
    select teacher_id
    from courses
    where course_name like '%IT%'
);