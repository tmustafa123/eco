<?php include 'includes/header.php'; 
//include 'includes/dbcontroller.php';
include 'includes/rb.php';
//$db_handle = new DBController();



////////////////////////////////////////////////////////////////////////REDBEAN 
if(!R::testConnection())
{
        R::setup('mysql:host=localhost;dbname=ecommerce', 'root', '');
}
if(!empty($_GET['id'])) 
{

    $id=$_GET['id'];
    $pages = R::find('categories',' id = ? ', array( $id ));
    //var_dump($pages); exit;
    if($pages)
    {
    foreach ($pages as $entry)
    {
        if($entry['id'])
        {
        $_SESSION["item_ID"]=$id;   
        break;
        }

    }
    }
    else
    {
            header('Location:index.php');
            exit();
    }
       //exit();

    // }       WORKS OKAAAAYYYYYYYYY
}


$ob=R::load('categories',$id);


$ob1=R::load('main_categories',$ob->parent_id);


$pages2 = R::find('items',' category_id = ? ', array( $id ));
?>

<article id="grid">   
	<div id="breadcrumb"><a href="index.php">Home</a> > <a href=""><?php if(isset($ob1->main_category))echo $ob1->main_category ; ?></a> > <h1><?php if(isset($ob->category_name))echo$ob->category_name ; ?></h1></div>
    <header>
        <div class="paging">
            Page: <a href="">1</a>&nbsp; | &nbsp;2&nbsp; | &nbsp;<a  href="">3</a>  |  <a  href="">View All</a>
        </div>
        <form action="#" >
        <select onchange="javascript:addSort();" name="sortBy" id="sortBy">
            <option value="">Default</option>
            <option value="PriceHiLo">Price (High to Low)</option>
            <option value="PriceLoHi">Price (Low to High)</option>
            <option value="pID">Most Recent</option>
        </select> &nbsp; Showing 26 - 50 of 78 Product(s)
        </form>
    </header>
    <ul id="items">
<?php
//$ob2=R::load('items',$id);
     foreach($pages2 as $entry)
    { 
     ?>      
       <li> 
            <a href="item.php?id=<?php echo $entry['id']; ?>">
            <img src=<?php echo $entry['pic_path']; ?> alt=""/></a>
            <a href="item.php?id=<?php echo $entry['id']; ?>" class="title"><?php echo $entry['name']; ?></a>
            <strong>&pound;<?php echo $entry['price']; ?></strong>
      </li>
<?php }
?>
    </ul>
    <footer>
        <div class="paging">
            Page: <a  href="">1</a>&nbsp; | &nbsp;2&nbsp; | &nbsp;<a > href="">3</a>  |  <a > href="">View All</a>
        </div>
    </footer>
</article>
<footer>
	<div class="wrapper">
    	<span class="logo">Buy2</span>
        Sitemap</a> <a href="#">Terms &amp; Conditions</a> <a href="#">Shipping &amp; Returns</a> <a href="#">Size Guide</a><a href="#">Help</a> <br />
        Address to said Buy2 comp, including postcode &nbsp;-&nbsp; 1.888.CO.name <a href="">service@Buy2comp.com</a>
    </div>
</footer>
</body>
</html>
