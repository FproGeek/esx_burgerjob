SET @job_name = 'burgershot';
SET @society_name = 'society_burgershot';
SET @job_Name_Caps = 'BurgerShot';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'recru', 'Recrue', 2500, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Co-gérant', 3000, '{}', '{}'),
  (@job_name, 3, 'boss', 'Gérant', 3500, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('water', 'Eau', 20),
    ('bread', 'Hamburger', 20),
    ('soda', 'Soda', 20),
    ('jusfruit', 'Jus de fruits', 20),
    ('icetea', 'Ice Tea', 20),
    ('energy', 'Energy Drink', 20),
    ('drpepper', 'Dr. Pepper', 20),
    ('limonade', 'Limonade', 20),
;
