select *from [dbo].importdata
SET DATEFORMAT dmy;

DECLARE @from DATETIME = '24-04-2025 09:20:00';
DECLARE @to DATETIME = '24-04-2025 12:00:00';

SELECT hoten, tenmon, giovao, giora, ngay
FROM [dbo].[importdata]
WHERE 
    ISDATE(ngay) = 1
    AND ISDATE(giovao) = 1
    AND ISDATE(giora) = 1
    AND DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', CAST(giovao AS TIME)), CAST(ngay AS DATETIME)) < @to
    AND DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', CAST(giora AS TIME)), CAST(ngay AS DATETIME)) > @from;

