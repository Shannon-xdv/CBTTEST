<?php
if (!isset($_SESSION))
    session_start();
require_once("../lib/globals.php");
require_once("../lib/security.php");
require_once("../lib/cbt_func.php");
//require_once("../lib/test_config_func.php");
openConnection();
global $dbh;
authorize();
if (!has_roles(array("Super Admin")) && !has_roles(array("Test Administrator")) && !has_roles(array("Test Compositor")))
    header("Location:" . siteUrl("403.php"));

//page title
$pgtitle = "::Test Reports";
$navindex = 5;
?>
<!doctype html>
<html lang="en" dir="ltr" class="scroll-smooth focus:scroll-auto">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Test Reports<?php echo $pgtitle; ?></title>
   <link rel="icon" type="image/png" sizes="32x32" href="<?php echo siteUrl('assets/hexadash/images/favicon.ico'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/apexcharts.min.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/datepicker.min.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/line-awesome.min.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/nouislider.min.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/quill.snow.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/vendor_assets/css/svgMap.min.css'); ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/hexadash/tailwind.css'); ?>">
   <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600;700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
   <link href="<?php echo siteUrl('assets/css/tconfigstyle.css') ?>" type="text/css" rel="stylesheet">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/css/jquery-ui.css') ?>">
   <link rel="stylesheet" href="<?php echo siteUrl('assets/css/select2.min.css') ?>">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="<?php echo siteUrl('assets/js/jquery-3.6.0.min.js'); ?>"></script>
   <script src="<?php echo siteUrl('assets/js/jquery-ui.min.js'); ?>"></script>
