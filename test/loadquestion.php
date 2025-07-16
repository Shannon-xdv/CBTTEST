<?php
if (!isset($_SESSION)) {
    session_start();
}
if (!isset($_SESSION['candidateid'])) {
    echo"You have already submitted your work";
    exit();
}

require_once '../lib/globals.php';
require_once('testfunctions.php');
openConnection(true);
global $dbh;

/* if(!isset($_COOKIE['registercomputer']))
{
echo"You are on an unregistered computer!";
 session_destroy();
exit;
}
$passkey= trim($_COOKIE['registercomputer']);
*/
$_SESSION['firstquestion'] = 0;
$_SESSION['lastquestion'] = 0;

$candidateid = $_SESSION['candidateid'];
$testid = $_SESSION['testid'];
timecontrol($testid, $candidateid, $waitingsecond = 30);

$testinfo = array();

$testinfo = $_SESSION['testinfo'];
//var_dump($testinfo);
$displaymode = $testinfo['displaymode'];
$duration = $testinfo['duration'];
$dailystarttime = $testinfo['starttime'];

//check if the candidate has already submitted in a different browser, then close all other instance of his work
  $query="select completed from  tbltimecontrol where(testid='$testid' and candidateid='$candidateid' and completed=1)";
  $stmt = $dbh->prepare($query);
  $result = $stmt->execute(); 
  $numrows = $stmt->rowCount();
  if($numrows>0){
 echo"You have already submitted your work";
 session_destroy();
exit;
  }
  
  
if (isset($_POST['subject'])) {
    $_SESSION['curentsubject'] = trim($_POST['subject']);
}
$subjectid = $_SESSION['curentsubject'];

$subjectname = "";
$subjectcode = "";
$sub = array();

//echo"$displaymode,$duration,$dailystarttime";
$sub = $_SESSION['studsubject'];
//var_dump($sub);
for ($i = 0; $i < count($sub); $i++) {
    if ($sub['subjectid'] == $subjectid) {
        //	$_SESSION['studsubject']['subjectid'];

        $subjectname = $sub['subjectname'];
        $subjectcode = $sub['subjectcode'];
        $instruction = $sub['instruction'];


        break;
    }
}
?>
<div id="containerdiv"  style="border-width: 0px; border-style: dotted; border-color: green;">
    <div id="subjectinfodiv">
        <p style="font-size: 30px; color: #666666; margin:0px;"><b>SUBJECT: </b><?php echo ucwords(strtolower($subjectcode)) . "(" . ucwords(strtolower($subjectname)) . ")"; ?> </p>
                <p style="font-size: 20px; color:#666666; margin:0px;"><b>INSTRUCTION: </b><?php echo (trim($instruction)) . "(" . ucwords(strtolower($instruction)) . ")"; ?> </p>
                        </div>
                        <?php
                        if ($displaymode == "All") {
                            displayallquestion($candidateid, $testid, $subjectid);
                        } else {
                            //display single questions

                            if (isset($_SESSION['curentquestion'][$subjectid])) {
                                $cur = $_SESSION['curentquestion'][$subjectid];
                                $limit = $cur;

                                //if the control panel is used to go to the question, then set the limit to be of that question
                                if (isset($_POST['navigation'])) {
                                    $limit = $_POST['limit'];
                                }

//				echo "set";
                                //check if the next or prevous was clicked
                                if (isset($_POST['direct'])) {
//				echo"nav used:";
                                    $direction = $_POST['direct'];
                                    if ($direction == "previous") {
                                        if ($limit != 0) {
                                            $limit = $limit - 1;
                                            if ($limit != 0) {
                                                $_SESSION['firstquestion'] = 0;
                                            } else {
                                                $_SESSION['firstquestion'] = 1;
                                            }
                                        } else {
                                            //limit is already zero
                                            $_SESSION['firstquestion'] = 1;
                                        }
                                    } elseif ($direction == "next") {
                                        if ($limit != $_SESSION['totalquestion'][$subjectid] - 1) {
                                            $limit = $limit + 1;
                                            if ($limit == $_SESSION['totalquestion'][$subjectid] - 1) {
                                                //$limit=$limit-1;
                                                //last question disable next
                                                $_SESSION['lastquestion'] = 1;
                                            } else {

                                                //not yet the last  question disable next

                                                $_SESSION['lastquestion'] = 0;
                                            }
                                        } else {
                                            //already the end
                                            $_SESSION['lastquestion'] = 1;
                                        }
                                    }
                                } else {
                                    //direction button not used. check if the curent question is the first or not to disable one of the navigation button
                                    if ($limit == 0) {
                                        $_SESSION['firstquestion'] = 1;
                                    } elseif ($limit == $_SESSION['totalquestion'][$subjectid] - 1) {
                                        $_SESSION['lastquestion'] = 1;
                                    }
                                }
                                //set the current question
                                $_SESSION['curentquestion'][$subjectid] = $limit;
                            } else {
                                $cur = 0;
                                $limit = 0;
                                //echo"not set";
                                $_SESSION['curentquestion'][$subjectid] = 0;
                                //get the maximum number of question
                                $queryquest = "SELECT DISTINCT (`questionid`), subjectid FROM `tblpresentation` 
                                inner join tbltestsection on tbltestsection.testsectionid=tblpresentation.sectionid
                                inner join tbltestsubject on tbltestsection.testsubjectid=tbltestsubject.testsubjectid
                                WHERE 	tblpresentation.testid='$testid' and tblpresentation.candidateid='$candidateid' and 
                                tbltestsubject.subjectid='$subjectid'";

                                $stmt1 = $dbh->prepare($queryquest);
                                $result = $stmt1->execute();
                                $numrows = $stmt1->rowCount();

                                if ($numrows > 0) {
                                    $_SESSION['totalquestion'][$subjectid] = $numrows;
                                } else {
                                    $_SESSION['totalquestion'][$subjectid] = 0;
                                }
                            }
                            ///////////////
                            $query = "SELECT DISTINCT (`questionid`), subjectid FROM `tblpresentation` 
                                    inner join tbltestsection on tbltestsection.testsectionid=tblpresentation.sectionid
                                    inner join tbltestsubject on tbltestsection.testsubjectid=tbltestsubject.testsubjectid
                                    WHERE 	tblpresentation.testid='$testid' and tblpresentation.candidateid='$candidateid' and 
                                    tbltestsubject.subjectid='$subjectid' limit $limit,1";
                            //echo $query;
                                $stmt2 = $dbh->prepare($query);
                                $result = $stmt2->execute();
                                $numrows = $stmt2->rowCount();
                           // if ($numrows > 0) {
                                //$curentquestion = mysql_result($result, 0, 'questionid');
                                if ($numrows >0) {
                                    $row = $stmt2->fetch(PDO::FETCH_ASSOC);
                                    $curentquestion = $row['questionid']; 
                                }
                           
                            displaysinglequestion($candidateid, $testid, $subjectid, $curentquestion);
                        }
                        ?>

                        </div>


