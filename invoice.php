<?php 
//include 'includes/dbcontroller.php'; 
include 'includes/rb.php';
session_start();
if (!isset($_SESSION["emailauth"])) 
{ 

header('Location:index.php');
exit();
 
}
include 'includes/header.php'; 

?>
<article id="basket">
<?php
//$db_handle = new DBController();

$customer=$_SESSION["emailauth"];
if(!R::testConnection())
{
  R::setup('mysql:host=localhost;dbname=ecommerce', 'root', '');
}
$pages = R::find('customers',' email = ? ', array( $customer ));

foreach ($pages as $entry)
{
 $first_name=$entry['first_name'];
 $last_name=$entry['last_name'];
 $address=$entry['address'];
 $city=$entry['city'];
 $country=$entry['country'];
 $postcode=$entry['postcode'];
 $email=$entry['email'];
 $phone=$entry['phone'];


 break;
}


//$customerByEMAIL = $db_handle->runQuery("SELECT * FROM customers WHERE email='" . $customer . "'");  
?>
<h1><?php echo $first_name; ?></h1> 

<table width="100" border="1">
    <tr>
        <th scope="col" class="options">Customer Details</th>
        <th scope="col" class="options">Orders</th>
        
    </tr>
<!--  -->
<?php

 

if(isset($_SESSION["emailauth"]))
{
?>

   <tr>
        <td align="" valign="" class=""><br />
        <dl>
              <dt>First Name</dt>
              <dd><?php echo $first_name; ?></dd>
              <dt>Last Name</dt>
              <dd><?php echo $last_name; ?></dd>
              <dt>Address</dt>
              <dd><?php echo $address; ?></dd>
              <dt>City</dt>
              <dd><?php echo $city; ?></dd>
              <dt>Country</dt>
              <dd><?php echo $country; ?></dd> 
              <dt>Zip Code</dt>
             <dd><?php echo $postcode; ?></dd>
              <dt>Email</dt>
              <dd><?php echo $email; ?></dd>
              <dt>Phone</dt>
              <dd><?php echo $phone; ?></dd>
            

        </dl>

        </td>
    </tr>


     <p></p>
<?php 
}
$count =1; 
 

//$orderByEMAIL = $db_handle->runQuery("SELECT * FROM orders WHERE customer_address='" . $customer . "'"); 
$pages = R::find('orders',' customer_address = ? ', array( $customer )); 
if ($pages ) 
{
  # code...
foreach ($pages as $entry)
{
   ?>
      <tr>
        <p></p>
        
        <td align="" valign="" class=""><br />
        <dl>
              <dt></dt>
              <dd></dd>
             

        </dl>

        </td>

        <td align="left" valign="top" class="options">
            <dl>
                <p valign="top" class="description"></p>
                <strong><dt>Order # <?php echo $count;   ?></dt></strong>
                <dd></dd>
                <dt>Name</dt>
                <dd><?php echo $entry['name']; ?></dd>
                <dt>Quantity</dt> 
                <dd><?php echo $entry['quantity']; ?></dd>
                <dt>Date:</dt>
                <dd><?php echo $entry['date'];; ?></dd>
                <dt>Bill:</dt>
                <dd>&pound; <?php echo $entry['bill']; ?></dd>
                
                
            </dl>
         
        </td>

    </tr>

<?php $count++;
  }
    }
        ?>
</table>

    
<div>

<p><button type="submit" class="continue" name="" id="account" onclick="ImageHosting_Click()">Delete Account</button></p> 

</div>

</form>

<img src="images/creditcards.gif" class="safe" />

</article>

<script type="text/javascript">

   function ImageHosting_Click() {
               $("#account").click(function () 

               {
                   alert("Are you sure ?");
               });
       }

</script>
<footer>
	<div class="wrapper">
    	<span class="logo">Buy2 </span>
        <a href="#">Terms &amp; Conditions</a> <a href="#">Shipping &amp; Returns</a> <a href="#">Size Guide</a><a href="#">Help</a> <br />
        Address to said Buy2, including postcode &nbsp;-&nbsp; 1.888.CO.name <a href="mailto:Buy2 ">service@Buy2.com</a>
    </div>
</footer>
</body>
</html>