</head>
<body class="bg-white dark:bg-main-dark font-jost relative text-[15px] font-normal leading-[1.5] m-0 p-0">
   <!-- Aside (Sidebar) -->
   <aside id="asideBar" class="asidebar dark:bg-box-dark fixed start-0 top-0 z-[1035] h-screen overflow-hidden bg-white xl:[&.collapsed]:!w-[80px] [&.collapsed]:!w-[250px] !transition-all !duration-[0.2s] ease-linear delay-[0s] !w-0 xl:[&.collapsed>.logo-wrapper]:w-[80px]">
      <div class="flex w-[280px] border-e border-[#edf2f9] dark:border-box-dark-up logo-wrapper items-center h-[71px] dark:bg-box-dark-up max-xl:hidden">
         <a href="<?php echo siteUrl('admin.php'); ?>" class="block text-center">
            <div class="logo-full">
               <img class="ps-[27px] dark:hidden" src="<?php echo siteUrl('assets/hexadash/images/logos/logo-dark.png'); ?>" alt="Logo">
               <img class="ps-[27px] hidden dark:block" src="<?php echo siteUrl('assets/hexadash/images/logos/logo-white.png'); ?>" alt="Logo">
            </div>
            <div class="hidden logo-fold">
               <img class="p-[27px] max-w-[80px]" src="<?php echo siteUrl('assets/hexadash/images/logos/logo-fold.png'); ?>" alt="Logo">
            </div>
         </a>
      </div>
      <nav id="navBar" class="navBar dark:bg-box-dark start-0 max-xl:top-[80px] z-[1035] h-full overflow-y-auto bg-white xl:!w-[280px] xl:[&.collapsed]:!w-[80px] [&.collapsed]:!w-[250px] xl:[&.TopCollapsed]:!w-[0px] [&.TopCollapsed]:!w-[250px] !transition-all !duration-[0.2s] ease-linear delay-[0s] !w-0 pb-[100px] scrollbar xl:[&.collapsed]:ps-[7px] relative">
         <ul class="relative m-0 list-none px-[0.2rem] ">
            <li class="relative sub-item-wrapper group ">
               <a class="group-[.open]:bg-primary/10 rounded-e-[20px] hover:bg-primary/10 focus:bg-primary/10 active:bg-primary/10 dark:text-subtitle-dark flex h-12 cursor-pointer items-center gap-[16px] truncate px-6 py-4 text-[14px] font-medium text-body outline-none transition duration-300 ease-linear hover:text-primary dark:hover:text-title-dark hover:outline-none focus:text-primary dark:focus:text-title-dark focus:outline-none active:text-primary dark:active:text-title-dark active:outline-none [&.active]:text-primary dark:[&.active]:text-title-dark motion-reduce:transition-none dark:hover:bg-box-dark-up dark:focus:bg-box-dark-up dark:active:bg-box-dark-up group capitalize " href="<?php echo siteUrl('admin.php'); ?>">
                  <span class="nav-icon dark:text-subtitle-dark text-[18px] text-light-extra group-hover:text-current group-[&.active]:text-current group-focus:text-current">
                     <i class="uil uil-apps"></i>
                  </span>
                  <span class="capitalize title">Dashboard</span>
               </a>
            </li>
            <li class="relative">
               <a href="<?php echo siteUrl('configuration/home.php'); ?>" class="rounded-e-[20px] hover:bg-primary/10 focus:bg-primary/10 active:bg-primary/10 dark:text-subtitle-dark flex h-12 cursor-pointer items-center gap-[16px] truncate px-6 py-4 text-[14px] font-medium text-body outline-none transition duration-300 ease-linear hover:text-primary dark:hover:text-title-dark hover:outline-none focus:text-primary dark:focus:text-title-dark focus:outline-none active:text-primary active:outline-none [&.active]:text-primary dark:[&.active]:text-title-dark  motion-reduce:transition-none dark:hover:bg-box-dark-up dark:focus:bg-box-dark-up dark:active:bg-box-dark-up group capitalize ">
                  <span class="nav-icon dark:text-subtitle-dark text-[18px] text-light-extra group-hover:text-current group-[&.active]:text-current group-focus:text-current">
                     <i class="uil uil-cog"></i>
                  </span>
                  <span class="capitalize title">Test Configuration</span>
               </a>
            </li>
            <li class="relative">
               <a href="<?php echo siteUrl('admin_toolbox/index.php'); ?>" class="rounded-e-[20px] hover:bg-primary/10 focus:bg-primary/10 active:bg-primary/10 dark:text-subtitle-dark flex h-12 cursor-pointer items-center gap-[16px] truncate px-6 py-4 text-[14px] font-medium text-body outline-none transition duration-300 ease-linear hover:text-primary dark:hover:text-title-dark hover:outline-none focus:text-primary dark:focus:text-title-dark focus:outline-none active:text-primary active:outline-none [&.active]:text-primary dark:[&.active]:text-title-dark  motion-reduce:transition-none dark:hover:bg-box-dark-up dark:focus:bg-box-dark-up dark:active:bg-box-dark-up group capitalize ">
                  <span class="nav-icon dark:text-subtitle-dark text-[18px] text-light-extra group-hover:text-current group-[&.active]:text-current group-focus:text-current">
                     <i class="uil uil-wrench"></i>
                  </span>
                  <span class="capitalize title">Admin Toolbox</span>
               </a>
            </li>
            <li class="relative">
               <a href="<?php echo siteUrl('question_authoring/index.php'); ?>" class="rounded-e-[20px] hover:bg-primary/10 focus:bg-primary/10 active:bg-primary/10 dark:text-subtitle-dark flex h-12 cursor-pointer items-center gap-[16px] truncate px-6 py-4 text-[14px] font-medium text-body outline-none transition duration-300 ease-linear hover:text-primary dark:hover:text-title-dark hover:outline-none focus:text-primary dark:focus:text-title-dark focus:outline-none active:text-primary active:outline-none [&.active]:text-primary dark:[&.active]:text-title-dark  motion-reduce:transition-none dark:hover:bg-box-dark-up dark:focus:bg-box-dark-up dark:active:bg-box-dark-up group capitalize ">
                  <span class="nav-icon dark:text-subtitle-dark text-[18px] text-light-extra group-hover:text-current group-[&.active]:text-current group-focus:text-current">
                     <i class="uil uil-file-alt"></i>
                  </span>
                  <span class="capitalize title">Question Authoring</span>
               </a>
            </li>
            <li class="relative">
               <a href="<?php echo siteUrl('reports/reports.php'); ?>" class="rounded-e-[20px] hover:bg-primary/10 focus:bg-primary/10 active:bg-primary/10 dark:text-subtitle-dark flex h-12 cursor-pointer items-center gap-[16px] truncate px-6 py-4 text-[14px] font-medium text-body outline-none transition duration-300 ease-linear hover:text-primary dark:hover:text-title-dark hover:outline-none focus:text-primary dark:focus:text-title-dark focus:outline-none active:text-primary active:outline-none [&.active]:text-primary dark:[&.active]:text-title-dark  motion-reduce:transition-none dark:hover:bg-box-dark-up dark:focus:bg-box-dark-up dark:active:bg-box-dark-up group capitalize text-primary font-semibold">
                  <span class="nav-icon dark:text-subtitle-dark text-[18px] text-light-extra group-hover:text-current group-[&.active]:text-current group-focus:text-current">
                     <i class="uil uil-chart-bar"></i>
                  </span>
                  <span class="capitalize title">Reports</span>
               </a>
            </li>
         </ul>
      </nav>
   </aside>
   <!-- End: Aside -->
   <!-- Wrapping Content -->
   <div class="relative flex flex-col flex-1 !transition-all !duration-[0.2s] ease-linear delay-[0s] bg-normalBG dark:bg-main-dark" id="content">
      <!-- Header -->
      <header class="sticky top-0 flex w-full bg-white xl:z-[999] max-xl:z-[9999] drop-shadow-1 dark:bg-box-dark dark:drop-shadow-none min-h-[70px]">
         <div class="flex flex-1 nav-wrap md:ps-[20px] ps-[30px] pe-[30px] max-xs:ps-[15px] max-xs:pe-[15px] bg-white dark:bg-box-dark">
            <!-- Header left menu -->
            <ul class="flex items-center mb-0 list-none nav-left ps-0 gap-x-[14px] gap-y-[9px]">
               <li class="flex" id="topMenu-logo">
                  <div class="flex md:w-[190px] xs:w-[170px] max-xs:w-[100px] max-md:pe-[30px] max-xs:pe-[15px] border-e border-[#edf2f9] dark:border-box-dark-up logo-wrapper items-center h-[71px] dark:bg-box-dark-up">
                     <a href="<?php echo siteUrl('admin.php'); ?>" class="block text-center">
                        <div class="logo-full">
                           <img class="md:ps-[15px] dark:hidden" src="<?php echo siteUrl('assets/hexadash/images/logos/logo-dark.png'); ?>" alt="Logo">
                           <img class="md:ps-[15px] hidden dark:block" src="<?php echo siteUrl('assets/hexadash/images/logos/logo-white.png'); ?>" alt="Logo">
                        </div>
                     </a>
                  </div>
               </li>
               <li>
                  <a class="flex items-center justify-center sm:min-w-[40px] sm:w-[40px] sm:h-[40px] min-w-[34px] h-[34px] rounded-full bg-transparent hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up group transition duration-200 ease-in-out text-[#525768] dark:text-subtitle-dark max-md:dark:hover:bg-box-dark-up sm:text-[20px] text-[19px] cursor-pointer xl:[&.hide]:hidden max-md:bg-normalBG max-md:dark:bg-box-dark-up max-md:dark:hover:text-subtitle-dark" id="slim-toggler">
                     <i class="uil uil-align-center-alt text-current [&.is-folded]:hidden flex items-center"></i>
                  </a>
               </li>
            </ul>
            <!-- Header center menu -->
            <div class="relative ps-[30px] hexadash-top-menu xl:flex hidden">
               <ul class="flex flex-wrap items-center 2xl:gap-y-[15px] gap-x-[34px]">
                  <li>
                     <a href="<?php echo siteUrl('admin.php'); ?>" class="flex items-center gap-2 <?php if($navindex==1) echo 'text-primary font-semibold'; ?>">
                        <img class="w-5 h-5" src="<?php echo siteUrl('assets/img/cbt_home.png'); ?>" title="Home" /> Home
                     </a>
                  </li>
                  <li>
                     <a href="<?php echo siteUrl('configuration/home.php'); ?>" class="<?php if($navindex==2) echo 'text-primary font-semibold'; ?>">Test Configuration</a>
                  </li>
                  <li>
                     <a href="<?php echo siteUrl('admin_toolbox/index.php'); ?>" class="<?php if($navindex==3) echo 'text-primary font-semibold'; ?>">Admin Toolbox</a>
                  </li>
                  <li>
                     <a href="<?php echo siteUrl('question_authoring/index.php'); ?>" class="<?php if($navindex==4) echo 'text-primary font-semibold'; ?>">Question Authoring</a>
                  </li>
                  <li>
                     <a href="<?php echo siteUrl('reports/reports.php'); ?>" class="<?php if($navindex==5) echo 'text-primary font-semibold'; ?>">Reports</a>
                  </li>
               </ul>
            </div>
            <!-- Header right menu -->
            <div class="flex items-center ms-auto py-[15px] sm:gap-x-[25px] max-sm:gap-x-[15px] gap-y-[15px] relative">
               <div class="relative" data-te-dropdown-ref>
                  <button type="button" id="author-dropdown" data-te-dropdown-toggle-ref aria-expanded="false" class="flex items-center me-1.5 text-body dark:text-subtitle-dark text-sm font-medium capitalize rounded-full md:me-0 group whitespace-nowrap">
                     <span class="sr-only">Open user menu</span>
                     <img class="min-w-[32px] w-8 h-8 rounded-full xl:me-2" src="<?php echo siteUrl('assets/hexadash/images/avatars/thumbs.png'); ?>" alt="user photo">
                     <span class="hidden xl:block ml-2 max-w-[120px] truncate"><?php
                        $name = htmlspecialchars($_SESSION['MEMBER_FULLNAME']);
                        echo (mb_strlen($name) > 15) ? mb_substr($name, 0, 12) . '...' : $name;
                     ?></span>
                     <i class="uil uil-angle-down text-light dark:text-subtitle-dark text-[18px] hidden xl:block"></i>
                  </button>
                  <!-- Dropdown menu -->
                  <div class="absolute z-[1000] ltr:float-left rtl:float-right m-0 hidden min-w-max list-none overflow-hidden rounded-lg border-none bg-white bg-clip-padding text-left text-base shadow-lg dark:shadow-boxLargeDark dark:bg-box-dark-down  [&[data-te-dropdown-show]]:block" aria-labelledby="author-dropdown" data-te-dropdown-menu-ref>
                     <div class="min-w-[310px] max-sm:min-w-full pt-4 px-[15px] py-[12px] bg-white dark:bg-box-dark shadow-[0_2px_8px_rgba(0,0,0,.15)] dark:shadow-[0_5px_30px_rgba(1,4,19,.60)] rounded-4">
                        <figure class="flex items-center text-sm rounded-[8px] bg-section dark:bg-box-dark-up py-[20px] px-[25px] mb-[12px] gap-[15px]">
                           <img class="w-8 h-8 rounded-full bg-regular" src="<?php echo siteUrl('assets/hexadash/images/avatars/thumbs.png'); ?>" alt="user">
                           <figcaption>
                              <div class="text-dark dark:text-title-dark mb-0.5 text-sm"><?php echo htmlspecialchars($_SESSION['MEMBER_FULLNAME']); ?></div>
                              <div class="mb-0 text-xs text-body dark:text-subtitle-dark">System Administrator</div>
                           </figcaption>
                        </figure>
                        <ul class="m-0 pb-[10px] overflow-x-hidden overflow-y-auto scrollbar bg-transparent max-h-[230px]">
                           <li class="w-full">
                              <div class="p-0 dark:hover:text-white hover:bg-primary/10 dark:hover:bg-box-dark-up rounded-4">
                                 <a href="<?php echo siteUrl('changepassword.php'); ?>" class="inline-flex items-center text-light dark:text-subtitle-dark hover:text-primary hover:ps-6 w-full px-2.5 py-3 text-sm transition-[0.3s] gap-[10px]">
                                    <i class="text-[16px] uil uil-key-skeleton"></i>
                                    Change Password
                                 </a>
                              </div>
                           </li>
                        </ul>
                        <a class="flex items-center justify-center text-sm font-medium bg-normalBG dark:bg-box-dark-up h-[50px] text-light hover:text-primary dark:hover:text-subtitle-dark dark:text-title-dark mx-[-15px] mb-[-15px] rounded-b-6 gap-[6px]" href="<?php echo siteUrl('logout.php'); ?>">
                           <i class="uil uil-sign-out-alt"></i> Logout
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- End: Header -->
      <!-- Main Content -->
      <main class="bg-normalBG dark:bg-main-dark">
         <div class="mx-[30px] min-h-[calc(100vh-195px)] mb-[30px] ssm:mt-[30px] mt-[15px]">
         <div class="text-center text-2xl font-bold mb-8 text-dark dark:text-title-dark">TEST REPORTS</div>
            <div id="container">
                <div class="scheme-select">
                    <h2 class="report-section-title">Regular</h2>
                    <form class="scheme-frm style-frm">
                        <table id="test-init-tbl">
                            <tr><td colspan="2"><div id="infoDiv"></div></td></tr>
                            <tr><td class="report-label">Session:</td><td><select name="init-session"><?php
