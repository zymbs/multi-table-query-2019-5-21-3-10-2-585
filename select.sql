# 1.查询同时存在1课程和2课程的情况
SELECT * 
FROM (SELECT * FROM student_course WHERE courseId = 01) AS a,(SELECT * FROM student_course WHERE courseId = 02) AS b 
WHERE a.studentId = b.studentId;

# 2.查询同时存在1课程和2课程的情况
SELECT * 
FROM (SELECT * FROM student_course WHERE courseId = 01) AS a,(SELECT * FROM student_course WHERE courseId = 02) AS b 
WHERE a.studentId = b.studentId;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT id, name, a FROM student AS b JOIN
      (SELECT studentId,AVG(score) AS a FROM student_course GROUP BY studentid HAVING a>60)c
ON b.id = c.studentId;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student WHERE student.id  NOT IN (SELECT student_course.studentId FROM student_course);

# 5.查询所有有成绩的SQL
SELECT DISTINCT student.* FROM student JOIN student_course ON student.id=student_course.studentId; 

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
SELECT student.* FROM  student JOIN 
(SELECT DISTINCT a.studentId FROM (SELECT * FROM student_course WHERE courseId = 01) AS a 
JOIN (SELECT * FROM student_course WHERE courseId = 02) AS b ON a.studentId=b.studentId)c
ON student.id=c.studentId;

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT student.*, student_course.score FROM 
student JOIN student_course ON student.id=student_course.studentID WHERE student_course.courseId='1' AND student_course.score<60
ORDER BY student_course.score DESC;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId,CAST(AVG(score) AS decimal(5,2)) avgscore FROM student_course GROUP BY courseId ORDER BY avgscore DESC,courseId ASC; 

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT student.name,score FROM student JOIN student_course on student.id=student_course.studentID 
JOIN course ON course.id=student_course.courseId WHERE course.name='数学' AND score <60; 
