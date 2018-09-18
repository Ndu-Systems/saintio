<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
require "../conn.php";
$data = json_decode(file_get_contents("php://input"));

if (isset($data->userID)) {
    $date = $data->date;
    $status = $data->status;
    $userID = $data->userID;
    $reason = $data->reason;

    $result = $conn->prepare("SELECT * FROM register WHERE userID = ? AND date=?");
    $result->execute(array($userID, $date));
    if ($result->rowCount() == 0) {
        $result = $conn->prepare("INSERT INTO register (date, status, userID, reason, createdate)
                VALUES (?,?,?,?, now())");
        if ($result->execute(array($date, $status, $userID, $reason))) {
            echo 1;
        } else {
            echo json_encode("error while save register");
        }

    } else {
        // update
        $result = $conn->prepare("
    UPDATE register SET
    status=?,
    reason=?,
    WHERE userID = ? AND date = ?
");
        if ($result->execute(array($status, $reason, $userID, $date))) {
            echo 1;
        } else {
            echo json_encode("error while update register");

        }
    }

} else {

    echo json_encode("500");
}
