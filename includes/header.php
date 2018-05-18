<?php 

if (session_status() == PHP_SESSION_NONE) 
{
    session_start();
}
if (isset($_SESSION['LAST_REQUEST_TIME'])) 
{
    if (time() - $_SESSION['LAST_REQUEST_TIME'] > 1800) 
    {
        // session timed out, last request is longer than 3 minutes ago
        $_SESSION = array();
        session_destroy();
    }
}
$_SESSION['LAST_REQUEST_TIME'] = time();

?>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>Buy2</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style2.css" />
<link href='http://fonts.googleapis.com/css?family=Terminal+Dosis' rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
<header>
    <div class="wrapper">
        <h1><a href="index.php" id="brand" title="Buy2">Buy2</a></h1>
        <nav>
            <ul>
                <li>
                  <a href="#">Tops</a>
                  <ul class="sub-menu">
                        <li><a href="category.php?id=1">Tshirts</a></li>
                        <li><a href="category.php?id=2">Jumpers</a></li>
                       
                        <li><a href="category.php?id=4">Knitwear</a></li>
                    </ul>
                </li>
                <li><a href="category.php?id=17">Trousers</a></li>
                <li>
                    <a href="#">Dresses</a>
                    <ul class="sub-menu">
                        <li><a href="category.php?id=5">Bridal dress</a></li>
                        <li><a href="category.php?id=6">Cocktail dress</a></li>
                        <li><a href="category.php?id=7">Maxi dress</a></li>
                 
                    </ul>  
                </li>
                <li><a href="category.php?id=20">Skirts</a></li>
                <li>
                    <a href="#">Accessories</a>
                    <ul class="sub-menu">
                        <li><a href="category.php?id=11">Shoes</a></li>
                        <li><a href="category.php?id=12">Hats</a></li>
                        <li><a href="category.php?id=13">Bags</a></li>
                        <li><a href="category.php?id=14">Scarves</a></li>
                        <li><a href="category.php?id=16">Gloves</a></li>
                    </ul>
                </li>
                <li><a href="category.php?id=18">Coats &amp; Jackets </a></li>
                <?php if (isset($_SESSION["role"]) && $_SESSION["role"]=="Admin")       
                { ?>
                <<li><a href="additem.php">Add Items</a></li>
                <?php 
                 } ?>
                
          </ul>
        </nav>
    </div>
</header>

<aside id="top">
    <div class="wrapper">
        
       

        <?php  if (isset($_SESSION["emailauth"])) 
        { ?>
                                
        <div id="action-bar"><a href="change.php"><img src="images/pass.jpg" height="24" width="21"></a> <a href="invoice.php"><img src="images/invoice.jpg" height="24" width="21"></a>  <a href="viewbasket.php"><img src="images/shopping-cart1.png" height="24" width="21"><?php if(isset($_SESSION['item_number'])){echo $_SESSION['item_number'];} ?></a><a href="logout.php"><img src="images/signout.jpg" height="24" width="21"></a></div>
      
        <?php 
        }    
        else 
        { ?>
                                
      <div id="action-bar"><a href="login.php"><img src="images/login-key.png" height="24" width="21"></a> <a href="viewbasket.php"><img src="images/shopping-cart1.png" height="24" width="21"><label><?php if(isset($_SESSION['item_number'])){echo $_SESSION['item_number'];} ?></label></a></div>
        <?php }?>

    </div>
</aside>