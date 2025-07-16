<?php
if (!isset($_SESSION))
    session_start();

require_once(dirname(__FILE__) . "/lib/globals.php");
require_once(dirname(__FILE__) . "/lib/security.php");
authorize();
if (!has_roles(array("Super Admin")) && !has_roles(array("Admin")) && !has_roles(array("Test Administrator")) && !has_roles(array("Test Compositor")) && !has_roles(array("Test Invigilator")) && !has_roles(array("PC Registrar")))
    header("Location:" . siteUrl("403.php"));

//page title
$pgtitle = "::Home";
$navindex = 1;
?>
<!doctype html>
<html lang="en" dir="ltr">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title><?php echo pageTitle("Admin Dashboard") ?></title>
   <link rel="icon" type="image/png" sizes="32x32" href="assets/hexadash/images/favicon.ico">
   <!-- Hexadash & Tailwind CSS -->
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/apexcharts.min.css">
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/datepicker.min.css">
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/line-awesome.min.css">
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/nouislider.min.css">
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/quill.snow.css">
   <link rel="stylesheet" href="assets/hexadash/vendor_assets/css/svgMap.min.css">
   <link rel="stylesheet" href="assets/hexadash/tailwind.css">
   <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;500;600;700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>
<body class="bg-white dark:bg-main-dark font-jost relative text-[15px] font-normal leading-[1.5] m-0 p-0">
   <!-- Header -->
   <header class="sticky top-0 flex w-full bg-white xl:z-[999] max-xl:z-[9999] drop-shadow-1 dark:bg-box-dark dark:drop-shadow-none min-h-[70px]">
      <div class="flex flex-1 nav-wrap md:ps-[20px] ps-[30px] pe-[30px] max-xs:ps-[15px] max-xs:pe-[15px] bg-white dark:bg-box-dark">
         <ul class="flex items-center mb-0 list-none nav-left ps-0 gap-x-[14px] gap-y-[9px]">
            <li class="flex" id="topMenu-logo">
               <div class="flex md:w-[190px] xs:w-[170px] max-xs:w-[100px] max-md:pe-[30px] max-xs:pe-[15px] border-e border-[#edf2f9] dark:border-box-dark-up logo-wrapper items-center h-[71px] dark:bg-box-dark-up">
                  <a href="admin.php" class="block text-center">
                     <div class="logo-full">
                        <img class="md:ps-[15px] dark:hidden" src="assets/hexadash/images/logos/logo-dark.png" alt="Logo">
                        <img class="md:ps-[15px] hidden dark:block" src="assets/hexadash/images/logos/logo-white.png" alt="Logo">
                     </div>
                  </a>
               </div>
            </li>
         </ul>
         <div class="flex-1 flex items-center justify-end">
            <!-- Dark Mode Toggle -->
            <div class="dark-single-switch fixed z-[999] text-white transition-[var(--transition)] m-0 right-[30px] top-[30px]">
               <ul>
                  <li>
                     <a href="javascript:void(0)" id="darkModeToggleBtn" class="relative flex items-center justify-center w-10 h-10 leading-[63px] text-3xl text-white bg-dark transition-[0.5s] rounded-[50%] before:content-[''] before:absolute before:w-full before:h-full before:transition-[0.5s] before:z-[-1] before:rounded-[50%] before:scale-90 before:left-0 before:top-0 dark:bg-white dark:before:bg-white active:before:scale-110 dark:text-dark text-[22px] shadow-md dark:shadow-lg">
                        <i class="uil uil-moon dark:hidden"></i>
                        <i class="hidden uil uil-sun dark:flex dark:text-warning"></i>
                     </a>
                  </li>
               </ul>
            </div>
         </div>
