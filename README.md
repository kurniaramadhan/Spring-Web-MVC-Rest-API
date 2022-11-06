# Spring-Web-MVC-Rest-API
Spring-Web-MVC-Rest-API is a web application developed using Spring Framework and Hibernate. Some of the technology stacks used in this application are:
- Programming Language: Java
- Databases: MySQL
- Local web server: XAMPP (includes php, mysql, and apache)
- IDE: Eclipse
- Visual Database Management: phpMyAdmin or Heidi SQL
- Login Access: username: kurniaramadhan pass: 1234567

## Feature:
- Login with Role: Admin, Manager, and Employee
- Register
- Create Customer
- List Customer
- Edit Customer
- Delete Customer
- Logout

## Configuration:
- Clone this project and save in your directory
- Create database in your local DBMS using phpMydmin or Heidi SQL or can also be done through the command prompt by typing the command: mysql > create database spring_security_custom_user_demo;
- Import the spring_security_custom_user_demo.sql database containing the DDL of tables and data into your DBMS (database spring_security_custom_user_demo)
- Open the application using IDE Eclipse, and configure the database in the file persistence-mysql.properties in src>main>resources

#### persistence-mysql.properties
```Java
# JDBC connection properties
#
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/spring_security_custom_user_demo?useSSL=false&serverTimezone=UTC
jdbc.user=springstudent
jdbc.password=springstudent

#
# Connection pool properties
#
connection.pool.initialPoolSize=5
connection.pool.minPoolSize=5
connection.pool.maxPoolSize=20
connection.pool.maxIdleTime=3000

#
# Hibernate properties
#
hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
hibernate.show_sql=true
hiberante.packagesToScan=com.dewacoding.springsecurity.demo.entity
```

## Running the Project
- Right click project in Eclipse, then Run on Server

