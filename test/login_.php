<?php
if (!isset($_SESSION))
    session_start();
//@mysql_close();
require_once(dirname(__FILE__) . "/../lib/globals.php");
require_once(dirname(__FILE__) . "/../lib/security.php");
//authorize();
if (has_roles(array("Super Admin")) || has_roles(array("Admin")) || has_roles(array("Test Administrator")) || has_roles(array("Test Compositor")) || has_roles(array("Test Invigilator")) || has_roles(array("PC Registrar"))) {
    header("Location:" . siteUrl("admin.php"));
    exit();
}

openConnection();

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>
        <?php echo pageTitle("User Authentication") ?>
    </title>
    <link href="<?php echo siteUrl('assets/css/jquery-ui.css') ?>" type="text/css" rel="stylesheet"></link>
    <link href="<?php echo siteUrl('assets/css/globalstyle.css') ?>" type="text/css" rel="stylesheet"></link>
    <link href="<?php echo siteUrl('assets/css/tconfigstyle.css') ?>" type="text/css" rel="stylesheet"></link>
    <style type="text/css">
        .control-group {
            margin-top: 10px;
        }
    </style>
</head>

<body>
<div style="text-align:center;"><img src="<?php echo siteUrl("assets/img/dariya_logo1.png"); ?>"/></div>
<div class="span5 style-div"
     style="margin-left: auto; width:350px; margin-top: 70px; padding-left: 30px; margin-right: auto;">
    <div class="contentbox" style="padding-top: 10px;">
        <div class="page-header"
             style="border-bottom-color: #cccccc; border-bottom-style: solid; border-bottom-width: 1px;">
            <h2 style="font-family: 'Segoe UI',Helvetica,Arial,sans-serif; color:rgb(51, 51, 51); text-rendering: optimizelegibility; font-size: 18px; font-weight: 700; line-height:40px; ">
                Please Login
                <small>to Start the Examination</small>
            </h2>
        </div>
        <?php require_once('../partials/notification.php'); ?>

        <?php
        //Display validation error
        if (isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) > 0) {
            foreach ($_SESSION['ERRMSG_ARR'] as $msg) {
                echo '<span style = "color: red; font-size: 11px;">*&nbsp;&nbsp;', $msg, '</span><br />';
            }
            unset($_SESSION['ERRMSG_ARR']);
        }
        ?>
        <?php if (isset($_SESSION['LOGIN_FAILED'])): ?>
            <div class="alert alert-error">
                <?php
                echo $_SESSION['LOGIN_FAILED'];
                unset($_SESSION['LOGIN_FAILED']);
                ?>
            </div>
        <?php endif ?>

        <?php
        // require_once("login.php");
        ?>

        <form action="login_exec_.php" method="post" class="style-frm" autocomplete='off'>
            <div class="control-group">
                <label for="username" id="usnlbl" style="font-weight: bold;">UserName</label>
                <div class="controls">
                    <input class="input-block-level" type="text" id="username" name="username" placeholder="Username" required autocomplete='off'/>
                </div>
            </div><!-- /.control-group -->
            <div class="control-group">
                <label for="password" id="pwdlbl" style="font-weight: bold;">Password</label>
                <div class="controls">
                    <input class="input-block-level" type="password" name="password" id="password"
                           placeholder="Password" required autocomplete='off'/>
                    <select style="display:none;" disabled name="password" id="password2">
                        <option value="">Select Your State</option>
                        <?php
                        $sqlstate = "select statename from tblstate";
                        $stmt = $dbh->prepare($sqlstate);
                        $result = $stmt->execute();
                        $numrows = $stmt->rowCount();
                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<option value='" . trim($row['statename']) . "'>" . trim($row['statename']) . "</option>";
                        }
                        ?>
                    </select>
                </div>

            </div><!-- /.control-group -->

            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn btn-info btn-block" style="font-weight: bold;">Sign in</button>
                </div>
            </div> <!-- /.control-group -->


        </form>


    </div>
</div>
<script type="text/javascript" src="<?php echo siteUrl("assets/js/jquery-1.9.0.js"); ?>"></script>
<script type="text/javascript" src="<?php echo siteUrl("assets/js/jquery-ui-1.10.0.custom.min.js"); ?>"></script>
<script type="text/javascript" src="<?php echo siteUrl("assets/js/cbt_js.js"); ?>"></script>

<script type="text/javascript">
    setTimeout(function () {
        location.reload();
    }, 360 * 1000);

    $(document).ready(function () {
        $('#username').focus();
    });

    $(document).on('change click', '#testid', function () { //alert($('#testid option:selected').text());
        var tname = $('#testid option:selected').text();
        var match = tname.match(/Post-UTME/i);

        if (match) {
            $('#usnlbl').text('Jamb No.');
            $('#pwdlbl').text('State');
            $('#username').attr('placeholder', 'Jamb No.');
            $('#password').attr('placeholder', 'State');
            $('#password').hide();
            $('#password').prop('disabled', true);
            $('#password2').show();
            $('#password2').prop('disabled', false);
        } else {
            $('#usnlbl').text('UserName');
            $('#pwdlbl').text('Password');
            $('#username').attr('placeholder', 'UserName');
            $('#password').attr('placeholder', 'Password');
            $('#password2').hide();
            $('#password2').prop('disabled', true);
            $('#password').show();
            $('#password').prop('disabled', false);

        }

    });
    $('#testid option:selected').trigger('click');

</script>
</body>
</html>