</div>
   </header>
   <main class="flex flex-col items-center justify-center min-h-screen bg-normalBG dark:bg-main-dark">
      <div class="w-full max-w-6xl mx-auto mt-10">
         <div class="text-center text-2xl font-bold mb-8 text-dark dark:text-title-dark">COMPUTER BASED TEST SOFTWARE</div>
         <div class="mx-[30px] min-h-[calc(100vh-195px)] mb-[30px] ssm:mt-[30px] mt-[15px]">
            <div class="grid grid-cols-12 gap-[25px] justify-center">
               <!-- Test Configuration Card -->
               <div class="col-span-12 2xl:col-span-3 sm:col-span-6 cursor-pointer" onclick="window.location='<?php echo siteUrl('configuration/home.php?scheme=1'); ?>'">
                  <div bordered="false" class="bg-white dark:bg-box-dark py-[25px] px-[25px] pb-[12px] overflow-hidden rounded-10 relative text-[15px] text-body dak:text-subtitle-dark">
                     <div class="flex justify-between">
                        <div>
                           <span class="font-normal text-body dark:text-subtitle-dark text-15">Test Configuration</span>
                           <h4 class="mb-0 text-3xl max-lg:text-[26px] max-sm:text-2xl font-semibold leading-normal text-dark dark:text-title-dark">
                              <div class="flex items-center countCategories">
                                 <span class="text">Test Config..</span>
                              </div>
                           </h4>
                           <div>
                              <span class="inline-flex items-center w-full h-11 rounded-lg gap-[10px]"></span>
                           </div>
                        </div>
                        <div class="absolute bg-primary/10 flex h-full items-center justify-start ltr:-right-[140px] max-md:w-[210px] max-ssm:w-[230px] overflow-hidden px-[30px] rounded-full rtl:-left-[140px] text-primary top-0 w-[230px]">
                           <div class="flex items-center justify-center text-primary">
                              <div class="flex items-center text-primary text-[36px]">
                                 <i class="uil uil-cog"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Reports Card -->
               <div class="col-span-12 2xl:col-span-3 sm:col-span-6 cursor-pointer" onclick="window.location='<?php echo siteUrl('reports/reports.php?scheme=1'); ?>'">
                  <div bordered="false" class="bg-white dark:bg-box-dark py-[25px] px-[25px] pb-[12px] overflow-hidden rounded-10 relative text-[15px] text-body dak:text-subtitle-dark">
                     <div class="flex justify-between">
                        <div>
                           <span class="font-normal text-body dark:text-subtitle-dark text-15">Reports</span>
                           <h4 class="mb-0 text-3xl max-lg:text-[26px] max-sm:text-2xl font-semibold leading-normal text-dark dark:text-title-dark">
                              <div class="flex items-center countCategories">
                                 <span class="text">Reports</span>
                              </div>
                           </h4>
                           <div>
                              <span class="inline-flex items-center w-full h-11 rounded-lg gap-[10px]"></span>
                           </div>
                        </div>
                        <div class="absolute bg-info/10 flex h-full items-center justify-start ltr:-right-[140px] max-md:w-[210px] max-ssm:w-[230px] overflow-hidden px-[30px] rounded-full rtl:-left-[140px] text-info top-0 w-[230px]">
                           <div class="flex items-center justify-center text-info">
                              <div class="flex items-center text-info text-[36px]">
                                 <i class="uil uil-chart-line"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Admin Toolbox Card -->
               <div class="col-span-12 2xl:col-span-3 sm:col-span-6 cursor-pointer" onclick="window.location='<?php echo siteUrl('admin_toolbox/index.php?scheme=1'); ?>'">
                  <div bordered="false" class="bg-white dark:bg-box-dark py-[25px] px-[25px] pb-[12px] overflow-hidden rounded-10 relative text-[15px] text-body dak:text-subtitle-dark">
                     <div class="flex justify-between">
                        <div>
                           <span class="font-normal text-body dark:text-subtitle-dark text-15">Admin Toolbox</span>
                           <h4 class="mb-0 text-3xl max-lg:text-[26px] max-sm:text-2xl font-semibold leading-normal text-dark dark:text-title-dark">
                              <div class="flex items-center countCategories">
                                 <span class="text">Admin Toolbox</span>
                              </div>
                           </h4>
                           <div>
                              <span class="inline-flex items-center w-full h-11 rounded-lg gap-[10px]"></span>
                           </div>
                        </div>
                        <div class="absolute bg-secondary/10 flex h-full items-center justify-start ltr:-right-[140px] max-md:w-[210px] max-ssm:w-[230px] overflow-hidden px-[30px] rounded-full rtl:-left-[140px] text-secondary top-0 w-[230px]">
                           <div class="flex items-center justify-center text-secondary">
                              <div class="flex items-center text-secondary text-[36px]">
                                 <i class="uil uil-wrench"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Manage User Card -->
               <div class="col-span-12 2xl:col-span-3 sm:col-span-6 cursor-pointer" onclick="window.location='<?php echo siteUrl('admin/adminpage.php'); ?>'">
                  <div bordered="false" class="bg-white dark:bg-box-dark py-[25px] px-[25px] pb-[12px] overflow-hidden rounded-10 relative text-[15px] text-body dak:text-subtitle-dark">
                     <div class="flex justify-between">
                        <div>
                           <span class="font-normal text-body dark:text-subtitle-dark text-15">Manage User</span>
                           <h4 class="mb-0 text-3xl max-lg:text-[26px] max-sm:text-2xl font-semibold leading-normal text-dark dark:text-title-dark">
                              <div class="flex items-center countCategories">
                                 <span class="text">Manage User</span>
                              </div>
                           </h4>
                           <div>
                              <span class="inline-flex items-center w-full h-11 rounded-lg gap-[10px]"></span>
                           </div>
                        </div>
                        <div class="absolute bg-primary/10 flex h-full items-center justify-start ltr:-right-[140px] max-md:w-[210px] max-ssm:w-[230px] overflow-hidden px-[30px] rounded-full rtl:-left-[140px] text-primary top-0 w-[230px]">
                           <div class="flex items-center justify-center text-primary">
                              <div class="flex items-center text-primary text-[36px]">
                                 <i class="uil uil-users-alt"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Computer Registration Card -->
               <div class="col-span-12 2xl:col-span-3 sm:col-span-6 cursor-pointer" onclick="(function(){var regDialog = document.createElement('div');regDialog.id = 'reg-dialog';regDialog.innerHTML = 'Loading...';document.body.appendChild(regDialog);fetch('registercomputer/reg_comp.php', {method: 'POST'}).then(response => response.text()).then(msg => { regDialog.innerHTML = msg; });})()">
                  <div bordered="false" class="bg-white dark:bg-box-dark py-[25px] px-[25px] pb-[12px] overflow-hidden rounded-10 relative text-[15px] text-body dak:text-subtitle-dark">
                     <div class="flex justify-between">
                        <div>
                           <span class="font-normal text-body dark:text-subtitle-dark text-15">Computer Registration</span>
                           <h4 class="mb-0 text-3xl max-lg:text-[26px] max-sm:text-2xl font-semibold leading-normal text-dark dark:text-title-dark">
                              <div class="flex items-center countCategories">
                                 <span class="text">Computer Registration</span>
                              </div>
                           </h4>
                           <div>
                              <span class="inline-flex items-center w-full h-11 rounded-lg gap-[10px]"></span>
                           </div>
                        </div>
                        <div class="absolute bg-primary/10 flex h-full items-center justify-start ltr:-right-[140px] max-md:w-[210px] max-ssm:w-[230px] overflow-hidden px-[30px] rounded-full rtl:-left-[140px] text-primary top-0 w-[230px]">
                           <div class="flex items-center justify-center text-primary">
                              <div class="flex items-center text-primary text-[36px]">
                                 <i class="uil uil-desktop-cloud-alt"></i>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
