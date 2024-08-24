USE kaggle
GO 

---EN CASO NO EXISTA LA TABLA
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'dbo.olympics'))
	CREATE TABLE dbo.olympics(
	NOC VARCHAR(10),
	Gold INT,
	Silver INT,
	Bronze INT,
	Total INT
	
	)
GO

---SI YA EXISTE LA TABLA
TRUNCATE TABLE dbo.olympics
GO

---IMPORTAR DATA DESDE ARCHIVO
BULK INSERT dbo.olympics
FROM 'C:\Certus\proyecto_parcial\python\dataset\Athens 2004 Olympics Nations Medals.csv' ---INCLUIR DIRECCIÓN DEL DATASET
WITH
(
	FIRSTROW = 2,  --empieza en la 2da fila, ya que la 1era es la cabecera
	FIELDTERMINATOR = ',',  --indicamos separador de columnas
	ROWTERMINATOR = '0X0a' --SALTO DE LINEA

	)
	GO