$dt = getdate();
$yr = $dt["year"];
for ($i = $yr - 3; $i < $yr + 3; $i++) {
    if ($i == $yr)
        echo "<option value='$i' selected>$i</option>";
    echo "<option value='$i'>$i</option>";
}
?></select></td></tr>
                            <tr><td class="report-label">Semester:</td><td><select name="init-semester"><option value="1">First</option><option value="2">Second</option><option value="3">Third</option></select></td></tr>
                            <tr><td class="report-label">Test Code:</td><td>
                                    <select name="init-testcode" id="tcode"><option value="">--Select--</option><?php
                                        $sql = "select * from tbltestcode where testname <>'PUTME' && testname <>'SBRS' && testname<>'SBRS-NEW'";
                                        $stmt=$dbh->prepare($sql);
                                        $stmt->execute();
                                        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                                            echo "<option value='" . $row['testcodeid'] . "'>" . $row['testname'] . "</option>";
                                        }
?></select></td></tr>
                            <tr><td class="report-label">Test Type:</td><td><select name="init-testtype"><option value="">--Select--</option><?php
                                        $sql2 = "select * from tbltesttype";
                                        $stmt1=$dbh->prepare($sql2);
                                        $stmt1->execute();
                                        while ($row2 = $stmt1->fetch(PDO::FETCH_ASSOC)) {
                                            echo "<option value='" . $row2['testtypeid'] . "'>" . $row2['testtypename'] . "</option>";
                                        }
