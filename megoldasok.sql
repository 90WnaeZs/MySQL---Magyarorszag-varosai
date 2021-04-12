A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

1. feladat:
CREATE DATABASE varosok CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;

3. feladat:
SELECT * FROM `varos` WHERE vnev LIKE '%vásár%';

4. feladat:
SELECT `vnev`,`nepesseg`, `terulet` 
FROM `varos` 
WHERE terulet>400
ORDER BY nepesseg DESC;

5. feladat:
SELECT varos.vnev,varos.nepesseg 
FROM varos
JOIN megye
ON varos.megyeid=megye.id
WHERE megye.mnev='Fejér' AND varos.nepesseg>15000;

6. feladat:
SELECT varostipus.vtip AS "Város típusa", COUNT(varos.id) AS "Városok száma", SUM(varos.nepesseg) AS "Népesség" 
FROM `varostipus` 
JOIN varos
ON varostipus.id=varos.vtipid
WHERE varostipus.vtip NOT LIKE 'Főváros'
GROUP BY varostipus.vtip;

7. feladat:
SELECT megye.mnev, COUNT(varos.id) AS "db"
FROM megye
JOIN varos
ON megye.id=varos.megyeid
WHERE NOT(varos.kisterseg <=> varos.jaras)
GROUP BY megye.mnev
HAVING db>8
ORDER BY db DESC;