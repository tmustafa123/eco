<?php include 'includes/header.php'; 
//include 'includes/dbcontroller.php';
include 'includes/rb.php';
//$db_handle = new DBController();
 
if(!empty($_GET['id'])) 
{
    $id=$_GET['id'];
    $_SESSION["item_ID"]=$id;
}

if (isset($_POST['submit'])) 
{
    $id=$_SESSION["item_ID"];
if(!R::testConnection())
{
        R::setup('mysql:host=localhost;dbname=ecommerce', 'root', '');
}
    

   if(!empty($_POST["qauntity"])) 
     {
//$productByID = $db_handle->runQuery("SELECT * FROM items WHERE item_id='" . $id . "'"); 

// $pages = R::find('items',' id = ? ', array( $id ));
$ob=R::load('items',$id);

 $prices=$ob->price;
 $name=$ob->name;
 $ids=$ob->id;
 $path=$ob->pic_path;


$total=$prices*$_POST["qauntity"];


$itemArray = array($name=>array('name'=>$name, 'item_id'=>$ids, 'qauntity'=>$_POST["qauntity"], 'price'=>$prices,'color'=>$_POST["item_color"],'size'=>$_POST["item_size"],'bill'=>$total,'path'=>$path));

            if(!empty($_SESSION["cart_item"])) 
            {
                if(in_array($name,array_keys($_SESSION["cart_item"]))) 
                {
                    // var_dump(in_array($productByID[0]["item_id"],array_keys($_SESSION["cart_item"])));exit;
                    foreach($_SESSION["cart_item"] as $k => $v) 
                    {
                            if($name == $k) 
                            {
                                if(empty($_SESSION["cart_item"][$k]["qauntity"])) 
                                {
                                    $_SESSION["cart_item"][$k]["qauntity"] = 0;
                                }

                                $_SESSION["cart_item"][$k]["qauntity"] += $_POST["qauntity"];
                                $_SESSION["cart_item"][$k]["bill"]+=$total;
                            }
                    }
                } 
                else 
                {
                    $_SESSION["cart_item"] = array_merge($_SESSION["cart_item"],$itemArray);
                    $_SESSION['item_number']++;
                }
            } 
            else 
            {
                $_SESSION["cart_item"] = $itemArray;  /// new cart 
                $_SESSION['item_number']++;
               
            }

             $_SESSION['basket']=1;
             header('Location:index.php');
    exit();  
           
}
}
?>
<article id="mainview">
   
    <?php 
if(!R::testConnection())
{
        R::setup('mysql:host=localhost;dbname=ecommerce', 'root', '');
}

 $ob1=R::load('items', $_SESSION["item_ID"]);

 $category_id=$ob1->category_id;
 $item_name=$ob1->name;

$ob2=R::load('categories', $category_id);


 $category_name=$ob2->category_name;
  $parent_id=$ob2->parent_id;

