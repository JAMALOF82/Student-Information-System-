# Student Information System (SIS)

A compact database project that models a university’s **Programs, Courses, Students, Attempts**, and **Course prerequisites**.  
Includes an ER diagram, a PostgreSQL schema, and sample data so you can run queries immediately.

---

## Repository Structure
- `sql/01_schema.sql` — PostgreSQL DDL (tables, PK/FK, CHECKs, enum, composite PK)
- `sql/02_sample_data.sql` — INSERT statements (demo rows)
- `diagrams/ER_Model.png` — ER diagram
- `diagrams/Relational_Schema.png` — Relational schema
- `README.md`

---

## Data Model (overview)
- **Program**: `ProgramID (PK)`, `Name [unique]`, `RequiredCredits`
- **Course**: `CourseID (PK)`, `Name`, `Description`, `CreditPoints`, `ProgramID (FK → Program)`
- **Student**: `StudentID (PK)`, `FirstName`, `LastName`, `DateOfBirth`, `EnrollmentYear`, `ProgramID (FK → Program)`
- **Attempt** (Student↔Course with attributes):  
  `StudentID (FK)`, `CourseID (FK)`, `Year`, `Term {summer|winter}`, `Grade 0..15`, **PK** `(StudentID, CourseID, Year, Term)`
- **CoursePrerequisite** (Course↔Course relationship table):  
  `CourseID (FK)`, `PrereqCourseID (FK)`, **PK** `(CourseID, PrereqCourseID)`, rule `CourseID <> PrereqCourseID`

---

### psql
```sql
\i sql/01_schema.sql
\i sql/02_sample_data.sql
SET search_path = sis;
