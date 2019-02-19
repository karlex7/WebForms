
use RwaWF
go

CREATE PROC AddPerson
	@idPerson nvarchar(36),
	@firstName nvarchar(25),
	@surname nvarchar(25),
	@telephone nvarchar(25),
	@password nvarchar(25),
	@isAdmin bit,
	@cityId int
AS
BEGIN
	INSERT INTO Person(IDPerson,FristName,Surname,Telephone,UserPassword,IsAdmin,CityID)
	VALUES (@idPerson,@firstName,@surname,@telephone,@password,@isAdmin,@cityId)
END
go

CREATE PROC AddEmail
	@email nvarchar(50),
	@personId nvarchar(36)
AS
BEGIN
	INSERT INTO Email(Email,PersonID)
	VALUES(@email,@personId)
END
go

CREATE PROC DeletePerson
	@id nvarchar(36)
AS
BEGIN
	DELETE FROM Email WHERE PersonID=@id
	DELETE FROM Person WHERE IDPerson=@id
END
go

CREATE PROC GetPerson
	@id nvarchar(36)
AS
BEGIN
	SELECT* FROM Person WHERE IDPerson=@id
END
go

CREATE PROC GetPersons
AS
BEGIN
	SELECT* FROM Person
END
go

CREATE PROC GetEmails
	@idPerson nvarchar(36)
AS
BEGIN
	SELECT* FROM Email WHERE PersonID=@idPerson
END
go

CREATE PROC UpdatePerson
	@id nvarchar(36),
	@firstName nvarchar(25),
	@surname nvarchar(25),
	@telephone nvarchar(25),
	@password nvarchar(25),
	@isAdmin bit,
	@cityId int
AS
BEGIN
	UPDATE Person SET FristName=@firstName,
	Surname=@surname,
	Telephone=@telephone,
	UserPassword=@password,
	IsAdmin=@isAdmin,
	CityID=@cityId
	WHERE IDPerson=@id
	DELETE FROM Email
	WHERE PersonID=@id
END
go


