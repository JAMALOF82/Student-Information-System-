-- schema = sis
CREATE SCHEMA IF NOT EXISTS sis;
SET search_path = sis;

DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'term_enum') THEN
    CREATE TYPE term_enum AS ENUM ('summer','winter');
  END IF;
END $$;

CREATE TABLE Program (
  ProgramID        SERIAL PRIMARY KEY,
  Name             VARCHAR(100) NOT NULL UNIQUE,
  RequiredCredits  SMALLINT     NOT NULL CHECK (RequiredCredits BETWEEN 0 AND 400)
);

CREATE TABLE Course (
  CourseID      SERIAL PRIMARY KEY,
  Name          VARCHAR(150) NOT NULL,
  Description   VARCHAR(1000),
  CreditPoints  SMALLINT     NOT NULL CHECK (CreditPoints BETWEEN 1 AND 30),
  ProgramID     INT          NOT NULL REFERENCES Program(ProgramID)
);

CREATE TABLE Student (
  StudentID      SERIAL PRIMARY KEY,
  FirstName      VARCHAR(60) NOT NULL,
  LastName       VARCHAR(60) NOT NULL,
  DateOfBirth    DATE        NOT NULL CHECK (DateOfBirth <= CURRENT_DATE),
  EnrollmentYear SMALLINT    NOT NULL CHECK (EnrollmentYear BETWEEN 1900 AND 2100),
  ProgramID      INT         NOT NULL REFERENCES Program(ProgramID)
);

CREATE TABLE Attempt (
  StudentID  INT       NOT NULL REFERENCES Student(StudentID),
  CourseID   INT       NOT NULL REFERENCES Course(CourseID),
  Year       SMALLINT  NOT NULL CHECK (Year BETWEEN 1900 AND 2100),
  Term       term_enum NOT NULL,
  Grade      SMALLINT  CHECK (Grade BETWEEN 0 AND 15),
  PRIMARY KEY (StudentID, CourseID, Year, Term)
);

CREATE TABLE CoursePrerequisite (
  CourseID        INT NOT NULL REFERENCES Course(CourseID),
  PrereqCourseID  INT NOT NULL REFERENCES Course(CourseID),
  PRIMARY KEY (CourseID, PrereqCourseID),
  CONSTRAINT prereq_no_self_reference CHECK (CourseID <> PrereqCourseID)
);
