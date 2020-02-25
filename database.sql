DROP DATABASE IF EXISTS ouate_tout_doux ;
CREATE DATABASE ouate_tout_doux CHARACTER SET 'utf-8';
USE ouate_tout_doux;


CREATE TABLE Users (
	idUser INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	mail VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL,
	sex VARCHAR(1),
	phone VARCHAR(30),
	age INT(6) UNSIGNED,
	dateCreation DATETIME NOT NULL
) ;

CREATE TABLE Lists (
	idList INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	dateCreation DATETIME NOT NULL,
	dateEnd DATETIME,
	idUserOwner INT(6) UNSIGNED NOT NULL,
	FOREIGN KEY (idUserOwner) REFERENCES Users(idUser) ON UPDATE CASCADE ON DELETE CASCADE
) ;

CREATE TABLE Participations (
	idParticipation INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	dateJoin DATETIME NOT NULL,
	idUser INT(6) UNSIGNED NOT NULL,
	idList INT(6) UNSIGNED NOT NULL,
	FOREIGN KEY (idUser) REFERENCES Users(idUser) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idList) REFERENCES Lists(idList) ON UPDATE CASCADE ON DELETE CASCADE
) ;

CREATE TABLE Tasks (
	idTask INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	dateCreation DATETIME NOT NULL,
	dateContribution DATETIME,
	state CHAR(1) UNSIGNED,
	idList INT(6) UNSIGNED NOT NULL,
	idUserCreation INT(6) UNSIGNED NOT NULL,
	idUserContribution  INT(6) UNSIGNED,
	FOREIGN KEY (idList) REFERENCES Lists(idList) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idUserCreation) REFERENCES Users(idUser) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idUserContribution) REFERENCES Users(idUser) ON UPDATE CASCADE ON DELETE CASCADE
) ;

CREATE TABLE Notifications (
	idNotif INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	about VARCHAR(50) NOT NULL,
	dateSending DATETIME NOT NULL,
	acceptedInvitation BOOL
) ;

CREATE TABLE Sendings (
	idSending INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	idUser INT(6) UNSIGNED NOT NULL,
	idNotif INT(6) UNSIGNED NOT NULL,
	FOREIGN KEY (idUser) REFERENCES Users(idUser) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (idNotif) REFERENCES Notifications(idNotif) ON UPDATE CASCADE ON DELETE CASCADE
) ;