<?php

if (!isset($_SESSION))
    session_start();

require_once("../../lib/globals.php");
openConnection();
global $dbh;
$timespent=$_POST['timespent'];
$timespent= ($timespent-0) * 60;
$candid = $_POST['candid'];
$examtype = $_POST['examtyp'];

$query="select starttime from tbltimecontrol WHERE candidateid=? && testid=?";
$stmt=$dbh->prepare($query);
$stmt->execute(array($candid,$examtype));
$row = $stmt->fetch(PDO::FETCH_ASSOC);

$stime= $row['starttime'];
$stimedt= new DateTime($stime);
$ctime= $stimedt->add(new DateInterval("PT".$timespent."S"));

$query1="UPDATE tbltimecontrol SET curenttime= '".$ctime->format("H:i:s")."', elapsed=? WHERE candidateid=? && testid=?";
$stmt1=$dbh->prepare($query1);
$exec=$stmt1->execute(array($timespent,$candid,$examtype));

    if($exec){
        echo 1;
        exit();
    }
    echo 0;
    exit();
?>