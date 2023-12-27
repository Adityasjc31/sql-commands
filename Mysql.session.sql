-- Active: 1697272745728@@127.0.0.1@3306@first

SELECT * FROM programmers;

SELECT
    NAME,
    FLOOR(DATEDIFF(CURDATE(), DOB) / 365) AS age
FROM programmers;

SELECT NAME FROM programmers WHERE NAME LIKE '%H';

SELECT NAME, DOB FROM programmers WHERE MONTH(DOB) = "01";

SELECT * FROM studies;

SELECT count(*) FROM studies WHERE COURSE = "Pgdca";

SELECT NAME, CCOST
FROM studies
WHERE
    CCOST >= 5000
    AND CCOST <= 10000;

SELECT COUNT(*)
FROM programmers
WHERE
    PROF1 = "Cobol"
    OR PROF2 = "Cobol"
    OR PROF1 = "Pascal"
    OR PROF2 = "Pascal";

select count (*)
from programmers
where
    PROF1 not in ('Pascal', 'C')
    and PROF2 not in ('Pascal', 'C');

CREATE Table
    Software(
        NAME VARCHAR(8),
        TITLE VARCHAR(20),
        DEV_IN VARCHAR(8),
        SCOST DECIMAL(7, 2),
        DCOST INT(5),
        SOLD INT(3)
    )

show TABLES;

SELECT * FROM software

SELECT AVG(`SCOST`) FROM software WHERE DEV_IN = "PASCAL"

SELECT
    NAME,
    FLOOR(DATEDIFF(CURDATE(), DOB) / 365) AS age
FROM programmers;

SELECT `NAME` FROM studies WHERE `COURSE` = "Dap"

SELECT * FROM software

SELECT *
FROM software
WHERE `SOLD` = (
        SELECT MAX(`SOLD`)
        from software
    )

SELECT NAME, DOB FROM programmers WHERE MONTH(DOB) = 01;

SELECT *
FROM studies
WHERE `CCOST` = (
        SELECT MIN(CCOST)
        from studies
    );

SELECT * FROM studies WHERE COURSE = "Pgdca"

SELECT SUM(`SOLD`) AS Total FROM software WHERE `DEV_IN` = "C";

SELECT * FROM software WHERE `NAME` = "RAMESH";

SELECT * FROM studies WHERE `SPACE` = "SDBT";

SELECT * FROM software WHERE (`DCOST` * `SOLD`) >= 20000;

SELECT ROUND(`DCOST` / `SCOST`) AS COPIES FROM software;

SELECT
    MAX(`DCOST`) as HIGHEST_DEVELOPMENT_COST
FROM software
WHERE `DEV_IN` = "BASIC";

SELECT * FROM software WHERE (`SOLD` * `SCOST`) >= `DCOST`;

SELECT * FROM software WHERE `DEV_IN` = "dbase";

SELECT * FROM studies WHERE `SPACE` = "BITS";

SELECT * FROM studies WHERE `CCOST` >= 5000 AND `CCOST` <= 10000;

SELECT AVG(`CCOST`) AS AVERGAE_COURSE_COST FROM studies;

SELECT * FROM programmers WHERE `PROF1` = 'C' or `PROF2` = 'C';

SELECT *
FROM programmers
WHERE
    PROF1 in ("COBOL", "PASCAL")
    or `PROF2` in ("COBOL", "PASCAL");

SELECT *
FROM programmers
WHERE
    NOT(
        PROF1 in ("C", "PASCAL")
        or `PROF2` in ("C", "PASCAL")
    );

SELECT
    MAX(
        ROUND(DATEDIFF(CURDATE(), DOB) / 365)
    ) AS age
from programmers
WHERE SEX = "M";

SELECT
    ROUND(
        AVG(
            ROUND(DATEDIFF(CURDATE(), DOB) / 365)
        )
    ) AS AVERAGE_AGE
from programmers
WHERE SEX = "F";

SELECT * FROM programmers ORDER BY DATEDIFF(CURDATE(), DOJ) DESC;

-- 18/11/2023

SELECT `DEV_IN`, count(TITLE) from software GROUP BY DEV_IN;

SELECT `NAME`, count(TITLE) from software GROUP BY `NAME`;

SELECT `SEX`, count(`Name`) from programmers GROUP BY `SEX`;

select
    dev_in as language,
    max(dcost) as costliest_package
from Software
group by dev_in;

select
    dev_in as language,
    max(`SOLD`) as highest_selling
from Software
group by dev_in;

SELECT
    YEAR(`DOB`),
    COUNT(`Name`)
FROM programmers
GROUP BY YEAR(`DOB`);

SELECT
    YEAR(`DOJ`),
    COUNT(`Name`)
FROM programmers
GROUP BY YEAR(`DOJ`);

SELECT
    MONTH(`DOB`),
    COUNT(`Name`)
FROM programmers
GROUP BY MONTH(`DOB`);

SELECT
    MONTH(`DOJ`),
    COUNT(`Name`)
FROM programmers
GROUP BY MONTH(`DOJ`);

