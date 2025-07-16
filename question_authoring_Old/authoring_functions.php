<?php

require_once("../lib/globals.php");
openConnection();

function is_used($qid) {
    global $dbh;

    $query = 'select * from tbltestquestion where questionbankid=?';
    $stmt=$dbh->prepare($query);
    $stmt->execute(array($qid));
    if ($stmt->rowCount() == 0) {
        return false;
    }
    return true;
}

function get_topics_as_options($subj, $topic="", $general=false) {
    global $dbh;

    $query = "select * from tbltopics where subjectid=?";
    $stmt=$dbh->prepare($query);
    $stmt->execute(array($subj));

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        if (strtoupper($row['topicname']) == "GENERAL" && $general == false)
            continue;
        echo"<option value='" . $row['topicid'] . "' " . (($row['topicid'] == $topic) ? ("selected='selected'") : ("")) . ">" . $row['topicname'] . "</option>";
    }
}

function get_subject_as_options($subjcat="", $subj="") {
    global $dbh;

    if ($subjcat == ""){
        $query = "select * from tblsubject";
    $stmt=$dbh->prepare($query);
    $stmt->execute();
    }
    else
        $query = "select * from tblsubject where subjectcategory=?";
    $stmt=$dbh->prepare($query);
    $stmt->execute(array($subjcat));

    echo"<option value=''>--Select subject--</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
        echo"<option value='" . $row['subjectid'] . "' " . (($row['subjectid'] == $subj) ? ("selected='selected'") : ("")) . ">" . $row['subjectcode'] . " - " . $row['subjectname'] . "</option>";
}

function get_presentation_preview($qid, $counter) {
    global $dbh;

    $query = "select * from tblquestionbank where questionbankid=?";
    $stmt=$dbh->prepare($query);
    $stmt->execute(array($qid));

    if ($stmt->rowCount() > 0) {
//create the questions
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $questiontitle = $row['title'];
        echo'<div class="questionanswerdiv" style="width:70%">
    <div class="qadiv" style="background-color:#ffffff"><div class="questiondiv" >';
        echo " <b>Question $counter: </b>";
        echo html_entity_decode($questiontitle, ENT_QUOTES);
        echo'</div>
        <div class="answerdiv">';

        show_option_preview($qid, $questiontype = "OBJ");
        echo"</div>";
        echo"</div></div>";
    }
}

function show_option_preview($questionid, $questiontype="OBJ") {
    global $dbh;
    if ($questiontype == "OBJ") {
//objectve question
        $queryquest = "SELECT answerid, correctness, test FROM tblansweroptions 
                    where(questionbankid='$questionid')";
        $stmt=$dbh->prepare($queryquest);
        $stmt->execute();
        echo"<ol class='ansopt'>";
        while ($rows=$stmt->fetch(PDO::FETCH_ASSOC)) {
            $answerid = $rows['answerid'];
            $correctness = $rows['correctness'];
            $answertext = $rows['test'];
            $answertext = stripslashes($answertext);
            if($correctness==1){
                echo"<li class='answer'>  <label class='optionlabel'><table class='answertb' style='margin:2px;'><tr><td>" . html_entity_decode($answertext, ENT_QUOTES) . "</td><td><img src='".siteUrl("assets/img/tickIcon.png")."' /></td></tr></table></label> </li>";
            }else{
                echo"<li>  <label class='optionlabel'>" . html_entity_decode($answertext, ENT_QUOTES) . "</label> </li>";
            }
        }//endfor
        echo"</ol>";
        //mysql_free_result($resultquest);
    } else {
//specify another questiontype;
    }
}
?>