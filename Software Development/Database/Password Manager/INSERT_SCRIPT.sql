--PWD_MGR_MASTER INSERT STATEMENTS
--FACEBOOK
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'FACEBOOK', 'EJH_123', '479gVzmaN', SYSDATE);

--GITHUB
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'GITHUB', 'JANE_DOE', 'j4eqiyEal', SYSDATE);    

--INSTAGRAM
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'INSTAGRAM', 'EJH_123', 'F1ZgE3buw', SYSDATE);

--LINKEDIN
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'LINKEDIN', 'JANE_DOE', 'zT1zZMdXl', SYSDATE);

--TWITTER
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'TWITTER', 'EJH_123', 'HSUqCxQuX', SYSDATE);

--YOUTUBE
INSERT INTO PWD_MGR_MASTER
(ID, PLATFORM, USERNAME, CURRENT_PASSWORD, CREATION_DATE)
VALUES
(PWD_MGR_SEQ.NEXTVAL, 'YOUTUBE', 'JANE_DOE', 'aklOtu1VX', SYSDATE);   

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

--PWD_MGR_HISTORY_LOG INSERT STATEMENTS

--FACEBOOK
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                        
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'FACEBOOK'), 'FACEBOOK' , 'BGrY0SWhc' , '9yUT8tGzb', 'E4vfJrGs5');

--GITHUB
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                        
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'GITHUB'), 'GITHUB' , 'AhDtu16du' , '5spHz1L6z', 'akF2xGtSh');

--INSTAGRAM
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                                      
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'INSTAGRAM'), 'INSTAGRAM' , 'BErieAgmB' , 'tx6zvDrJL', 'UnVWpfOS1');

--LINKEDIN
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                        
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'LINKEDIN'), 'LINKEDIN' , 'vactAJOn4' , 'yIzwRHvgT', 'yIzwRHvgT');

--TWITTER
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                        
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'TWITTER'), 'TWITTER' , 'NAApEiz6e' , 'wZVFG9orR', 'p8Mt9YF6i');

--YOUTUBE
INSERT INTO PWD_MGR_HISTORY_LOG
(ID, PLATFORM, PREVIOUS_PASSWORD, OLDER_PASSWORD, OLDEST_PASSWORD )
VALUES                                                        
((SELECT ID FROM PWD_MGR_MASTER WHERE PLATFORM = 'YOUTUBE'), 'YOUTUBE' , '8dBSxyt4g' , 'AIs88R2FK', 'yszCkilAH');

