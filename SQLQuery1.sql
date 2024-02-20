
use MyDB;

 CREATE TABLE college (
    college_id INT PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT);

	CREATE TABLE student (
    student_id INT PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE,
    email TEXT,
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES college(college_id));

	select * from student;
	select * from college;

	INSERT INTO college values
    (1, 'ABC University', 'CityA'),
    (2, 'XYZ College', 'CityB');
    
	insert into student values
	(101, 'Lokesh', 'R', '2000-april-06', 'Lokesh@gmail.com', 1),
	(102, 'somesh', 's', '2001-02-09','Somesh@gmail.com', 1),
	(103, 'will', 'w', '2000-07-29','will@gmail.com', 2),
	(104, 'rock', 'r', '2001-01-10','rock@gmail.com', 1),
	(105, 'smith', 's', '2001-12-19','smith@gmail.com', 2);

	update student set email='Lokesh123@gmail.com' where student_id=101;

	delete from student where email='smith@gamil.com' and student_id=105;

	select * from student;
	select * from college;

	