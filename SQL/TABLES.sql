
use RwaWF
go

CREATE TABLE Person
(
	IDPerson nvarchar(36) primary key,
	FristName nvarchar(25),
	Surname nvarchar(25),
	Telephone nvarchar(25),
	UserPassword nvarchar(25),
	IsAdmin bit,
	CityID int
)
go

CREATE TABLE Email
(
	ID int primary key identity(1,1),
	Email nvarchar(50),
	PersonID nvarchar(36),
	FOREIGN KEY(PersonID) REFERENCES Person(IDPerson)
)
go

