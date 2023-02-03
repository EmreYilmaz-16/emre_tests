<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous">
    </script>
</head>

<body>
<div class="container">
    <cfquery name="getR" datasource="#dsn#">
        SELECT  * FROM (
    SELECT A1.ACCOUNT_NAME AS AC_1,A2.ACCOUNT_NAME AS AC_2,EC.EXPENSE_CAT,PT.PROCESS_TYPE_ID,PT.PROCESS_TYPE,A1.MONEY M1,A2.MONEY M2,
    IOO.FROM_ACCOUNT,IOO.TO_ACCOUNT,IOO.DESCRIPTION
    
    ,
    CASE WHEN PT.PROCESS_TYPE_ID =1 THEN AMOUNT
    WHEN IOO.FROM_ACCOUNT=2 THEN -1*AMOUNT WHEN IOO.TO_ACCOUNT=2 THEN AMOUNT
    END AS AMOUNT
    FROM INCOME_OUTGOING AS IOO
    LEFT JOIN ACCOUNTS AS A1 ON A1.ACCOUNT_ID=IOO.FROM_ACCOUNT
    LEFT JOIN ACCOUNTS AS A2 ON A2.ACCOUNT_ID=IOO.TO_ACCOUNT
    LEFT JOIN EXPENSE_CATS AS EC ON EC.EXPENSE_CAT_ID=IOO.EXPENSE_CAT
    LEFT JOIN PROCESS_TYPES AS PT ON PT.PROCESS_TYPE_ID=IOO.PROCESS_TYPE
    ) AS T WHERE FROM_ACCOUNT=2 OR TO_ACCOUNT=2
    </cfquery>
    
    <cfdump var="#getR#">
</div>

    <script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous">
    </script>
</body>

</html>


