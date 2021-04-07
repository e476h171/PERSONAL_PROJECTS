# Password Manager and Generator
Enclosed in this folder is my project built in ORACLE that generates a strong new password and manages all of your passwords in one place. 

## Table of Contents
1. Project Overview
2. Getting Started
3. Replication Steps
4. Results

## Project Overview
I, like most people, have a difficult times remembering my passwords and refraining from recycling the same 2 passwords out of sheer convience. There are countless methods to store your passwords ranging from simple pen and paper to using password keychains. This project highlights the process of database develop from start to finish. I started by creating two tables, a master table and a history log and populated them with random data (dont even think about stealing my Github password lol). From there I created a package that includes 1 function and 3 procedures. The project uses triggers

## Getting Started
* Install Benthic Golden or Sql Developer
* Create a new instance 
* Create a new user: 'test_user'

## Replication Steps
Please runs the above files in this order:

1. TBL_SCRIPT.SQL
2. INSERT_SCRIPT.SQL
3. DPKG_PASSWORD_MANAGER.SQL

## Results

## Conclusion
