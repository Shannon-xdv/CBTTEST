<?php
if (!isset($_SESSION))
    session_start();
require_once("../lib/globals.php");
require_once("../lib/security.php");
require_once("../lib/cbt_func.php");
//require_once("../lib/test_config_func.php");
openConnection();
authorize();
if (!has_roles(array("Super Admin")))
    header("Location:" . siteUrl("403.php"));

//page title
$pgtitle = "::Admin";
$navindex=0;
?>
<!doctype html>
<html lang="en" dir="ltr" class="scroll-smooth focus:scroll-auto">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Admin Management<?php echo $pgtitle; ?></title>
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
               <a href="test_admin/test_admin.php" target="contentframe" class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition">Test Administrator</a>
            </li>
            <li class="relative">
               <a href="author/author.php" target="contentframe" class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition">Question Author</a>
            </li>
            <li class="relative">
               <a href="manage_admin/manage_admin.php" target="contentframe" class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition">Admin</a>
            </li>
            <li class="relative">
               <a href="pc_registrar/pc_registrar.php" target="contentframe" class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition">PC Registrar</a>
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
                               <div class="mb-0 text-xs text-body dark:text-subtitle-dark">Super Admin</div>
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
             <div class="grid grid-cols-12 gap-[25px]">
                <div class="col-span-12">
                   <div class="p-[25px] bg-white rounded-10 dark:bg-box-dark">
                   <div class="text-center text-2xl font-bold mb-8 text-dark dark:text-title-dark">ADMIN MANAGEMENT</div>
                      <div class="flex flex-row gap-6 mt-6">
                         <div class="w-[260px] min-w-[220px]">
                            <ul class="space-y-2">
                               <li><a class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition" href="test_admin/test_admin.php" target="contentframe">Test Administrator</a></li>
                               <li><a class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition" href="author/author.php" target="contentframe">Question Author</a></li>
                               <li><a class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition" href="manage_admin/manage_admin.php" target="contentframe">Admin</a></li>
                               <li><a class="anchor block px-4 py-2 rounded hover:bg-primary/10 hover:text-primary dark:hover:text-title-dark dark:hover:bg-box-dark-up transition" href="pc_registrar/pc_registrar.php" target="contentframe">PC Registrar</a></li>
                            </ul>
                         </div>
                         <div class="flex-1">
                            <iframe src="../blank.php" id="contentframe" name="contentframe" style="width:100%; display:block; min-height:500px; border-style: none; border-width: 0px; border-radius: 8px; background: #f9fafb;"></iframe>
                         </div>
                      </div>
                   </div>
                </div>
             </div>
          </div>
       </main>
       <!-- End: Main Content -->
    </div>
    <!-- End: Wrapping Content -->
    <script src="<?php echo siteUrl('assets/hexadash/vendor_assets/js/tw-elements.umd.min.js'); ?>"></script>
    <script src="<?php echo siteUrl('assets/hexadash/theme_assets/js/main.js'); ?>"></script>
</body>
</html>
