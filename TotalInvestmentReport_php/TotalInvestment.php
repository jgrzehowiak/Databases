<html>
    <head>
        <title>PHP Query</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>

    <body>
        <h1>TotalInvestmentReport</h1>
        <?php
            include 'library/config.php';
            include 'library/opendb.php';
            $query = "SELECT SUM(INV_PRICE * INV_QOH)AS TOTAL FROM INVENTORY";
            $result = mysqli_query($conn,$query) or die('Error, query failed');
            if(mysqli_num_rows($result) == 0)
            {
                echo "Database is empty <br>";
            }
            else
            {
            ?>
            <TABLE BORDER="1" BGCOLOR="CCFFFF" width='50%' cellspacing='1' cellpadding='0'   bordercolor="black" border='1'>
            <TR>
                <TH bgcolor='#DAA520'> <font size='2'/>TotalInvestment</TH>
            </TR>
            <TR>
                <TD> <font size='2'/><center><?php $row = $result->fetch_array();  echo $row['TOTAL'];?></center></TD>
            </TR>

            <?php
            }
               include 'library/closedb.php';
  
            ?>
    </body>
</html> 
