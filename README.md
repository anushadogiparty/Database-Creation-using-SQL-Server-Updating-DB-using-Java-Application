# MYSQL - Project - Part 1 - Paper_Reviews Database

Implementation of Paper Reviews Database using MYSQL Server.

# Prerequisites

You need a MySQL database server and run the commands below through a user that has the following privileges:

```bash
SELECT, INSERT, UPDATE, DELETE, 
CREATE, DROP, RELOAD, REFERENCES, 
INDEX, ALTER, SHOW DATABASES, 
CREATE TEMPORARY TABLES, 
LOCK TABLES, EXECUTE, CREATE VIEW
```
#### Project: This Project includes implementation of the “paper reviewers” database. This project will be split into two parts. 

Part 1:

1. The first part will include setting up your development environment by installing MySQL
2. Writing SQL scripts to create the tables (entities), constraints etc modeled in the ER Diagram. 
3. Populating the Database using the SQL Queries.

Part 2:

	The second part will include creating a simple Java application to query and update your database.

## Installation

1. Download the repository
2. Change directory to the repository

Then run the following steps.

```A1
1. To Create Database    ---> CREATE DATABASE Paper_Reviews; 
2. To view list of Databases on the sql server ---> SHOW DATABASES; 
3. Switch to a database    ---> use Paper_Reviews;
```
#### Paper_Reviews Database tables must be created in the below mentioned sequence of order.

```A2
1. Author
2. Paper
3. Reviewer
4. Paper_Reviewer
5. Review
6. Topic
```
 Then run
 
```A3
4. Create tables as per .sql file using the below command
CREATE TABLE table_name (
    column1_name data_type constraints,
    column2_name data_type constraints,
    ....
);
5. To see all the tables in the DB   --->  SHOW TABLES;
6. To see database's Attribute formats  --->  describe [table name];
7. Populate data into tables as per .sql using the below command
INSERT INTO table_name (column1,column2,...) VALUES (value1,value2,...);
8. Show all the data in a table   ---> SELECT * FROM [table name];
9. quit;
```
### Repository Review_Database includes:

1. SQL script of the Database created.
2. Database Schema for “Paper Reviews” Database - ER diagram

### Credits
Anusha Dogiparthy

