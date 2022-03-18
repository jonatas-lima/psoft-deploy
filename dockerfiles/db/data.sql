INSERT INTO ADMIN
VALUES (1);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORIENTATION_ISSUE;        
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.PROFESSOR;
INSERT INTO PROFESSOR
VALUES (10, 5),
    (2, 6),
    (0, 7);
-- 10 +/- SELECT COUNT(*) FROM PUBLIC.PROFESSOR_INTERESTED_STUDY_AREAS;        
INSERT INTO PROFESSOR_INTERESTED_STUDY_AREAS
VALUES (5, 1),
    (5, 2),
    (5, 3),
    (6, 4),
    (6, 1),
    (5, 1),
    (5, 2),
    (5, 3),
    (6, 4),
    (6, 1);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.PROFESSOR_INTERESTEDTCCS; 
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.PROFESSOR_LABS;           
INSERT INTO PROFESSOR_LABS
VALUES (5, 'LSD'),
    (5, 'SPLAB'),
    (6, 'LSD');
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.PROFESSOR_REGISTEREDTCCS; 
INSERT INTO PROFESSOR_REGISTEREDTCCS
VALUES (5, 1),
    (6, 2),
    (7, 3);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.STUDENT;  
INSERT INTO STUDENT
VALUES ('2024.2', '119210036', 2, NULL),
    ('2024.2', '123', 3, NULL),
    ('2023.1', '123', 4, NULL);
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.STUDENT_INTERESTED_STUDY_AREAS;           
INSERT INTO STUDENT_INTERESTED_STUDY_AREAS
VALUES (2, 1),
    (2, 2),
    (3, 3),
    (3, 4);
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.STUDY_AREA;               
INSERT INTO STUDY_AREA
VALUES (1, 'Ciencia de Dados'),
    (2, 'Inteligencia Artifical'),
    (3, 'Engenharia de software'),
    (4, 'Sistemas Operacionais');
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.TCC;      
INSERT INTO TCC
VALUES (
        1,
        'descricao da proposta 1',
        1,
        NULL,
        'Proposta 1',
        2,
        5
    ),
    (
        2,
        'descricao da proposta 2',
        1,
        NULL,
        'Proposta 2',
        NULL,
        6
    ),
    (
        3,
        'descricao da proposta 3',
        1,
        NULL,
        'Proposta 3',
        NULL,
        7
    ),
    (
        4,
        'descricao da proposta 4',
        0,
        NULL,
        'Proposta 4',
        3,
        NULL
    ),
    (
        5,
        'descricao da proposta 5',
        0,
        NULL,
        'Proposta 5',
        4,
        NULL
    );
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.TCC_INTERESTED_PROFESSORS;
INSERT INTO TCC_INTERESTED_PROFESSORS
VALUES (4, 5),
    (4, 6),
    (4, 7),
    (4, 5),
    (4, 6),
    (4, 7);
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.TCC_INTERESTED_STUDENTS;  
INSERT INTO TCC_INTERESTED_STUDENTS
VALUES (3, 3),
    (4, 3),
    (4, 4),
    (3, 3),
    (4, 3),
    (4, 4);
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.TCC_STUDY_AREAS;          
INSERT INTO TCC_STUDY_AREAS
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 3),
    (4, 4);
-- 7 +/- SELECT COUNT(*) FROM PUBLIC.TCCMATCH_USER;            
INSERT INTO TCCMATCH_USER
VALUES (
        1,
        'admin@admim.com',
        'admin',
        '$2a$10$a3CnQkefj4QPhZRGtPIYWuM03RiavrXYjCakZo.5kHoNVXyq7Fsx6',
        1,
        'admin'
    ),
    (
        2,
        'ferreiradelimajonatas@gmail.com',
        'Jonatas Ferreira de Lima',
        '$2a$10$bDy8K1u/vm5NgSQvNuswLe4Tpz2CVvPjJe48Alg71I/Er6EDVbIyu',
        2,
        'jonatas'
    ),
    (
        3,
        'bernard.odon@ccc.ufcg.edu.br',
        'Bernard Dantas Odon',
        '$2a$10$fq3uw9q8UkiRgGlUg7DSpuK1bra/ZvAUN9HxP4eodcjReOAgvoRsy',
        2,
        'bodon'
    ),
    (
        4,
        'marcos.cosson@ccc.ufcg.edu.br',
        'Marcos Cosson',
        '$2a$10$/CBEwLj54a3dTUoPqOCQl.v7hVs/NQVCRSxCHKR8.S0.dsX9Xv77e',
        2,
        'marcos'
    ),
    (
        5,
        'elmar@gmail.com',
        'Elmar Melcher',
        '$2a$10$/FrosrLpFYSrNPJby/ds9e32cubj7D1lENz1zLilejjBOGyz.cgtC',
        0,
        'elmar'
    ),
    (
        6,
        'fubica@gmail.com',
        'Francisco Vilar',
        '$2a$10$tDvuRBtGTEhVSt9.vhre1OdFlNXAQu1OX8LiTGHQCFEt8enyGFIyK',
        0,
        'fubica'
    ),
    (
        7,
        'joao.arthur@gmail.com',
        'Joao Arthur',
        '$2a$10$ddjL7d13k3ZWiDyH7iFv1egEXf.HOGL2QEyoN2AYi.4Hnr3nq9yVK',
        0,
        'joao_arthur'
    );
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TCCMATCH_USER_EMAILS;