?></select></td></tr>
                            <tr><td></td><td><input type="submit" name="test-init-submit" id="test-init-submit" value="View Report" class="report-btn" /></td></tr>
                        </table>
                    </form>
                </div>

                <div id="container">
                    <div class="scheme-select">
                        <h2 class="report-section-title">Daily Report</h2>
                        <h2><a href="<?php echo siteUrl('reports/view_daily_summary.php');?>">View Report</a></h2>
                    </div>
                </div>
                <div class="scheme-select">
                    <h2 class="report-section-title">PUTME</h2>
                    <form class="scheme-frm style-frm">
                    <table id="test-init-tbl">
                        <tr><td colspan="2"><div id="infoDiv"></div></td></tr>
                        <tr><td class="report-label">Session:</td><td><select name="init-session"><?php
                                        $dt = getdate();
                                        $yr = $dt["year"];
                                        for ($i = $yr - 3; $i < $yr + 3; $i++) {
                                            if ($i == $yr)
                                                echo "<option value='$i' selected>$i</option>";
                                            echo "<option value='$i'>$i</option>";
                                        }
?></select></td></tr>
                        <tr><td class="report-label">
                                <input type="hidden" name="init-semester" id="init-semester" value="0" />
                                <input type="hidden" name="init-testcode" id="init-testcode" value="1" />
                                <input type="hidden" name="init-testtype" id="init-testtype" value="1" />
                            </td><td><input type="submit" name="test-init-submit" id="test-init-submit" value="View Report" class="report-btn" /></td></tr>
                    </table>
                    </form>
                </div>
                <div class="scheme-select">
                    <h2 class="report-section-title">SBRS-NEW</h2>
                    <form class="scheme-frm style-frm">
                    <table id="test-init-tbl">
                        <tr><td colspan="2"><div id="infoDiv"></div></td></tr>
                        <tr><td class="report-label">Session:</td><td><select name="init-session"><?php
                                    $dt = getdate();
                                    $yr = $dt["year"];
                                    for ($i = $yr - 3; $i < $yr + 3; $i++) {
                                        if ($i == $yr)
                                            echo "<option value='$i' selected>$i</option>";
                                        echo "<option value='$i'>$i</option>";
                                    }
