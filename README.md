Adds a complete, minimal Student Information System (SIS):

• ER model covering Programs, Courses, Students, Attempts, and Course prerequisites
• PostgreSQL DDL (normalized schema with PK/FK, CHECK constraints, enum for term, composite PK for Attempt)
• Sample data for quick testing and demo queries
• ER diagram image

Repository layout:
- diagrams/ERD.png            — Final ER diagram
- sql/01_schema          — CREATE TABLE statements (relational schema)
- sql/02_sample_data.sql      — Example INSERTs for testing
- Project_Report.pdf   — Report with PostgreSQL queries and sample outputs
- README.md                   — Project overview and quick start
