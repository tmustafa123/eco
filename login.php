<?php 
if (session_status() == PHP_SESSION_NONE) 
{
    session_start();
}
if (isset($_SESSION['LAST_REQUEST_TIME'])) {
    if (time() - $_SESSION['LAST_REQUEST_TIME'] > 180) {
        // session timed out, last request is longer than 3 minutes ago
        $_SESSION = array();
        session_destroy();
    }
}
$_SESSION['LAST_REQUEST_TIME'] = time();

if (isset($_SESSION["emailauth"])) 
{
    header('Location:index.php');
    exit();
}

include 'includes/rb.php';
if(!R::testConnection())
{
  R::setup('mysql:host=localhost;dbname=ecommerce', 'root', '');
} 
 R::debug(false);
 
 function test_input($data) 
{
$data = trim($data);
$data = stripslashes($data);
$data = htmlspecialchars($data);
return $data;
}


if (isset($_POST['submit'])) 
{
    if (!empty(test_input($_POST['email'])) && !empty($_POST['password'])) 
    {
         $password_check=$_POST['password'];

        $pages = R::findAll('customers');
        foreach ($pages as $entry)
        {
        if ((password_verify("$password_check",$entry['password_hash'])) && ($_POST['email']==$entry['email']))
            {
            $_SESSION["myname"]=$entry['first_name'];
            $_SESSION["myemail"]=$entry['email'];
                if ($entry['role']=="Admin") 
                {
                   $_SESSION["role"]="Admin"; 
                }
            $_SESSION["user"]="great123"; 
            $_SESSION["emailauth"]=$_POST['email'];
            ob_end_clean();
            header('Location:index.php');
            exit();
            }

           
            }

    
    }  
    
}
 

?>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>Come and Shop by Buy2</title>
<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Terminal+Dosis' rel='stylesheet' type='text/css'>
<!-- The below script Makes IE understand the new html5 tags are there and applies our CSS to it -->
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
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
<article id="login">
	<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
    	<h1>Customer Details</h1>
        <p><label for="email">Email</label>
        <input type="email" name="email" required="required" /></p>
        <p><label for="pasword">Password</label>
        <input type="password" name="password" required="required"/></p>

        <button type="submit" name="submit" class="btn btn-primary btn-lg" required="required">Submit</button>
       
        <p><a href="">Forgotten password?</a></p>
    </form>
    <section>
    	<h2>New to Buy2 products?</h2>
        <p><a href="index.php"><button type="button">Continue</button></a></p>
    </section>
</article>
<footer>
	<div class="wrapper">
    	<span class="logo">Buy2</span>
     <a href="#">Terms &amp; Conditions</a> <a href="#">Shipping &amp; Returns</a> <a href="#">Size Guide</a><a href="#">Help</a> <br />
        Address to said Buy2 comp, including postcode &nbsp;-&nbsp; 1.888.CO.name <a href="mailto:Buy2 ">service@Buy2 comp.com</a>
    </div>
</footer>
</body>
</html>