?></select></td></tr>
                        <tr><td class="report-label">
                                <?php
                                $sql3 = "select testcodeid from tbltestcode where testname='SBRS-NEW' limit 1";
                                $stmt3=$dbh->prepare($sql3);
                                $stmt3->execute();
                                $row3 = $stmt3->fetch(PDO::FETCH_ASSOC);
                                $tcid = $row3['testcodeid'];
                                ?>
                                <input type="hidden" name="init-semester" id="init-semester" value="0" />
                                <input type="hidden" name="init-testcode" id="init-testcode" value="<?php echo $tcid; ?>" />
                                <input type="hidden" name="init-testtype" id="init-testtype" value="1" />

                            </td><td><input type="submit" name="test-init-submit" id="test-init-submit" value="View Report" class="report-btn" /></td></tr>
                    </table>
                    </form>
                </div>
                <div class="scheme-select">
                    <h2 class="report-section-title">SBRS</h2>
                    <form class="scheme-frm style-frm">
                    <table id="test-init-tbl">
                        <tr><td colspan="2"><div id="infoDiv"></div></td></tr>
                        <tr><td class="report-label">Session:</td><td><select name="init-session"><?php
                                $dt = getdate();
                                $yr = $dt["year"];
                                for ($i = $yr - 3; $i < $yr + 3; $i++) {
                                    if ($i == $yr)
                                        echo "<option value='$i' selected>$i</option>";
                                    echo "<option value='$i'>$i</option>";
                                }
                                ?></select></td></tr>
                        <tr><td class="report-label">Semester:</td><td><select name="init-semester"><option value="1">First</option><option value="2">Second</option><option value="3">Third</option></select></td></tr>
                        <tr><td class="report-label">Test Type:</td><td><select name="init-testtype"><option value="">--Select--</option><?php
                                    $sql2 = "select * from tbltesttype";
                                    $stmt4=$dbh->prepare($sql2);
                                    $stmt4->execute();
                                    while ($row2 = $stmt4->fetch(PDO::FETCH_ASSOC)) {
                                        echo "<option value='" . $row2['testtypeid'] . "'>" . $row2['testtypename'] . "</option>";
                                    }
                                ?></select></td></tr>
                        <tr><td class="report-label">
                                <input type="hidden" name="init-testcode" id="init-testcode" value="2"/>
                            </td><td><input type="submit" name="test-init-submit" id="test-init-submit" value="View Report" class="report-btn" /></td></tr>
                    </table>
                    </form>
                </div>
            </div>
         </div>
      </main>
   </div>
   <script type="text/javascript">
    $(document).on('submit','.scheme-frm',function(event){
        var dis=$(this);
        $.ajax({
           type:'POST',
           url:'get_testid.php',
           data:dis.serialize()
        }).done(function(msg){
            msg=($.trim(msg)-0);
            if(msg==0){
                alert("Test does not exist!");
            }
            else if(msg>0) {
                window.location="<?php echo siteUrl('reports/reports.php?tid='); ?>"+msg;
            }
        });
        return false;
    });
