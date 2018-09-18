<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "../conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->name)) {
    $name = $data->name;
    $surname = $data->surname;
    $cell = $data->cell;
    $password = $data->surname;
    $address = $data->address;
    $role = $data->role;
    $acuptation = $data->acuptation;
    $meritalStatus = $data->meritalStatus;
    $email = $data->email;
    $title = $data->title;
    $agegroup = $data->agegroup;
    $dateJoined = $data->dateJoined;

    $result = $conn->prepare("SELECT * FROM user WHERE email = ?");
    $result->execute(array($email));
    if ($result->rowCount() == 0) {
        $result = $conn->prepare("INSERT INTO user (name,surname, email,cell,address,role,acuptation, password,meritalStatus,agegroup,title,status,dateJoined,createdate)
                VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?, now())");
        if ($result->execute(array($name, $surname, $email, $cell, $address, $role, $acuptation, $password, $meritalStatus, $agegroup, $title, 'active', $dateJoined))) {
             $studentID = $conn->lastInsertId();
            $result = $conn->prepare("INSERT INTO register (date, status, userID, reason, createdate)
	VALUES (?,?,?,?, now())");
            if ($result->execute(array("new", 'new', $studentID, 'new'))) {
                echo 1;
            }
        } else {
            echo json_encode("error while trying to register client step 1 of 3");
        }

    } else {

        echo json_encode("Saint account already exists");
    }

} else {

    echo json_encode("500");
}
