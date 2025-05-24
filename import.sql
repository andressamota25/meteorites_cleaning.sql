CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp"
SET year = NULL
WHERE year = 0;

UPDATE "meteorites_temp"
SET lat = NULL
WHERE lat = 0;

UPDATE "meteorites_temp"
SET long = NULL
WHERE long = 0;

UPDATE "meteorites_temp"
SET mass = NULL
WHERE mass = 0;

UPDATE "meteorites_temp"
SET year = NULL
WHERE TRIM(year) = '';

UPDATE "meteorites_temp"
SET mass = ROUND(mass, 2),
    lat = ROUND(lat, 2),
    long = ROUND(long, 2);

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK("discovery" IN ('Fell', 'Found')),
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY ("id")
);


INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM meteorites_temp
WHERE
    discovery IN ('Fell', 'Found') AND
    nametype NOT LIKE '%relict%'
ORDER BY "year", "name";

SELECT * FROM meteorites LIMIT 5;

SELECT id, name, class, mass, discovery, year, lat, long
FROM meteorites
ORDER BY year, name
LIMIT 10;

