-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM students 
WHERE EnrollmentDate LIKE "2023%";


-- 2. Find students whose email contains 'gmail.com'.
SELECT * FROM Students
WHERE EMAIL LIKE "%gmail.com";

-- 3. Count how many students are enrolled in the database.
SELECT 
	count(StudentID) 
FROM 
	students;

-- 4. Find students born between 2000 and 2005.
SELECT * FROM Students 
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2005-12-31';

-- 5. List students sorted by last name in descending order.
SELECT * FROM Students 
Order by LastName DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT FirstName, LastName, CourseName 
FROM Students 
JOIN Enrollments ON Students.studentID = enrollments.studentID
JOIN courses on enrollments.courseid = courses.courseid;

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).

SELECT FirstName, LastName, CourseName
FROM Students 
LEFT JOIN enrollments on students.studentID = enrollments.studentID
LEFT JOIN courses on enrollments.courseid = courses.courseid;

-- 8. Find all courses with no students enrolled (LEFT JOIN).

SELECT CourseName
FROM Courses
LEFT JOIN enrollments ON courses.courseID = enrollments.courseID
WHERE enrollments.studentID IS NULL;


-- 10. List courses and show the number of students enrolled in each course.

SELECT coursename, count(enrollments.StudentID) AS StudentCount
FROM courses
LEFT JOIN enrollments ON courses.courseID = enrollments.courseID
GROUP BY courses.coursename, courses.courseID;

