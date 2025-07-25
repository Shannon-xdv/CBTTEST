<?php

function testopened($testid) {
    global $dbh;
    //this functionn return true if the test is opened and false otherwise
    if (isset($testid)) {
        $query = "SELECT status from tbltestconfig where(testid='$testid' and status=1)";
        $stmt=$dbh->prepare($query);
        $stmt->execute();
        if ($stmt->rowCount() > 0) {
            return true;
        }
    }
    return false;
}

function checkcompletion($testid, $candidateid) {
    global $dbh;
    $query = "SELECT completed, elapsed, duration from tbltimecontrol INNER JOIN tbltestconfig on 
    tbltimecontrol.testid=tbltestconfig.testid where(tbltimecontrol.testid='$testid' and tbltimecontrol.candidateid='$candidateid')";
    $stmt = $dbh->prepare($query);
    $stmt->execute();
    $numrows = $stmt->rowCount();
    if ($numrows >=1) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $completed = $row['completed'];
        if ($completed == 1) {
            return true;
        } else {
            //check if elapsed time is up to duration
            $elapsed = $row['elapsed'];
            $duration = $row['duration'];
            $duration = $duration * 60; //convert duration to second
          
            if ($duration > $elapsed) {
                return false;
            } else {
                return true;
            }
        }
    } else {
        // the candidate has not stated
        return false;
    }
}

function timecontrol($testid, $candidateid, $waitingsecond) {
    global $dbh;
    if (isset($testid) && isset($candidateid)) {
        /* this function update the tbltimecontrol to keep track of the number of second spent by the student 
          and return the elapsed time in second

         */
        $testinfo = array();
        $testinfo = $_SESSION['testinfo'];
        $duration = $testinfo['duration'];

        $curenttime = new DateTime();
        $curenttime1 = $curenttime->format('H:i:s');
        $elapsed = 0;

        $ip = getIpAddress();

        //get the last saved time
        $querysavedtime = "SELECT curtime() as now, curenttime,elapsed,starttime FROM `tbltimecontrol` 
        where(testid='$testid' and candidateid='$candidateid') order by curenttime DESC";
        $stmt = $dbh->prepare($querysavedtime);
        $stmt->execute();
        $numrows = $stmt->rowCount();

        if ($numrows > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $storedcurtime = $row['curenttime'];
            $storedelapsed = $row['elapsed'];
            if ($storedelapsed == "") {
                $storedelapsed = 0;
            }
            $starttime = $row['starttime'];
            $curenttime = $row['now'];
            $storeddate = new DateTime($storedcurtime);
            $curenttime = new DateTime($curenttime);
            $curenttime1 = $curenttime->format('H:i:s');
            $date1 = $storeddate->format('H:i:s');

            $second = abs(strtotime($curenttime1) - strtotime($date1));

            if ($second <= ($waitingsecond + 20)) { //adding 20 second to the normal waiting duration to cather for server delay in processing
                //no problem has occured since we are still in the acceptable range of elapsed time
                $elapsed = $storedelapsed + $second;
                if ($elapsed < $duration * 60) {
                    $qry = "REPLACE into tbltimecontrol (testid,candidateid,starttime,curenttime,elapsed,ip) values
			     ('$testid','$candidateid','$starttime','$curenttime1',$elapsed,'$ip')";
                    $stmt = $dbh->prepare($qry);
                    $stmt->execute();
                } else {//time up
                    $qry = "REPLACE into tbltimecontrol (testid,candidateid,completed,starttime,curenttime,elapsed,ip) values
				('$testid','$candidateid',1,'$starttime','$curenttime1',$elapsed,'$ip')";
                     $stmt = $dbh->prepare($qry);
                     $stmt->execute();
                    //include logout here
                }
                //echo "". $qry;
            } else {
                //there is a delay. probably the server was not reachable. or they was a logout. so store the last time the server was accessed
                $qry = "REPLACE into tbltimecontrol (testid,candidateid,starttime,curenttime,elapsed,ip) values
			 ('$testid','$candidateid','$starttime','$curenttime1',$storedelapsed,'$ip')";
                $stmt = $dbh->prepare($qry);
                $stmt->execute();
                //echo $qry;
            }
           // mysql_free_result($querysavedtime);
        } else {//first time to login. store the start time and the elapsed time based on starting mode.
            $startingmode = $testinfo['startingmode'];
            if ($startingmode == 'on login') {
                $starttime = $curenttime1;
                $elapsed = 0;
            } else {//on start time add the late period
                $starttime = $testinfo['starttime'];
                $elapsed = abs(strtotime($curenttime1) - strtotime($starttime));
            }

            //$testinfo=array();
            $qry = "INSERT into tbltimecontrol (testid,candidateid,starttime,curenttime,elapsed,ip) values
		 ('$testid','$candidateid','$starttime','$curenttime1',$elapsed,'$ip')";
			 $stmt = $dbh->prepare($qry);
             $stmt->execute();
        }
    } else {
        //not identified. testid or candidateid not set//log out
    }
    $_SESSION['testinfo']['remainingsecond'] = $duration * 60 - $elapsed;

    return $elapsed;
}

