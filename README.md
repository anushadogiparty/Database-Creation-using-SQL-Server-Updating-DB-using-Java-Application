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
## Project: This Project includes implementation of the “paper reviewers” database. This project will be split into two parts. 

Part 1:

1. The first part will include setting up your development environment by installing MySQL
2. Writing SQL scripts to create the tables (entities), constraints etc modeled in the ER Diagram. 
3. Populating the Database using the SQL Queries.

Part 2:

	The second part will include creating a simple Java application to query and update your database.

## Installation

1. Download the repository
2. Change directory to the repository

Then run

```A1
To view list of Databases on the sql server ---> SHOW DATABASES; 
Switch to a database    ---> use [db name];
To see all the tables in the DB   --->  SHOW TABLES;
```

#### Paper_Reviews Database tables must be executed in the below mentioned sequence of order.

```A2
1. Author
2. Paper
3. Reviewer
4. Paper_Reviewer
5. Review
6. Topic
```
#### Run the below commands in the sequence of order mentioned above.
 
```A3
To see database's Attribute formats  --->  describe [table name];
Show all data in a table   ---> SELECT * FROM [table name];
```

### Repository Review_Database includes:

• SQL script of the Database created.
• Database Schema for “Paper Reviews” Database - ER diagram

### Credits
Anusha Dogiparthy

