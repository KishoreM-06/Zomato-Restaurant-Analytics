SELECT STR_TO_DATE(REPLACE(Datekey_Opening, '_', '-'), '%Y-%m-%d') AS formatted_date
FROM zomata;

# cleaning part 

ALTER TABLE zomata ADD COLUMN datekey DATE;
UPDATE zomata
SET datekey = STR_TO_DATE(REPLACE(Datekey_Opening, '_', '-'), '%Y-%m-%d');
ALTER TABLE zomata drop column Datekey_Opening;

ALTER TABLE `country-code`
CHANGE COLUMN `Country Code` `CountryCode` INT;

