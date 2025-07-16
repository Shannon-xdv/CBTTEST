<?php
if (!isset($_SESSION))
    session_start();

require_once("../../lib/globals.php");
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>
        <?php echo pageTitle("User Authentication") ?>
        </title>
<?php require_once("../../partials/cssimports.php") ?>
    </head>

    <body>
<?php include_once("../../partials/navbar.php"); ?>

        <div id="container" class="container">

            <h2 class="page-header">Create Role</h2>

<?php require_once('../../partials/notification.php'); ?> 
            <div class="span4 offset4">
                <div class="well">
                    <?php
                    //Display validation error
                    if (isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) > 0) {
                        foreach ($_SESSION['ERRMSG_ARR'] as $msg) {
                            echo '<span style = "color: red; font-size: 11px;">*&nbsp;&nbsp;', $msg, '</span><br />';
                        }
                        unset($_SESSION['ERRMSG_ARR']);
                    }
                    ?>
                    <fieldset>
                        <legend>Role</legend>
                        <br />                        
                        <form action="create_exec.php" method="post">
                            <div class="control-group">
                                <label for="rolename">Role Name</label>
                                <div class="controls">
                                    <input class="input-block-level" type="text" name="rolename" placeholder="Role Name" required/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="roledesc">Role Description</label>
                                <div class="controls">
                                    <textarea name ="roledesc" id ="roledesc" class="input-block-level" placeholder="Role Description" required></textarea>
                                </div>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-info btn-block">Save Record</button>
                            </div>
                        </form>
                    </fieldset>
                    <a href ="index.php">Back to Index</a>
                </div> <!-- /.well -->

            </div>
        </div>
        <?php include_once dirname(__FILE__) . "/../../partials/footer.php" ?>;
<?php include_once dirname(__FILE__) . "/../../partials/jsimports.php" ?>;
    </body>
</html>
