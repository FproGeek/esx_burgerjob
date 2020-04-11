SET @job_name = 'burgershot';
SET @society_name = 'society_burgershot';
SET @job_Name_Caps = 'Burgershot';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_burgershot_fridge', 'Burgershot (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label) VALUES
  (@job_name, @job_Name_Caps)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'recruit', 'Recrue', 300, '{}', '{}'),
  (@job_name, 1, 'employed', 'Employé', 300, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Gérant', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('steakc', 'Steak cru', 5),
    ('salads', 'Salade sale', 5),
    ('tomater', 'Tomate entière', 5),
    ('fromage', 'Morceau de fromage', 5),
    ('steakcui', 'Steak cuit', 5),
    ('saladp', 'Feuille de salade', 5),
    ('tomatec', 'Rondelle de tomate', 5),
    ('patate', 'Pomme de terre', 5),
    ('patatefrie', 'Pomme de terre frit', 5),
    ('frites', 'Barquette de frites', 10),
    ('burger', 'Hamburger', 10),
    ('soda', 'Soda', 5),
    ('jusfruit', 'Jus de fruits', 10),
    ('icetea', 'Ice Tea', 10),
    ('energy', 'Energy Drink', 10),
    ('drpepper', 'Dr. Pepper', 10),
    ('limonade', 'Limonade', 10)
;