$ob3=R::load('main_categories', $parent_id);

 $main_category=$ob3->main_category;

    ?>

     <div id="breadcrumb"><a href="index.php">Home</a> > <a href="index.php"><?php if(isset($main_category))echo $main_category; ?></a> > <a href="#"><?php if(isset($category_name))echo $category_name; ?></a> > <?php if(isset($item_name))echo $item_name; ?></div>
  <?php 
        if(!empty($ob1))
        {?>


    <div id="description"> 

        <div class="product-item">
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            
             <h1><?php if(isset($ob1->name))echo $ob1->name;  ?></h1>

        <strong id="price" value="<?php echo $ob1->price; ?>">Price: &pound; <?php echo $ob1->price; ?>
        </strong>
        
        <p><?php echo $ob1->description; ?></p>
        <p id="totalf"></p>
        <strong>Color</strong>
        <p>
            <select name="item_color" class="SelectColor" id="color" >
                
                <option value="Blue" selected="selected">Blue</option>
                <option value="Red">Red</option>
                <option value="Black">Black</option>
                <option value="Indigo">Indigo</option>
                <option value="Mix">Mix</option>
            </select>
        </p>
        <strong>Size</strong>
        <p>
            <select name="item_size" class="SelectSize" id="size" onchange="">
                
                 <option value="small" selected="selected">Small (S)</option>
                <option value="medium">Medium (M)</option>
                <option value="large">Large (L)</option>
                <option value="Xtra large">Extra Large (XL)</option>
            </select>
            <button type="button">Size guide</button>
        </p>
        <?php   
    if ($ob1->qauntity<=0)  
       { ?>
    <font color="red"><strong ><p>Qauntity (N/A)</p></strong></font>
  
      <?php 
        } 

        else { ?>

        <strong><p>Qauntity (In Stock)</p></strong>

        <?php } ?>
<select id="mySelect" onchange="myFunction()" name="qauntity"> 

<?php  
//var_dump($ob1->category_name); exit;
if ($ob1->qauntity<=0) 
{ ?>
    <option  value="" >Out of Stock</option>
<?php 
}
if (isset($ob1->qauntity)) 
{

for ($i=1; $i <= $ob1->qauntity ; $i++) 
{ 
?>
<option  value="<?php if(isset($ob1->qauntity)){echo $i;} ?>" ><?php echo $i; ?></option>
<?php 
}
}
?>
</select>
<strong id="price">Total Price: &pound; <label id="total" name='' ><?php echo $ob1->price; ?></label></strong>

<strong><input type="checkbox" name="vehicle" id="a" value="Bike">  Accept Terms & Conditions </strong><br><br>

<input type="hidden" value="<?php echo $ob1->id; ?>" name="item_id"/>
        <p><button  disabled="disabled" id="mytestbutton" class="continue" name="submit" >Submit Order</button></p>  
            </form>
        </div>
    <?php
            
          
        }
   
    ?>

        <p><button type="button">Tell a friend</button></p>
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1" class="first">Delivery</a></li>
                <li><a href="#tabs-2">Returns</a></li>
                <li><a href="#tabs-3">Info &amp; Care</a></li>
            </ul>
            <section id="tabs-1">
                <p> <strong>UK Style Saver:</strong> Within 6 working days –          FREE</p>
                <p> <strong>UK Standard:</strong> Within 3 working days – £3.95 or FREE if                  you spend over £75.00</p>
                <p> <strong>UK Next Day: </strong>Order by 6pm Weekdays or 2pm          Sunday - £5.95 or               FREE if you spend over £100</p>
                <p> <strong>UK Same day delivery:</strong> Order by 10am Monday - Sunday you will receive your goods the same          day - £7.95</p>
                <p> <a shape="rect" href="#" title="View more information on International and UK delivery times">More info on International and UK delivery times</a></p>
            </section>
            <section id="tabs-2">
              <p>If you are not completely satisfied with your purchase, simply return the items to us in their original condition and packaging within 28 days of receipt and we will issue a full refund (excluding original delivery charge), or exchange the item for a different size / colour, if preferred.</p>
              <p>Please <a href="#">click here</a> for further information</p>
            </section>
            <section id="tabs-3">
                
            </section>
        </div>
    </div>
    <div id="images">
    	<a><img src="<?php echo $ob1->pic_path; ?>"></a>
        <p>Rollover to zoom. Click to enlarge.</p>
        <span class="sale">Sale</span>
        <div id="productthumbs">
            <a href="#"><img src="<?php echo $ob1->pic_path; ?>" /></a><a href="#"><img src="<?php echo $ob1->pic_path; ?>"/></a><a href="#"><img src="<?php echo $ob1->pic_path; ?>"/></a>
        </div>
    </div>
</article>


<script>
function myFunction() 
{
    var x = document.getElementById("mySelect").value;

    var t = <?php echo $ob1->price; ?>;

    document.getElementById("total").innerHTML= t*x;
    y.style.color="red";

    
}


</script>
<script src="js/func.js"></script>
<footer>
	<div class="wrapper">
    	<span class="logo">Buy2</span>
       <a href="#">Sitemap</a> <a href="#">Terms &amp; Conditions</a> <a href="#">Shipping &amp; Returns</a> <a href="#">Size Guide</a><a href="#">Help</a> <br />
        Address to said Buy2 comp, including postcode &nbsp;-&nbsp; 1.888.CO.name <a href="mailto:Buy2 comp">service@Buy2 comp.com</a>
    </div>

 


</footer>
</body>
</html>

