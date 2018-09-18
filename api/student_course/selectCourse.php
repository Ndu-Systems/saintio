<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "../conn.php";

if (isset($_GET['studentID'])) {
    $studentID = $_GET['studentID'];
    $rows = array();

    $result = $conn->prepare("SELECT * FROM user WHERE id = ?");
    $result->execute(array(
        $studentID,
    ));
    if ($result->rowCount() > 0) {
        while ($row = $result->fetch(PDO::FETCH_OBJ)) {
            $data = new Saint();
            $data->id = $row->id;
            $data->title = $row->title;
            $data->name = $row->name;
            $data->surname = $row->surname;
            $data->email = $row->email;
            $data->cell = $row->cell;
            $data->address = $row->address;
            $data->acuptation = $row->acuptation;
            $data->dateJoined = $row->dateJoined;
            $data->status = $row->status;
            $data->agegroup = $row->agegroup;
            $data->meritalStatus = $row->meritalStatus;

            $data->getAttendance($conn);
            $rows[] = $data;
        }
    }

    echo json_encode($rows);
}
class Saint
{
    public $id;
    public $title;
    public $name;
    public $surname;
    public $email;
    public $cell;
    public $address;
    public $acuptation;
    public $dateJoined;
    public $status;
    public $agegroup;
    public $meritalStatus;

    public $registerLS;

    public function getAttendance($conn)
    {

        $course = $conn->prepare("SELECT * FROM register WHERE userID = ?");
        $course->execute(array(
            $this->id,
        ));
        $results = $course->fetchAll(PDO::FETCH_ASSOC);
        $this->registerLS = $results;

    }

}



