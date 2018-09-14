<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "../conn.php";
$data = json_decode(file_get_contents("php://input"));

$rows = array();
//students
$result = $conn->prepare("SELECT * FROM user WHERE role = ?"); 
$result->execute(array('saint'));

$counts = new Counts();
$counts->key ="Saints";
$counts->value =$result->rowCount() ;
$rows["data"][]= $counts;

//admins
$result = $conn->prepare("SELECT * FROM user WHERE role = ?"); 
$result->execute(array('admin'));

$counts = new Counts();
$counts->key ="Admins";
$counts->value =$result->rowCount() ;
$rows["data"][]= $counts;
//subject
$result = $conn->prepare("SELECT * FROM announcement where status=?"); 
$result->execute(array('active'));

$counts = new Counts();
$counts->key ="Announcement";
$counts->value =$result->rowCount() ;
$rows["data"][]= $counts;

//lecture
$result = $conn->prepare("SELECT * FROM assert"); 
$result->execute(array());

$counts = new Counts();
$counts->key ="Asserts";
$counts->value =$result->rowCount() ;
$rows["data"][]= $counts;
//department
$result = $conn->prepare("SELECT * FROM event Where status=?"); 
$result->execute(array('upcoming'));

$counts = new Counts();
$counts->key ="Events";
$counts->value =$result->rowCount() ;
$rows["data"][]= $counts;


echo json_encode($rows);

?>
  <?php
        class Counts {
            public $key ;
            public $value;
          }
          
        ?>
