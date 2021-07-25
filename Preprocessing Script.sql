

-- Search for any duplicate cases

SELECT *
FROM (
	SELECT COUNT(*) AS c
	FROM dbo.Dog
	GROUP BY UniqueID) AS T
WHERE c > 1


-- Update NULL breeds with 'Unknown'

UPDATE dbo.Dog
SET Breed = ISNULL(Breed, 'UNKNOWN')

-- Update Age with mean

UPDATE dbo.Dog
SET Age = 
	(SELECT ROUND(AVG(Age),2)
	FROM dbo.Dog
	WHERE Age IS NOT NULL)
WHERE Age IS NULL



-- Set Gender to Male, Unknown and Female
UPDATE dbo.Dog
SET Gender = 
	(CASE WHEN Gender = 'M' THEN 'MALE'
	WHEN Gender = 'F' THEN 'FEMALE'
	ELSE 'UNKNOWN' END)


-- Update SprayNeuter to boolean

ALTER TABLE dbo.Dog
ADD Neuter varchar(50)

UPDATE Dbo.Dog
SET Neuter = CASE WHEN SpayNeuter = 0 THEN 'NO' ELSE 'YES' END 

ALTER TABLE dbo.Dog
DROP COLUMN SpayNeuter


-- Remove rows without ZipCode or Breed

DELETE FROM dbo.Dog
WHERE ZipCode IS NULL OR Breed = 'N/A'


-- Preprocessed Dataset
SELECT *
FROM dbo.Dog
