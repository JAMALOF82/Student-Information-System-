SET search_path = sis;

INSERT INTO Program (ProgramID, Name, RequiredCredits) VALUES
  (1, 'Computer Science', 180),
  (2, 'Business IT',      180);

INSERT INTO Course (CourseID, Name, Description, CreditPoints, ProgramID) VALUES
  (1, 'Databases 1',     'Intro to relational databases', 5, 1),
  (2, 'Algorithms',      'Basic algorithms and complexity', 5, 1),
  (3, 'Web Development', 'Frontend & backend basics', 5, 1),
  (6, 'Programming 1',   'Variables, control flow, functions', 5, 1),
  (4, 'ER Modeling',     'Entity–Relationship modeling', 5, 2),
  (5, 'Accounting',      'Intro to financial accounting', 5, 2);

INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, EnrollmentYear, ProgramID) VALUES
  (1, 'Ebrahim', 'Al-Amoudi', '2000-06-15', 2024, 2),
  (2, 'Anna',    'Schmidt',   '2001-03-10', 2023, 1),
  (3, 'Max',     'Mueller',   '2002-11-20', 2024, 1);

INSERT INTO CoursePrerequisite (CourseID, PrereqCourseID) VALUES
  (2, 6), (3, 6), (1, 6);

INSERT INTO Attempt (StudentID, CourseID, Year, Term, Grade) VALUES
  (1, 4, 2025, 'summer', 12),
  (1, 5, 2025, 'winter', 10),
  (2, 6, 2023, 'winter', 14),
  (2, 1, 2024, 'summer', 13),
  (2, 2, 2025, 'winter', 11),
  (3, 2, 2025, 'summer', 6),
  (3, 2, 2025, 'winter', 12);
