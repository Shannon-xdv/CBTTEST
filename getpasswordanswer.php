<?php

if (!isset($_SESSION))
    session_start();

require_once("lib/globals.php");

openConnection();

$username = clean($_POST['username']);
$answer = clean($_POST['answer']);


$query = "SELECT * FROM user WHERE username = ? AND answer = ?";
$stmt=$dbh->prepare($query);
$stmt->execute(array($username,$answer));

//Check whether the query was successful or not
if ($result) {
    if ($stmt->rowCount() == 1) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        echo "Recovered Password: " . $row['password'];
        exit();
    }
}
?>