</div>
   </main>
   <script src="assets/hexadash/theme_assets/js/main.js"></script>
   <script>
      document.addEventListener('DOMContentLoaded', function() {
         if (typeof enableDarkMode === 'function') {
            enableDarkMode();
         }
         var btn = document.getElementById('darkModeToggleBtn');
         if (btn) {
            btn.addEventListener('click', function(e) {
               e.preventDefault();
               document.body.classList.toggle('dark');
               localStorage.setItem('darkMode', document.body.classList.contains('dark') ? 'true' : 'false');
            });
         }
      });
      // Module click logic (preserved from original)
      document.querySelectorAll('.module').forEach(function(el) {
         el.addEventListener('click', function() {
            var id = this.id;
            if(id=="md1") {
               window.location="<?php echo siteUrl("configuration/home.php?scheme=1"); ?>";
            } else if(id=="md2") {
               window.location="<?php echo siteUrl("admin_toolbox/index.php?scheme=1"); ?>";
            } else if(id=="md3") {
               window.location="<?php echo siteUrl("admin/adminpage.php"); ?>";
            } else if(id=="md4") {
               // Show modal for computer registration
               var regDialog = document.createElement('div');
               regDialog.id = 'reg-dialog';
               regDialog.innerHTML = 'Loading...';
               document.body.appendChild(regDialog);
               // You may want to use a modal library here
               fetch('registercomputer/reg_comp.php', {method: 'POST'})
                  .then(response => response.text())
                  .then(msg => { regDialog.innerHTML = msg; });
            } else if(id=="md5") {
            window.location="<?php echo siteUrl("reports/reports.php?scheme=1"); ?>";
        }
    });
    });
</script>
</body>
</html>