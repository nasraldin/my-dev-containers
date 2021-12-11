/* -- # create root user and grant rights */
CREATE USER 'nasr'@'localhost' IDENTIFIED BY 'local';
GRANT ALL ON *.* TO 'nasr'@'%';

/* -- # create databases */
CREATE DATABASE IF NOT EXISTS `camunda`;
CREATE DATABASE IF NOT EXISTS `keycloak`;

/*
-- # create root user and grant rights
-- CREATE USER 'root'@'localhost' IDENTIFIED BY 'local';
-- GRANT ALL ON *.* TO 'root'@'%';
*/