function validateversion($testid, $versionid) {
    global $dbh;
    //this function check if the number of questions set is up to the defined number of questions during the test configuration for a specific version
    //return true if the version has enough question and false otherwise.
    if (isset($testid) && isset($versionid)) {

        //  get all the subject for the test
        $question = "SELECT testid,subjectid from tbltestsubject WHERE(testid='$testid')";
        $stmt = $dbh->prepare($question);
        $stmt->execute();
        $numrows = $stmt->rowCount();

        if ($numrows > 0) {
            
            for ($i = 0; $i < $numrows; $i++) {
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                $subjectid = $row['subjectid'];
                //$subjectid = mysql_result($row'subjectid');
                //for each subject get all the section and check if the section have enough questions
                $qsection = "SELECT testsectionid,num_toanswer,numofeasy,numofmoderate,numofdifficult
			from tbltestsection INNER JOIN tbltestsubject ON tbltestsection.testsubjectid=tbltestsubject.testsubjectid
			WHERE	(subjectid='$subjectid' and testid='$testid') order by testsectionid ";

                $stmt = $dbh->prepare($qsection);
                $stmt->execute();
                $numrows = $stmt->rowCount();

                if ($numrows > 0) {
                    for ($j = 0; $j < $numrows; $j++) {
                        $row = $stmt->fetch(PDO::FETCH_ASSOC);
                        $testsectionid = $row['testsectionid'][$j];
                        $num_toanswer = $row['num_toanswer'][$j];
                        $numofdifficult = (int) $row['numofdifficult'][$j];
                        $numofmoderate = (int) $row['numofmoderate'][$j];
                        $numofeasy = (int) $row['numofeasy'][$j];

                        //get what is actualy available and compare with the stated number
                        //number of easy already set
                        $questionsimple = "SELECT count(tbltestquestion.questionbankid)as total FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
                    WHERE(testsectionid='$testsectionid' and difficultylevel='simple' and version='$versionid')";
                    $stmt = $dbh->prepare($questionsimple);
                    $stmt->execute();
                    $row1 = $stmt->fetch(PDO::FETCH_ASSOC);
                    $numrows = $stmt->rowCount();
                    if($numrows > 0){
                        $simple = $row1['total'];
                    }

                        //number of difficult already set
                        $questiondifficult ="SELECT count(tbltestquestion.questionbankid)as total FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
                    WHERE(testsectionid='$testsectionid' and difficultylevel='difficult' and version='$versionid')";
                    $stmt = $dbh->prepare($questiondifficult);
                    $stmt->execute();
                    $row2 = $stmt->fetch(PDO::FETCH_ASSOC);
                    $numrows = $stmt->rowCount();
                    if($numrows > 0){
                        $difficult = $row2['total'];
                    }
                       

                        //number of moredifficult already set
                        $questionmoredifficult = "SELECT count(tbltestquestion.questionbankid)as total FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
                    WHERE(testsectionid='$testsectionid' and difficultylevel='moredifficult' and version='$versionid')";
                    $stmt = $dbh->prepare($questionmoredifficult);
                    $stmt->execute();
                    $row3 = $stmt->fetch(PDO::FETCH_ASSOC);
                    $numrows = $stmt->rowCount();
                    if($numrows > 0){
                        $moredifficult = $row3['total'];
                    }
                        $moredifficult = (int) mysql_result($questionmoredifficult, 0, 'total');
                        ///compare the number of questions. if one of the level is not yet set to the required number then return false
                        if (($numofeasy > $simple) || ($numofmoderate > $difficult) || ($numofdifficult > $moredifficult)) {
                            return false;
                        }
                    }
                } else {
                    //subject has no section
                    return false;
                }
            }
        } else {
            //test subject not set
            return false;
        }
    } else {
        //not identified. testid or versionid not set
        return false;
    }
    //if false is not yet returned then the question composition is correct
    return true;
}

function activeversion($testid) {
    global $dbh;
    $queryactive = "SELECT activeversion from tbltestconfig where(testid='$testid')";
    $stmt = $dbh->prepare($queryactive);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    $numrows = $stmt->rowCount();
    if ($numrows > 0) {
        return $row['activeversion'];
    } else {
        return 0;
    }
}

