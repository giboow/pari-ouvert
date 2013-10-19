<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>- Pari ouvert -</title>
        <link rel="icon" type="image/png" href="favicon.jpg">
    </head>

    <body>
        <?php
            if (isset($_POST['email'])){
                $file = fopen("../email.csv", "a+");
                fputcsv($file, array($_POST['email']));
                fclose($file);
            }
        ?>
        <!-- C'est le problème avec un teaser, on en veut toujours plus. -->
        <center><img src="home1.jpg" /></center>

        <center>
            <form method="post" name="contact">
                <input type="email"  name="email" value="Je laisse mon adresse email pour être tenu au courant de la sortie de Pari Ouvert" style="width:600px; font-family:Verdana, Geneva, sans-serif; padding:5px;" onclick="if(this.value=='Je laisse mon adresse email pour être tenu au courant de la sortie de Pari Ouvert')this.value='';"/><input name="submit" type="submit" style="background-color:#000; border:1px solid #000; font-family:Verdana, Geneva, sans-serif; color:#fff; height:28px;" />
            </form>
        </center>

        <center><img src="home2.jpg" /></center>
        <!-- Allez, un peu de patience. -->

    </body>
</html>
