<?php

if (!isset($_SESSION))
    session_start();

require_once("lib/globals.php");

openConnection();

//Array to store validation errors
$errmsg_arr = array();

//Validation error flag
$errflag = false;

$employeeid = clean($_SESSION['MEMBER_USERID']);
$oldpassword = clean($_POST['oldpassword']);
$newpassword = clean($_POST['newpassword']);
$reenterpassword = clean($_POST['reenterpassword']);

//Input Validations
if ($oldpassword == '') {
    $errmsg_arr[] = 'Old password is missing';
    $errflag = true;
}
if ($newpassword == '') {
    $errmsg_arr[] = 'New password is missing';
    $errflag = true;
}
if ($reenterpassword == '') {
    $errmsg_arr[] = 'Re-enter password is missing';
    $errflag = true;
}
if (strcmp($newpassword, $reenterpassword) != 0) {
    $errmsg_arr[] = 'Password do not match';
    $errflag = true;
}

if ($errflag == false) {
    $query = "SELECT * FROM user WHERE id = ? AND password = SHA1(?)";
    $stmt=$dbh->prepare($query);
    $stmt->execute(array($employeeid,$oldpassword));

    if ($result) {
        if ($stmt->rowCount() < 1) {
            $errmsg_arr[] = 'Incorrect old password';
            $errflag = true;
        }
    }
}

//If there are input validations, redirect back to the login form
if ($errflag) {
    $_SESSION['ERRMSG_ARR'] = $errmsg_arr;
    session_write_close();
    header("location: changepassword.php");
    exit();
}


$query1 = "UPDATE user set password = SHA1(?) WHERE id = ?";
$stmt=$dbh->prepare($query1);
$stmt->execute(array($newpassword,$employeeid));

//Check whether the query was successful or not
if ($result) {
    $_SESSION = array();
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]
        );
    }

    // Finally, destroy the session.
    session_destroy();
    header("location: changepassword_success.php");
    exit();
} else {
    $errmsg_arr[] = 'Server error!';
    $_SESSION['ERRMSG_ARR'] = $errmsg_arr;
    session_write_close();
    header("location: changepassword.php");
    exit();
}
?>