SELECT `PROF1`, COUNT(`Name`) FROM programmers GROUP BY `PROF1`;

SELECT `PROF2`, COUNT(`Name`) FROM programmers GROUP BY `PROF2`;

SELECT `SALARY`, COUNT(`Name`) FROM programmers GROUP BY `SALARY`;

SELECT `SPACE`, COUNT(`Name`) FROM studies GROUP BY `SPACE`;

SELECT `COURSE`, COUNT(`Name`) FROM studies GROUP BY `COURSE`;

select
    dev_in as language,
    sum(dcost) as total_development_cost
from Software
group by dev_in;

select
    dev_in as language,
    sum(`SCOST`) as total_selling_cost
from Software
group by dev_in;

select
    `NAME` as programmer,
    SUM(`DCOST`) as cost
from Software
group by `NAME`;

select
    `NAME` as programmer,
    SUM(`SCOST`) as cost
from Software
group by `NAME`;

select
    `NAME`,
    COUNT(`DEV_IN`) as number_of_packages
from software
group by NAME;

select
    name,
    dev_in as language,
    sum(scost * sold) as sales_cost
from Software
group by name, dev_in;

select
    NAME,
    MAX(`DCOST`) as costliest_package,
    MIN(`DCOST`) as cheapest_package
from software
GROUP BY NAME;

select
    `DEV_IN`,
    AVG(`DCOST`) as average_development_cost,
    AVG(`SOLD` * `SCOST`) as average_cost,
    AVG(`SCOST`) as selling_cost,
    AVG(`SCOST`) as averge_price_per_copy
from software
GROUP BY DEV_IN;

SELECT
    `SPACE`,
    Count(`Course`),
    AVG(`CCOST`)
from studies
GROUP BY `SPACE`;

SELECT `SPACE`, Count(`NAME`) from studies GROUP BY `SPACE`;

--25/11/23--

SELECT `Name`, `SALARY`
FROM programmers
WHERE `SALARY` = (
        SELECT MAX(`SALARY`)
        FROM programmers
        WHERE (
                `PROF1` = 'C'
                or `PROF2` = 'C'
            )
    );

SELECT `Name`, `SALARY`
FROM programmers
WHERE `SALARY` = (
        SELECT MAX(`SALARY`)
        FROM programmers
        WHERE (
                `PROF1` = 'Cobol'
                or `PROF2` = 'Cobol'
            )
    )
    and `SEX` = 'F';

SELECT
    DISTINCT NAME,
    SALARY,
    PROF1
FROM programmers
WHERE (SALARY, PROF1) IN (
        SELECT
            MAX(SALARY),
            PROF1
        FROM programmers
        GROUP BY PROF1
    );

SELECT *
FROM programmers
WHERE
    DATEDIFF(CURRENT_DATE(), `DOJ`) = (
        SELECT
            MIN(
                DATEDIFF(CURRENT_DATE(), `DOJ`)
            )
        FROM programmers
    );

SELECT *
FROM programmers
WHERE
    DATEDIFF(CURRENT_DATE(), `DOJ`) = (
        SELECT
            MAX(
                DATEDIFF(CURRENT_DATE(), `DOJ`)
            )
        FROM programmers
    );

SELECT PROF1
FROM programmers
GROUP BY PROF1
HAVING PROF1 NOT IN (
        SELECT PROF2
        FROM
            programmers
    )
    AND COUNT(PROF1) = 1
UNION
SELECT PROF2
FROM programmers
GROUP BY PROF2
HAVING PROF2 NOT IN (
        SELECT PROF1
        FROM
            programmers
    )
    AND COUNT(PROF2) = 1;

-- SELECT FLOOR((SYSDATE-DOB)/365) AGE, NAME, PROF1, PROF2 FROM PROGRAMMERs

-- WHERE FLOOR((SYSDATE-DOB)/365) =

SELECT
    FLOOR(
        DATEDIFF(CURDATE(), `DOB`) / 365
    ) AGE,
    NAME,
    DOB
FROM programmers
WHERE (DATEDIFF(CURDATE(), `DOB`)) = (
        SELECT
            MIN(DATEDIFF(CURDATE(), `DOB`))
        FROM programmers
        WHERE
            `PROF1` LIKE 'DBASE'
            or `PROF2` LIKE 'DBASE'
    );

(
    SELECT
        COUNT(`NAME`) as Students,
        `SPACE`
    FROM studies
    GROUP BY `SPACE`
);

-- SELECT
--     COUNT(`NAME`) as num,
--     `SPACE`
-- FROM studies
-- GROUP BY `SPACE`
-- ORDER BY num DESC
-- LIMIT 1;

 
Select SPACE FROM studies GROUP BY `SPACE` HAVING COUNT(NAME) = (SELECT MAX(num)FROM (SELECT COUNT(`NAME`) as num,`SPACE`FROM studies GROUP BY `SPACE`) as A);

-- SELECT `Name`

-- FROM programmers

-- WHERE `SALARY` = (

--         SELECT `SALARY`

--         FROM programmers

--         GROUP BY `SALARY`

--         HAVING

--             COUNT(`Name`) > 1

--     );

-- --