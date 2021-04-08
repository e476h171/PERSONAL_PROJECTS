# Password Manager and Generator
Enclosed in this folder is my project built in SQL that generates a strong new password and manages all passwords in one place. 

## Table of Contents
1. Project Overview
2. Getting Started
3. Replication Steps
4. Results
5. Conclusion

## Project Overview
I, like most people, have a difficult time remembering my passwords and refraining from recycling the same 2 passwords out of sheer convience. There are countless methods to store  passwords, ranging from simple pen and paper to using password keychains. This project highlights the process of database develop from start to finish. I started by creating two tables, a master table and a history log and populated them with *random data* (dont even think about stealing my Github password lol). From there I created a package that includes 1 function and 3 procedures. They make use of techniques like triggers, sequences and calling procedures/functions inside another procedure.  

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

### Master Table [PWD_MGR_MASTER]
![Capture1](https://user-images.githubusercontent.com/78304652/113986552-085f3a00-9856-11eb-9bb3-a99853e517e1.PNG)


### History Details Table [PWD_MGR_HISTORY_LOG]
![Capture2](https://user-images.githubusercontent.com/78304652/113986562-0b5a2a80-9856-11eb-9e1c-5d1f5d521859.PNG)



## After calling the procedure for the Facebook attribute:
EXEC DPKG_PASSWORD_MANAGER.PASSWORD_GENERATOR(21);

### PWD_MGR_MASTER Table updated with new random password and creation date
![Capture3](https://user-images.githubusercontent.com/78304652/113987235-d8646680-9856-11eb-962a-a555573fc90f.PNG)

### PWD_MGR_HISTORY_LOG updated with last 3 passwords.
![Capture4](https://user-images.githubusercontent.com/78304652/113987241-dac6c080-9856-11eb-83a3-fb6214ac33c5.PNG)

## Calling a Multi Select Getter: EXEC	DPKG_PASSWORD_MANAGER.PASSWORD_MANAGER_GETTER(:CURSOR, :P_ERR_CODE, :P_ERR_MSG, 'FACEBOOK,INSTAGRAM,TWITTER');

![Capture5](https://user-images.githubusercontent.com/78304652/113987827-7fe19900-9857-11eb-864c-3affae5067d8.PNG)


## Conclusion
This project was a great 'half-a-day' type of build and highlights the iteration of an idea from start to finish. Permission is granted to any front end devs who want to use this project to aid in building out an interface for the password manager.

