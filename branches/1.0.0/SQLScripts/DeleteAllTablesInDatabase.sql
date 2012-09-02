DECLARE @TableName NVARCHAR(MAX)
DECLARE @ConstraintName NVARCHAR(MAX)
DECLARE Constraints CURSOR FOR
 SELECT TABLE_NAME, CONSTRAINT_NAME FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
 
OPEN Constraints
FETCH NEXT FROM Constraints INTO @TableName, @ConstraintName
 
WHILE @@FETCH_STATUS = 0
BEGIN
 EXEC('ALTER TABLE [' + @TableName + '] DROP CONSTRAINT [' + @ConstraintName + ']')
 FETCH NEXT FROM Constraints INTO @TableName, @ConstraintName
END
 
CLOSE Constraints
DEALLOCATE Constraints
 
DECLARE Tables CURSOR FOR
 SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
 
OPEN Tables
FETCH NEXT FROM Tables INTO @TableName
 
WHILE @@FETCH_STATUS = 0
BEGIN
 EXEC('DROP TABLE [' + @TableName + ']')
 FETCH NEXT FROM Tables INTO @TableName
END
 
CLOSE Tables
DEALLOCATE Tables