</script>
<style>
  .report-section-title {
    font-size: 1.35rem;
    font-weight: 700;
    background: linear-gradient(90deg, #f3f4f6 60%, #e0e7ef 100%);
    border-left: 4px solid #2563eb;
    padding: 0.5rem 1rem;
    margin-bottom: 1rem;
    border-radius: 0.5rem;
    color: #1e293b;
    letter-spacing: 0.01em;
  }
  .report-btn {
    background: #2563eb;
    color: #fff;
    font-weight: 600;
    border-radius: 0.5rem;
    padding: 0.5rem 1.5rem;
    font-size: 1rem;
    box-shadow: 0 2px 8px rgba(37,99,235,0.08);
    transition: background 0.2s, box-shadow 0.2s;
    border: none;
    margin-top: 0.5rem;
    margin-bottom: 0.5rem;
    cursor: pointer;
    outline: none;
  }
  .report-btn:hover, .report-btn:focus {
    background: #1d4ed8;
    box-shadow: 0 4px 16px rgba(37,99,235,0.15);
  }
  .report-label {
    font-weight: 600;
    color: #2563eb;
    font-size: 1.05rem;
    padding-right: 0.5rem;
    white-space: nowrap;
    letter-spacing: 0.01em;
  }
</style>
</body>
</html>
