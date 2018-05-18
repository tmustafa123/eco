<?php
require('fpdf.php');

session_start();
/*$conect = mysql_connect("localhost", "root", "");
mysql_select_db("db_name", $conect);

$sql = "INSERT INTO table_name (name, email, mobile, comment) VALUES ('".$_POST["name"]."', '".$_POST["email"]."', '".$_POST["mobile"]."', '".$_POST["comment"]."');";

mysql_query($sql);*/

if(empty($_SESSION["item_number"])) 
{
header('Location:index.php'); 
exit();

}
class PDF extends FPDF
{
// Page header
function Header()
{
    // Logo
    $this->Image('pic.png',10,6,30);
    // Arial bold 15
    $this->SetFont('Arial','B',10);
    // Move to the right
    $this->Cell(80);
    // Title
    $this->Cell(60,10,'BUY2  Online Purchase Invoice','C');
    // Line break
    $this->Ln(20);
}

// Page footer
function Footer()
{
    // Position at 1.5 cm from bottom
   
    $this->SetFont('Arial','I',8);
    $this->SetY(-45);
    $this->Cell(0,10,'__________________________________________________________________________________________','C');
     $this->SetY(-40);
    $this->Cell(0,10,'This is a company generated invoice and doesnot need any verification These Online Shopping Terms and Conditions, the use of this website and any ','C');
$this->SetY(-35);
    $this->Cell(0,10,'order or purchase made through the facilities of this website shall be governed by the laws of the province of the South Tyrol and the laws of the Italy ','C');
    $this->SetY(-30);
    $this->Cell(0,10,'applicable therein.','C');

    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->SetY(-15);
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}

}

// Instanciation of inherited class
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);
$it="Confirmed";

$name=$_SESSION["customer_new"][0];
$address=$_SESSION["customer_new"][2];
$email=$_SESSION["customer_new"][6];
$phone=$_SESSION["customer_new"][7];
$pdf->Cell(0,10,'',0,1);
$pdf->Cell(0,10,'Name : '.$name,0,1);
$pdf->Cell(0,10,'Email : '.$email,0,1);
$pdf->Cell(0,10,'Address : '.$address,0,1);
$pdf->Cell(0,10,'Phone : '.$phone,0,1);

foreach ($_SESSION["cart_item"] as $item)
{   
$pdf->Cell(0,10,'',0,1);
$pdf->Cell(0,10,'Item : '.$item["name"],0,1);
$pdf->Cell(0,10,'Qauntity : '.$item["qauntity"],0,1);
$pdf->Cell(0,10,'Price/Item : '.$item["price"],0,1);
$pdf->Cell(0,10,'Total Bill : '.$item["bill"],0,1);

$pdf->Cell(0,10,'STATUS : '.$it,0,1);

}



$pdf->Output();
//unset($_SESSION["cart_item"]);
unset($_SESSION["customer_new"]);
unset($_SESSION["item_number"]);

?>