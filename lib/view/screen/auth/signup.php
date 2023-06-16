<?php
include "./connect.php";

$username = filterRequest("username");
$password = filterRequest("password");
$phone = filterRequest("phone");
$email = filterRequest("email");
$code = "0";

$stmt = $con->prepare("SELECT * FROM users WHERE email=? OR phone=?");
$stmt->execute(array($email,$phone));

$count = $stmt->rowCount();

if ($count > 0){
    echo "failure";
}else{
    $data = array(
        "username" => $username,
        "password" => $password,
        "phone" => $phone,
        "email" => $email,
        "code" => $code,
    )
    insertData("users", $data)
}