function createcandidatequestions($testid, $candidateid, $questionadministration, $optionadministration, $version) {
    global $dbh;
    //this function create a question paper for each candidate based on test settings and populate the display table
    //get all the subject the candidate registered for during the test
    $query = "SELECT subjectid from tblcandidatestudent inner join tblscheduling on 
	tblcandidatestudent.scheduleid=tblscheduling.schedulingid WHERE(candidateid='$candidateid' and testid='$testid')";
    $stmt = $dbh->prepare($query);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $numrows = $stmt->rowCount();
    if ($numrows > 0) {
        //create a query to combine the values to be stored in the presentation table
        $querypresentation = "INSERT INTO tblpresentation(candidateid,testid,sectionid,questionid,answerid) values";

        for ($i = 0; $i < $numrows; $i++) {
            //for each subject, get all the section
            $subjectid = $row['subjectid'][$i];
            if ($questionadministration == "linear") {
                $qsection = "SELECT testsectionid,num_toanswer,numofeasy,numofmoderate,numofdifficult
			from tbltestsection INNER JOIN tbltestsubject ON tbltestsection.testsubjectid=tbltestsubject.testsubjectid
			WHERE	(subjectid='$subjectid' and testid='$testid') order by testsectionid ";
            } else {//randomize the selection of the section
                $qsection = "SELECT testsectionid,num_toanswer,numofeasy,numofmoderate,numofdifficult
			from tbltestsection INNER JOIN tbltestsubject ON tbltestsection.testsubjectid=tbltestsubject.testsubjectid
			WHERE	(subjectid='$subjectid' and testid='$testid') order by RAND()";
            }
            $stmt = $dbh->prepare($qsection);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $numrows = $stmt->rowCount();
            if ($numrows  > 0) {
                for ($j = 0; $j < $numrows; $j++) {
                    $testsectionid = $row['testsectionid'][$j];
                    $num_toanswer = $row['num_toanswer'][$j];
                    $numofdifficult = (int) $row['numofdifficult'][$j];
                    $numofmoderate = (int) $row['numofmoderate'][$j];
                    $numofeasy = (int) $row['numofeasy'][$j];
                    //
                    //select the question based on the configuration specified 
                    if ($questionadministration == "linear") {

                        $qquestion = "(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='simple' and version='$version') limit $numofeasy)
					UNION
					(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='difficult'and version='$version') limit $numofmoderate)
					UNION
					(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='moredifficult'and version='$version') limit $numofdifficult)";
                    } else {//randomize the question
                        $qquestion = "(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='simple'and version='$version') order by RAND() limit $numofeasy)
					UNION
					(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='difficult'and version='$version') order by RAND() limit $numofmoderate)
					UNION
					(SELECT testsectionid,tbltestquestion.questionbankid FROM tbltestquestion
					inner join tblquestionbank on tbltestquestion.questionbankid=tblquestionbank.questionbankid
					WHERE(testsectionid='$testsectionid' and difficultylevel='moredifficult'and version='$version') order by RAND() limit $numofdifficult)";
                    }
                    $stmt = $dbh->prepare($qsection);
                    $stmt->execute();
                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                    $numrows = $stmt->rowCount();
                    //get the order of option to be presented to the students
                    if ($numrows > 0) {
                        for ($k = 0; $k < $numrows; $k++) {
                            $questionbankid = $row['questionbankid'][$k];

                            //select the order of options to be presented to student and store them into presentation table
                            if ($optionadministration == "linear") {
                                $qoption = "SELECT * from tblansweroptions where(questionbankid='$questionbankid')";
                            } else {
                                $qoption = "SELECT * from tblansweroptions where(questionbankid='$questionbankid') order by RAND()";
                            }
                            $stmt = $dbh->prepare($qoption);
                            $stmt->execute();
                            $row = $stmt->fetch(PDO::FETCH_ASSOC);
                            $numrows = $stmt->rowCount();

                            if ($numrows > 0) {
                                for ($l = 0; $l < $numrows; $l++) {
                                    $answerid = $row['answerid'][$l];
                                    //concatenate the query.
                                    if ($querypresentation == "INSERT INTO tblpresentation(candidateid,testid,sectionid,questionid,answerid) values") {
                                        $querypresentation = $querypresentation . "('$candidateid','$testid','$testsectionid','$questionbankid','$answerid')";
                                    } else {
                                        $querypresentation = $querypresentation . ",('$candidateid','$testid','$testsectionid','$questionbankid','$answerid')";
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }
        //execute the final query
        if ($querypresentation != "INSERT INTO tblpresentation(candidateid,testid,sectionid,questionid,answerid) values") {
            $stmt = $dbh->prepare($querypresentation);
            $insertdata = $stmt->execute();
        }
    }
}

function testpresentation($candidateid, $testid, $subjectid, $displaymode) {
    global $dbh;
//this function get the question for the student based on his display mode.
//get all the questions and place them in session to minimize the number of query in the server
    if (!isset($_SESSION['candidatequestion'])) { //and curentsubject=subjectid
        //get all the question
        $studquestion = "SELECT distinct candidateid,testid,tblpresentation.sectionid,questionid from tblpresentation 
		INNER JOIN tblsection on tblpresentation.sectionid=tbltestsection.sectionid
        WHERE(candidateid='$candidateid' and testid='$testid' and testsubjectid='$subjectid')";
        $stmt = $dbh->prepare($studquestion);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $numrows = $stmt->rowCount();

        if ($numrows > 0) {
            $candidatequestion = array();
            for ($i = 0; $i < $numrows; $i++) {
                $candidatequestion['testid'][$i] = $row['testid'][$i];
                $candidatequestion['sectionid'][$i] = $row['sectionid'][$i]; 
                $candidatequestion['questionid'][$i] = $row['questionid'][$i];
                //$candidatequestion['instruction']=mysql_result($querystudquestion,$i,'testid');
            }
            //place the question in session variable
            $_SESSION['candidatequestion'] = $candidatequestion;
           
        }
    }
}

function getquestion() {
    global $dbh;
    if (!isset($_SESSION['candidatequestion'])) { //and curentsubject=subjectid
        //get all the question
        $studquestion = "SELECT candidateid,testid,tblpresentation.sectionid,questionid,answerid from tblpresentation 
			INNER JOIN tblsection on tblpresentation.sectionid=tbltestsection.sectionid
			WHERE(candidateid='$candidateid' and testid='$testid' and testsubjectid='$subjectid')";
        $stmt = $dbh->prepare($studquestion);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $numrows = $stmt->rowCount();
        if ($numrows > 0) {
            $candidatequestion = array();
            for ($i = 0; $i < $numrows; $i++) {
                $candidatequestion['testid'][$i] = $row['testid'][$i];
                $candidatequestion['sectionid'][$i] = $row['sectionid'][$i];
                $candidatequestion['questionid'][$i] = $row['questionid'][$i];
                $candidatequestion['answerid'][$i] = $row['answerid'][$i];
                
            }
            //place the question in session variable
            $_SESSION['candidatequestion'] = $candidatequestion;
            
        }
    }
}

function getnextquestion($curentsubject) {
    $candidatequestion = array();

    if (isset($_SESSION['candidatequestion'])) {
        $candidatequestion = $_SESSION['candidatequestion'];
        if (isset($_SESSION['curentquestion'][$curentsubject])) {
            $curent = $_SESSION['curentquestion'][$curentsubject];
        } else {
            $curent = 0;
        }
        if (isset($candidatequestion[$curentsubject][$curent + 1])) {
            $_SESSION['curentquestion'][$curentsubject] = $curent + 1;
            return $candidatequestion[$curentsubject][$curent + 1];
        } else {
            return $candidatequestion[$curentsubject][$curent];
        }
    }
}

function getpreviousquestion($curentsubject) {
    $candidatequestion = array();

    if (isset($_SESSION['candidatequestion'])) {
        $candidatequestion = $_SESSION['candidatequestion'];
        if (isset($_SESSION['curentquestion'][$curentsubject])) {
            $curent = $_SESSION['curentquestion'][$curentsubject];
        } else {
            $curent = 0;
        }
        if (isset($candidatequestion[$curentsubject][$curent - 1])) {
            $_SESSION['curentquestion'][$curentsubject] = $curent - 1;
            return $candidatequestion[$curentsubject][$curent - 1];
        } else {
            return $candidatequestion[$curentsubject][$curent];
        }
    }
}

function getquestionsorder($testid, $candidateid) {
    global $dbh;
    $query = "SELECT DISTINCT (`questionid`), subjectid FROM `tblpresentation` 
		inner join tbltestsection on tbltestsection.testsectionid=tblpresentation.sectionid
		inner join tbltestsubject on tbltestsection.testsubjectid=tbltestsubject.testsubjectid
		WHERE 	tblpresentation.testid='$testid' and tblpresentation.candidateid='$candidateid'
		ORDER BY presentationid	";
   $stmt = $dbh->prepare($query);
   $stmt->execute();
   $row = $stmt->fetch(PDO::FETCH_ASSOC);
   $numrows = $stmt->rowCount();
    if ($numrows > 0) {
        $questionorder = array();
        $counter = 0;
        $previoussubjectid = -1;
        for ($n = 0; $n < $numrows; $n++) {
            $questionid = $row['questionid'][$n];
            $subjectid = $row['subjectid'][$n];
            if ($previoussubjectid != $subjectid) {
                //reset the counter. subject hs changed
                $counter = 0;
                $previoussubjectid = $subjectid;
                $_SESSION['curentquestion'][$subjectid] = 0; //initialize the index of the first question to be used in next and previous
            }
            //echo"++ $subjectid,$counter,$questionid ++";
            //echo $_SESSION['curentquestion'][$subjectid];
            $questionorder[$subjectid][$counter] = $questionid;
            $counter++;
        }
        $_SESSION['candidatequestion'] = $questionorder;
        
    }
}

function displaysinglequestion($candidateid, $testid, $subjectid, $curentquestion) {
global $dbh;
    global $limit;
    $studentquestion = "SELECT candidateid,tblpresentation.testid,tblpresentation.sectionid,questionid,tblquestionbank.title, 
		tbltestsection.title,tbltestsection.instruction from tblpresentation 
		INNER JOIN tbltestsection on tblpresentation.sectionid=tbltestsection.testsectionid
		INNER JOIN tblquestionbank on tblpresentation.questionid=tblquestionbank.questionbankid
		INNER JOIN tbltestsubject on tbltestsection.testsubjectid=tbltestsubject.testsubjectid
		WHERE(candidateid='$candidateid' and tblpresentation.testid='$testid' 
		 and questionid='$curentquestion' and tbltestsubject.subjectid='$subjectid')";

        $stmt = $dbh->prepare($studentquestion);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $numrows = $stmt->rowCount();
    if ($numrows > 0) {
        $sectiontitle = $row['tbltestsection.title'][0];
        $sectioninstruction = $row['instruction'][0];
        //create new section
        opensectiondiv($sectiontitle, $sectioninstruction);

        $questionid = $row['questionid'][0];
        $questiontitle = $row['title'][0];
        $questiontitle = str_replace("&#160;", "", $questiontitle);
        $questiontitle = str_replace("&#160;", "", $questiontitle);
        $questiontitle = stripslashes($questiontitle);
        $questiontitle = str_replace("&#160;", "", $questiontitle);
        $questiontitle = str_replace("&#160;", "", $questiontitle);
        ?>
        <div class="questionanswerdiv" id="<?php
        if (isset($divid)) {
            echo $divid;
        }
        ?>">
            <div class="qadiv"style="background-color:#ffffff"><div class="questiondiv" >
                    <?php echo " <b>Question " . ($limit + 1) . ": </b>"; ?><b/><?php echo str_replace("&#160;","",html_entity_decode($questiontitle, ENT_QUOTES)); ?>
                </div>
                <div class="answerdiv">
                    <?php
                    showquestion($questionid, $testid, $candidateid, $questiontype = "OBJ");
                    echo"</div>";
                    echo"	</div></div>";
                    //include next and previous here
                    $firsttype = "";
                    $lasttype = "";

                    echo"<div style='width:300px; margin-left:auto; margin-right:auto;'>";
                    if ($_SESSION['firstquestion'] != 1) {
                        // $firsttype=  "disabled";
                        echo" <button id='previous' class=\"cbtn tbnnavigation\" $firsttype>Previous</button>";
                    }

                    if ($_SESSION['lastquestion'] != 1) {
                        //  $lasttype="disabled";
                        echo" <button id='next' class=\"cbtn tbnnavigation \" $lasttype>Next</button></div>";
                    }

                    echo"	</div>	"; //closing questionanswerdiv 
                    
                }
            }

            function displayallquestion($candidateid, $testid, $subjectid) {
                    global $dbh;
                //create the questions

                $studentquestion = "SELECT distinct(questionid),tblpresentation.candidateid,tblpresentation.testid,tblpresentation.sectionid,
		tblquestionbank.title, tbltestsection.title,tbltestsection.instruction from tblpresentation 
		INNER JOIN tbltestsection on tblpresentation.sectionid=tbltestsection.testsectionid
		INNER JOIN tblquestionbank on tblpresentation.questionid=tblquestionbank.questionbankid
		INNER JOIN tbltestsubject on tbltestsection.testsubjectid=tbltestsubject.testsubjectid		
		WHERE(tblpresentation.candidateid='$candidateid' and tblpresentation.testid='$testid'
		and tbltestsubject.subjectid='$subjectid')";
                //echo $studentquestion;
                $stmt = $dbh->prepare($studentquestion);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                $numrows = $stmt->rowCount();
                if ($numrows > 0) {
                    $sectiontitle = $row['tbltestsection.title'][0];
                    $sectioninstruction = $row['instruction'][0];
                    //create new section
                    $curentsectionid = $row['sectionid'][0];
                    opensectiondiv($sectiontitle, $sectioninstruction);
                    $counter = 0;
                    for ($i = 0; $i < $numrows; $i++) {
                        $sectionid = $row['sectionid'][$i];
                        if (($sectionid != $curentsectionid) && $i > 0) {
                            $curentsectionid = $sectionid;
                            //close the previous section and create new section
                            $sectiontitle = $row['tbltestsection.title'][$i];
                            $sectioninstruction = $row['instruction'][$i];
                            echo"</div><hr style='border-width:2px; border-style:dotted;' />"; //close the section div;
                            opensectiondiv($sectiontitle, $sectioninstruction);
                        }
                        $questionid = $row['questionid'][$i];
                        $questiontitle = $row['title'][$i];
                        $questiontitle = str_replace("&#160;", "", $questiontitle);
                        $questiontitle = str_replace("&#160;", "", $questiontitle);
                        $questiontitle = stripslashes($questiontitle);
                        $questiontitle = str_replace("&#160;", "", $questiontitle);
                        $questiontitle = str_replace("&#160;", "", $questiontitle);
                        $counter = $i + 1;
                        $divid = "questiondiv" . $questionid;
                        ?>
                        <div class="questionanswerdiv" id="<?php echo $divid ?>">
                            <div class="qadiv"style="background-color:#ffffff"><div class="questiondiv" >
                                    <?php echo " <b>Question $counter: </b>"; ?><b/><?php echo str_replace("&#160;","",html_entity_decode($questiontitle, ENT_QUOTES)); ?>
                                </div>
                                <div class="answerdiv">
                                    <?php
                                    showquestion($questionid, $testid, $candidateid, $questiontype = "OBJ");
                                    echo"</div>";
                                    echo"	</div></div>";
                                }//endfor
                                //closing questionanswerdiv and answerdiv
                            }
                        }

                        function showquestion($questionid, $testid, $candidateid, $questiontype = "OBJ") {
                            global $dbh;
                            $tblscoreanswerid = 0;
                            if ($questiontype == "OBJ") {
                                //objectve question
                                $queryquest = "SELECT tblpresentation.questionid,tblpresentation.answerid,
                                                correctness,test FROM tblpresentation
                                                INNER JOIN tblansweroptions ON tblpresentation.answerid=tblansweroptions.answerid
                                                where(tblpresentation.questionid='$questionid' and 
                                                tblpresentation.testid='$testid' and tblpresentation.candidateid='$candidateid'
                                                )";
                                $stmt = $dbh->prepare($queryquest);
                                $stmt->execute();
                                $resultquest=$stmt->fetch(PDO::FETCH_ASSOC);
                                $numrows = $stmt->rowCount();
                                
                                if ($numrows > 0) {
                                    //get the answer in score if any
                                    $queryscore = "SELECT tblscore.answerid FROM tblscore where(questionid='$questionid' and 
			testid='$testid' and candidateid='$candidateid' )";
                                    $stmt1 = $dbh->prepare($queryscore);
                                    $stmt1->execute();
                                    $row = $stmt1->fetch(PDO::FETCH_ASSOC);
                                    $numrows1 = $stmt1->rowCount();
                                    if ($numrows1 > 0) {
                                        $tblscoreanswerid = $row['tblscore.answerid'][0];
                                        if ($tblscoreanswerid == "")
                                            $tblscoreanswerid = 0;
                                    }



                                    $optioncounter = 0;
                                    echo"<ol class='ansopt'>";
                                    for ($k = 0; $k < $numrows; $k++) {
                                        $answerid = $resultquest[$k]['tblpresentation.answerid'];
                                        $answertext = $resultquest[$k]['test'];
                                        $answertext = str_replace("&#160;", "", $answertext);
                                        $answertext = str_replace("&#160;", "", $answertext);
                                        $answertext = stripslashes($answertext);
                                        $answertext = str_replace("&#160;", "", $answertext);
                                        $answertext = str_replace("&#160;", "", $answertext);
                                        //$tblscoreanswerid=mysql_result($resultquest,$k,'tblscore.answerid');
                                        //$answerid=mysql_result($resultquest,$k,'answerid');
                                        //$answerid=mysql_result($resultquest,$k,'answerid');
                                        //$optioncounter=integerToRoman($k+1);
                                        if ($answerid == $tblscoreanswerid) {
                                            echo"<li class='ao selected-opt'>
					<label class='optionlabel'><input type='radio' class=\"answeroption\" name='$questionid' id='$answerid' value='$answerid' checked> <div style='display:inline-block; cursor:pointer;'> " . str_replace("&#160;","",html_entity_decode($answertext, ENT_QUOTES)) . "</div></label> </li>";
                                        } else {
                                            echo"<li class='ao'>  <label class='optionlabel'><input type='radio' class=\"answeroption\"  name='$questionid' id='$answerid' value='$answerid'><div style='display:inline-block; cursor:pointer;'>" . str_replace("&#160;","",html_entity_decode($answertext, ENT_QUOTES)) . "</div></label> </li>";
                                        }
                                    }//endfor
                                    echo"</ol>";
                                    $code = $questionid . "code";
                                    echo"<input type='hidden' name='$code' id='$code' value='$tblscoreanswerid'>";
                                }
                            } else {
                                //specify another questiontype
                            }
                        }

                        function opensectiondiv($sectionname, $instruction) {
                            ?>
                            <div class="sectiondiv"  >
                                <div id="sectioninfodiv" style="font-weight:normal;">
                                    <?php
                                    if ($sectionname != "") {
                                        echo"	<div style='text-align:center; font-size:1.2em; text-decoration:underline;'><b>SECTION: </b>" . strtoupper($sectionname) . " </div>";
                                    }
                                    if (trim($instruction) != "") {
                                        echo"<div style='text-align:center; font-size:1.2em;'><b>INSTRUCTION: </b>$instruction </div>";
                                    }
                                    echo"</div>";
                                }

               function gettestinfo($testid) {
    global $dbh;
                                    $testinfo = array();
                                    if (isset($testid)) {

                                        $querytestname = "SELECT testname, allow_calc, testtypename, session, duration, dailystarttime, displaymode, startingmode,testcategory,
                                                            questionadministration,optionadministration, curtime() as now
                                                            FROM tbltestconfig inner join tbltestcode
                                                            on tbltestconfig.testcodeid=tbltestcode.testcodeid
                                                            left join tbltesttype on tbltestconfig.testtypeid=tbltesttype.testtypeid
                                                            where(tbltestconfig.testid='$testid')";
                                                            $stmt = $dbh->prepare($querytestname);
                                                            $stmt->execute();
                                                            $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                                            $numrows = $stmt->rowCount();

                                        if ($numrows > 0) {
                                            $testname = $row['testname'][0];
                                            $now = $row['now'][0];
                                            $testtypename = $row['testtypename'][0];
                                            $session = $row['session'][0];
                                            $duration = $row['duration'][0];
                                            $dailystarttime = $row['dailystarttime'][0];
                                            $startingmode = $row['startingmode'][0];
                                            $testcategory = $row['testcategory'][0];
                                            $displaymode = $row['displaymode'][0];
                                            $allowcalc = $row['allow_calc'][0];
                                            $questionadministration = $row['questionadministration'][0];
                                            $optionadministration = $row['optionadministration'][0];
                                            $name = strtoupper($testname);
                                            $session1 = $session + 1;
                                            $name = $name . " " . strtoupper($testtypename) . " " . "($session/$session1)";
                                            $testinfo['name'] = $name;
                                            $testinfo['questionadministration'] = $questionadministration;
                                            $testinfo['optionadministration'] = $optionadministration;
                                            $testinfo['testcategory'] = $testcategory;
                                            $testinfo['displaymode'] = $displaymode;
                                            $testinfo['startingmode'] = $startingmode;
                                            $testinfo['duration'] = $duration;
                                            $testinfo['starttime'] = $dailystarttime; // student start time take into consideration if the student comes late
                                            $testinfo['dailystarttime'] = $dailystarttime;
                                            $testinfo['allow_calc'] = $allowcalc;
                                            //check any elapsed time that the student has used before login in again  and subtract it to the remaining time.
                                            $candidateid = $_SESSION['candidateid'];
                                            //get duration in second
                                            $duration = $duration * 60;
                                            $elapsed = 0;
                                            $queryelapsed = "SELECT elapsed from tbltimecontrol where (testid='$testid' and candidateid='$candidateid')";
                                            $stmt = $dbh->prepare($queryelapsed);
                                                            $stmt->execute();
                                                            $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                                            $numrows = $stmt->rowCount();
                                            if ($numrows > 0) {
                                                $elapsed = $row['elapsed'][0];
                                                $duration = $duration - $elapsed;
                                            }

                                            $testinfo['remainingsecond'] = $duration;

                                            if ($startingmode == 'on login') {
                                                //start time on login
                                                $date = new DateTime($now);
                                                $testinfo['starttime'] = $date->format('H:i:s');
                                                $date->modify("+ $duration seconds");
                                            } else {
                                                //start time as specified. get the ellapsed time and add to it 
                                                $date = new DateTime($dailystarttime);
                                                if ($elapsed != 0) {
                                                    //student started exams before being log out. compute his ending time from now to the remaining seconds
                                                    $date = new DateTime($now);
                                                } else {
                                                    //first login check if he is late and reduce his remaining time
                                                    $date2 = new DateTime($now);
                                                    $to_time = strtotime($date2);
                                                    $from_time = strtotime($date);
                                                    $passsecond = abs($to_time - $from_time);
                                                    $testinfo['remainingsecond'] = $duration - $passsecond;
                                                }
                                                $date1 = $date->format('H:i:s');
                                                $date->modify("+ $duration seconds");
                                            }
                                            $testinfo['endtime'] = $date->format('H:i:s');
                                            //place the variable in session and return it to the caller
                                            $_SESSION['testinfo'] = $testinfo;
                                            return $testinfo;
                                        }
                                    }
                                }
                                function getsubject($candidateid, $testid) {
    global $dbh;

                                    $studsubject = array();
                                    //this function get all the subject applicable to the student and place them as hyperlink
                                    $subject = "SELECT tblsubject.subjectid,tblsubject.subjectcode,tblsubject.subjectname, instruction from tblsubject 
	inner join tblcandidatestudent on tblcandidatestudent.subjectid=tblsubject.subjectid
	inner join tblscheduling on tblcandidatestudent.scheduleid=tblscheduling.schedulingid
	Inner Join tbltestsubject ON tblsubject.subjectid=tbltestsubject.subjectid
	where(tblcandidatestudent.candidateid='$candidateid' and tblscheduling.testid='$testid'
	and tbltestsubject.testid='$testid')";
                                    $stmt = $dbh->prepare($subject);
                                    $stmt->execute();
                                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                    $sbjcount = $stmt->rowCount();
                                    if ($sbjcount == 0) {
                                        echo"<div >No Subject Available</div>";
                                    } else {
                                        for ($i = 0; $i < $sbjcount; $i++) {
                                            $subjectid = $row[$i]['subjectid'];
                                            $subjectcode = $row[$i]['subjectcode'];
                                            $subjectname = $row[$i]['subjectname'];
                                            $instruction = $row[$i]['instruction'];

                                            $studsubject['subjectid'][$i] = $subjectid;
                                            $studsubject['subjectcode'][$i] = $subjectcode;
                                            $studsubject['subjectname'][$i] = $subjectname;
                                            $studsubject['instruction'][$i] = $instruction;

                                            //echo"|<a href=\"#\" id='$subjectid'>$subjectname</a>";
                                            echo" <div id='$subjectid' class=\"cbtn subjbtn" . (($sbjcount == 1) ? (" active-sbj") : ("")) . "\">$subjectcode</div>";
                                        }
                                        $_SESSION['studsubject'] = $studsubject;
                                       
                                    }
                                }

                                function getbiodata($candidateid) {
                                    global $dbh;

                                    $query = "SELECT candidatetype, matric from tblcandidatestudent where candidateid='$candidateid'";
                                    $stmt = $dbh->prepare($query);
                                    $stmt->execute();
                                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                    $sbjcount = $stmt->rowCount();
                                    if ($sbjcount > 0) {
                                        $regno = $row[0]['regno'];
                                        $candidatetype = $row[0]['candidatetype'];
                                        //get the candidate name from the appropriate table
                                        if ($candidatetype == 3) {
                                            //regular student
                                            $queryname = "SELECT matricnumber, 
                                surname, concat(IFNULL(firstname,' ') ,' ' , IFNULL(othernames,' ')) AS othername from tblstudents
                                where matricnumber='$regno' ";
                                                                } elseif ($candidatetype == 1) {
                                                                    //jamb student
                                                                    $queryname = "SELECT RegNo as matricnumber, '' AS
                                surname,  CandName AS othername from tbljamb    where RegNo='$regno' ";
                                                                } elseif ($candidatetype == 2) {
                                                                    //sbrs student
                                                                    $queryname = "SELECT 	surname, concat(IFNULL(firstname,' ') , IFNULL(othernames,' ')) AS othername
                                            from tblsbrsstudents  where sbrsno='$regno' ";
                                                                } else {
                                                                    //sbrs applicant
                                                                    $queryname = "SELECT 	surname, concat(IFNULL(firstname,' ') , IFNULL(lastname,' ')) AS othername 
                                            from tblsbrsshortlist where ApplicationID='$regno' ";
                                                                }
                                                                $stmt = $dbh->prepare($queryname);
                                                                $stmt->execute();
                                                                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                                                $sbjcount = $stmt->rowCount();
                                        if ($sbjcount > 0) {
                                            $surname = strtoupper($row['surname'][0]);
                                            $othername = ucfirst(strtolower($row['othername'][0]));
                                            $biodata['candidatename'] = $surname . ", " . $othername;
                                        }

                                        $biodata['matric'] = $regno;

                                        $_SESSION['biodata'] = $biodata;
                                    }
                                    return $biodata;
                                }

                                function authenticatecandidate($candidateid, $testid) {
                                    global $failedmessage;
//return true;
                                    if (examsperiod($testid, $candidateid) == false) {
                                        $failedmessage = "You are not allowed to write this test at this time.";
                                        return false;
                                    }

                                    //this function will check for valid testcomputer alreadylogin, doulelogin in one computer, 
                                    $testcomputer = testcomputer($mac = getmacaddress(), $candidateid);
                                    if ($testcomputer == 1) {
                                        if (computerdoublelogin($testid) == false) {
                                            if (alreadylogin($candidateid, $testid) == false) {
                                                return true;
                                            } else {
                                                $failedmessage = "you have already login in another computer.";
                                                if (checkcompletion($testid, $candidateid) == true) {
                                                    $failedmessage = "you have already taken the exams.";
                                                } else {
                                                    $failedmessage = "you are already logged into another computer.";
                                                }

                                                return false;
                                            }
                                        } else {
                                            $failedmessage = "This computer is already in use by another candidate.";
                                            return false;
                                        }
                                    } elseif ($testcomputer == 2) {//incorect testcomputer
                                        $failedmessage = "You are not scheduled in this venue.";
                                        return false;
                                    } elseif ($testcomputer == 3) {
                                        $failedmessage = "You are not scheduled in this venue today.";
                                    } else {
                                        $failedmessage = "This computer is not allowed to take the test.";
                                    }
                                }

                                function testcomputer($mac, $candidateid) {
                                    global $dbh;
// this function return 1 if the computer is registered under the venue the student is trying to take the test
//2 if accepted computer but candidate not in right venue
// 0 unknown computer 
                                    return 1;
                                    $result = "SELECT * from tblvenuecomputers where(computermac='$mac')";
                                    $stmt = $dbh->prepare($result);
                                                                $stmt->execute();
                                                                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                                                $sbjcount = $stmt->rowCount();
                                    if ($sbjcount > 0) {
                                        //allowed computer
                                        $venueid = $row['venueid'][0];
                                        //check if in right venue
                                        $result2 = "SELECT candidateid, curdate() as today, tblscheduling.date as examsdate from tblscheduling inner join tblcandidatestudent
on tblscheduling.schedulingid=tblcandidatestudent.scheduleid
 where(candidateid='$candidateid' and tblscheduling.venueid='$venueid')";
                                        $stmt = $dbh->prepare($result2);
                                        $stmt->execute();
                                        $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                        $numrows = $stmt->rowCount();
                                        if ($numrows > 0) {
                                            //candidate in right venue

                                            $today = $row['today'][0];
                                            $examsdate = $row['examsdate'][0];
                                            //echo $today, $examsdate; die();

                                            if ($today == $examsdate) {

                                                return 1;
                                            } else {
                                                return 3; //candidate not scheduled for today
                                            }
                                        } else {
                                            //the candidate is not scheduled in this venue
                                            return 2;
                                        }
                                    } else {
                                        return 0; // computer not allowed
                                    }
                                }

                                function computerdoublelogin($testid) {
                                    return false;
//if the same ip is active and attempts to login with another user name stop it until logout
                                    $newip = getIpAddress();
                                    $result = "SELECT * from tbltimecontrol where(ip='$newip' and testid='$testid' and completed=0)";

                                    $stmt = $dbh->prepare($result);
                                    $stmt->execute();
                                    $numrows = $stmt->rowCount();
                                    if ($numrows > 0) {
                                        //computer in use by another user
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }

                                function alreadylogin($candidateid, $testid) {
                                    global $dbh;
//
                                    $result = "SELECT * from tbltimecontrol where(candidateid='$candidateid' and testid='$testid')";
                                    $stmt = $dbh->prepare($result);
                                    $stmt->execute();
                                    $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                    $numrows = $stmt->rowCount();
                                    if ($numrows > 0) {
                                        //allowed computer
                                        $ip = $row['ip'][0];
                                        if ($ip == "") {
                                            return 0;
                                        } else {
                                            // check if the ip is same with that of the user
                                            if ($ip == getIpAddress()) {
                                                return 0;
                                            } else {
                                                return 1;
                                            }
                                        }
                                    } else {
// this is the first login
                                        return 0;
                                    }
                                }

                                function examsperiod($testid, $candidateid) {
                                    global $dbh;
                                    $result2 ="SELECT candidateid, curdate() as today, curtime() as now, 
                                                tblscheduling.date as examsdate, tblscheduling.dailystarttime,tblscheduling.dailyendtime
                                        from tbltestconfig inner join  tblscheduling on tbltestconfig.testid=tblscheduling.testid 
                                            inner join tblcandidatestudent  on tblscheduling.schedulingid=tblcandidatestudent.scheduleid
                                    where(candidateid='$candidateid' and tblscheduling.testid='$testid')";
                                       $stmt = $dbh->prepare($result2);
                                       $stmt->execute();
                                       $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                       $numrows = $stmt->rowCount();


                                    if ($numrows > 0) {

                                        $today = $row['today'][0];
                                        $examsdate = $row['examsdate'][0];
                                        $dailystarttime = $row['dailystarttime'][0];
                                        $dailyendtime = $row['dailyendtime'][0];
                                        $now = $row['now'][0];

                                        //echo $today, $examsdate; die();

                                        if ($today == $examsdate) {
                                            if ($dailystarttime <= $now && $dailyendtime > $now) {
                                                return true;
                                            }
                                        }
                                    }
                                    return false;
                                }

                                function checksecuritycode($candidateid, $securitycode) {
                                    global $dbh;

                                    $result = "SELECT * from tbltimecontrol where(candidateid='$candidateid' and testid='$testid')";
                                    $stmt = $dbh->prepare($result);
                                       $stmt->execute();
                                       $row = $stmt->fetch(PDO::FETCH_ASSOC);
                                       $numrows = $stmt->rowCount();
                                    if ($numrows > 0) {
                                        //allowed computer
                                        $ip = $row['ip'][0];
                                    }
                                }

                                function getIpAddress() {
                                    header('Cache-Control: no-cache, must-revalidate');
                                    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
                                        $ip = $_SERVER['HTTP_CLIENT_IP'];
                                    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                                        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
                                    } else {
                                        $ip = $_SERVER['REMOTE_ADDR'];
                                    }
                                    return $ip;
                                }

                                function getmacaddress() {
                                    $sample_arr = array();
                                    $pingcommand = getIpAddress();
                                    $sample_str = shell_exec('arp -a ' . $pingcommand);
                                    $sample_arr = explode("\n", $sample_str);
                                    $sample_arr_ = explode(" ", $sample_arr[3]);
                                    $final_arr = array();
                                    foreach ($sample_arr_ as $val) {
                                        if ($val != "") {
                                            $final_arr[] = $val;
                                        }
                                    }
                                    $mac = $final_arr[1];
                                    return $mac;
                                }

                                function resetsession() {
                                    //this function logout a computer if hide for some time.
                                    $duration = $min * 60;
                                    if (isset($_SESSION['LASTOPERATION']) && (time() - $_SESSION['LASTOPERATION'] > $duration)) {
                                        // session_destroy();
                                        session_unset();
                                        //unset( $_SESSION['user_id']);
                                    }
                                    $_SESSION['LASTOPERATION'] = time();
                                }
                                ?>
