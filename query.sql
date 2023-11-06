
-- JOIN um die Gewinnerzahlen zu sehen

SELECT * 
FROM dbo.LottoGewinner as win
JOIN dbo.LottoZahlen as num
ON win.date = num.date

-- Alle Gewinner sehen anzeigen und die Währung. 

SELECT date, six, currency1
FROM dbo.LottoGewinner as win 
WHERE six IS NOT NULL

-- Zählen wie viele Gewinner es jemals gabe. 

SELECT COUNT(six) AS 'Anzahl der Gewinner'
FROM dbo.LottoGewinner
WHERE six IS NOT NULL 

-- Wie viele Jackpots gab es

SELECT COUNT(date) As 'Anzahl der Jackpots' 
FROM dbo.LottoGewinner
WHERE six IS NULL 

-- Wann war der erste EUR Gewinn 
SELECT TOP 1 date, currency1, six
FROM dbo.LottoGewinner
WHERE currency1 = 'EUR'
ORDER BY date 


-- Wann Größter EUR Single Gewinn der jemals gewonnen wurde und mit welchen Zahlen

SELECT TOP 1 win.date, six,rateSix,currency1, nr1asc, nr2asc, nr3asc, nr4asc, nr5asc, nr6asc, additionalNr 
FROM dbo.LottoGewinner as win
JOIN dbo.LottoZahlen as num 
ON win.date = num.date 
WHERE currency1 = 'EUR' AND six = 1
ORDER BY rateSix DESC


SELECT *
FROM dbo.LottoGewinner

-- SUMME der 6er seit dem EURO

SELECT SUM(rateSix) As 'Summe der Sechser' 
FROM dbo.LottoGewinner
WHERE six is not null and currency1 ='EUR'







