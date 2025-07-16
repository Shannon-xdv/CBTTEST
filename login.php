<?php
if (!isset($_SESSION))
    session_start();

require_once("lib/globals.php");
require_once('lib/security.php');

if (is_authenticated()) {
    $alreadyLoggedInUrl = siteUrl("loggedin.php");
    redirectTo($alreadyLoggedInUrl);
}

openConnection();
?>
<!doctype html>
<html lang="en" dir="ltr">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title><?php echo pageTitle("CBT ADMIN LOGIN") ?></title>
   <link rel="icon" type="image/png" sizes="32x32" href="assets\hexadash\images\favicon.ico">
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
<body class="scrollbar">
   <main class="relative bg-top bg-no-repeat bg-[url('assets/hexadash/images/admin/admin-bg-light.png')] dark:bg-[url('assets/hexadash/images/admin/admin-bg-dark.png')] dark:bg-[#1e2836] bg-contain bg-normalBG">
      <div class="h-[calc(var(--vh,1vh)_*_100)] w-full overflow-y-auto scrollbar">
         <div class="flex flex-col justify-center w-full max-w-[516px] px-[30px] mx-auto my-[150px]">
            <a href="index.php" class="text-center">
               <img src="assets/hexadash/images/logos/logo-dark.png" alt="image" class="inline dark:hidden">
               <img src="assets/hexadash/images/logos/logo-white.png" alt="image" class="hidden dark:inline">
            </a>
            <div class="rounded-6 mt-[25px] shadow-regular dark:shadow-xl bg-white dark:bg-[#111726]">
               <div class="p-[25px] text-center border-b border-regular dark:border-white/[.05] top">
                  <h2 class="text-18 font-semibold leading-[1] mb-0 text-dark dark:text-title-dark">ONLY ADMINS <small class="text-[13px] font-normal">ALLOWED TO LOGIN</small></h2>
               </div>
               <div class="py-[30px] px-[40px]">
                  <?php require_once('partials/notification.php'); ?>
                  <?php
                  if (isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) > 0) {
                      foreach ($_SESSION['ERRMSG_ARR'] as $msg) {
                          echo '<span class="block text-red-500 text-xs mb-2">*&nbsp;&nbsp;', $msg, '</span>';
                      }
                      unset($_SESSION['ERRMSG_ARR']);
                  }
                  ?>
                  <?php if (isset($_SESSION['LOGIN_FAILED'])): ?>
                      <div class="alert alert-error bg-red-100 text-red-700 p-2 rounded mb-2">
                          <?php
                          echo $_SESSION['LOGIN_FAILED'];
                          unset($_SESSION['LOGIN_FAILED']);
                          ?>
                      </div>
                  <?php endif ?>
                  <form action="login_exec.php" method="post" class="style-frm" id="admin-form">
                     <div class="mb-6">
                        <label for="username" class="text-[14px] w-full leading-[1.4285714286] font-medium text-dark dark:text-gray-300 mb-[8px] capitalize inline-block">UserName</label>
                        <input class="flex items-center shadow-none py-[10px] px-[20px] h-[48px] border-1 border-regular rounded-4 w-full text-[14px] font-normal leading-[1.5] placeholder:text-[#A0A0A0] focus:ring-primary focus:border-primary" type="text" id="username" name="username" placeholder="Username" required/>
                     </div>
                     <div class="mb-6">
                        <label for="password" class="text-[14px] w-full leading-[1.4285714286] font-medium text-dark dark:text-gray-300 mb-[8px] capitalize inline-block">Password</label>
                        <div class="relative w-full">
                           <input class="flex items-center shadow-none py-[10px] px-[20px] h-[48px] border-1 border-regular rounded-4 w-full text-[14px] font-normal leading-[1.5] placeholder:text-[#A0A0A0] focus:ring-primary focus:border-primary" id="password" type="password" name="password" placeholder="Password" required/>
                        </div>
                     </div>
                     <div class="flex items-center sm:justify-between justify-center max-sm:flex-wrap capitalize mb-[19px] mt-[23px] gap-[15px]">
                        <div class="flex">
                           <div class="flex items-center h-5">
                              <input id="remember" type="checkbox" value="" class="relative ltr:float-left rtl:float-right me-[6px] mt-[0.15rem] h-[1.125rem] w-[1.125rem] appearance-none rounded-[0.25rem] border-1 border-solid border-normal outline-none before:pointer-events-none before:absolute before:h-[10px] before:w-[0.5px] before:scale-0 before:rounded-full before:bg-transparent before:opacity-0 before:content-[''] checked:border-primary checked:bg-primary checked:before:opacity-[0.16] checked:after:absolute checked:after:mt-0 checked:after:ms-[5px] checked:after:block checked:after:h-[10px] checked:after:w-[5px] checked:after:rotate-45 checked:after:border-[0.125rem] checked:after:border-l-0 checked:after:border-t-0 checked:after:border-solid checked:after:border-white checked:after:bg-transparent checked:after:content-[''] hover:cursor-pointer hover:before:opacity-[0.04] dark:border-box-dark-up dark:checked:border-primary dark:checked:bg-primary after:top-[2px]">
                           </div>
                           <label for="remember" class="text-sm text-gray-500 ms-1 dark:text-gray-400">Keep me logged in</label>
                        </div>
                        <a class="text-13 text-primary hover:text-dark dark:hover:text-title-dark" href="recoverpassword.php">Forgot password?</a>
                     </div>
                     <button type="submit" class="inline-flex items-center justify-center w-full h-[48px] text-14 rounded-6 font-medium bg-primary text-white cursor-pointer hover:bg-primary-hbr border-primary transition duration-300" value="submit">Login</button>
                  </form>
                  <div class="relative mt-[25px] text-center text-13 text-regular dark:text-white/[87] before:content-[''] before:absolute before:w-full ltr:before:left-0 rtl:before:right-0 before:top-[50%] before:translate-y-[-50%] before:z-[1] before:h-[1px] before:bg-normal before:dark:bg-box-dark-up">
                     <span class="font-medium px-[15px] inline-block relative z-[2] bg-white dark:bg-[#111625] text-body dark:text-subtitle-dark capitalize">or</span>
                  </div>
                  <div class="text-center p-[25px] rounded-b-6 bg-deepBG dark:bg-gray-600">
                     <p class="text-[14px] font-medium text-body dark:text-title-dark inline-flex items-center gap-[6px] mb-0">
                        Don't have an account? <a class="transition duration-300 text-primary hover:text-dark dark:text-dark dark:hover:text-subtitle-dark" href="usersignup.php">Sign up</a>
                     </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>
   <script type="text/javascript" src="<?php echo siteUrl("assets/js/jquery-1.9.0.js"); ?>"></script>
   <script type="text/javascript" src="<?php echo siteUrl("assets/js/jquery-ui-1.10.0.custom.min.js"); ?>"></script>
   <script type="text/javascript" src="<?php echo siteUrl("assets/js/cbt_js.js"); ?>"></script>
   <script type="text/javascript">
      $(document).ready(function (){
         $('#username').focus();
      });
   </script>
   <script src="assets/hexadash/theme_assets/js/main.js"></script>
   <!-- Dark Mode Button -->
   <div class="dark-single-switch fixed -translate-y-2/4 z-[999] text-white transition-[var(--transition)] m-0 right-[30px] top-[30px]">
      <ul>
         <li>
            <a href="javascript:void(0)" id="darkModeToggleBtn" class="relative flex items-center justify-center w-10 h-10 leading-[63px] text-3xl text-white bg-dark transition-[0.5s] rounded-[50%] before:content-[''] before:absolute before:w-full before:h-full before:transition-[0.5s] before:z-[-1] before:rounded-[50%] before:scale-90 before:left-0 before:top-0 dark:bg-white dark:before:bg-white active:before:scale-110 dark:text-dark text-[22px] shadow-md dark:shadow-lg">
               <i class="uil uil-moon dark:hidden"></i>
               <i class="hidden uil uil-sun dark:flex dark:text-warning"></i>
            </a>
         </li>
      </ul>
   </div>
   <script>
      document.addEventListener('DOMContentLoaded', function() {
         if (typeof enableDarkMode === 'function') {
            enableDarkMode();
         }
         // Attach click event directly to the <a>
         var btn = document.getElementById('darkModeToggleBtn');
         if (btn) {
            btn.addEventListener('click', function(e) {
               e.preventDefault();
               document.body.classList.toggle('dark');
               // Save preference
               localStorage.setItem('darkMode', document.body.classList.contains('dark') ? 'true' : 'false');
            });
         }
      });
   </script>
   <script>
      // Remove the event listener that hijacks the login form
      document.addEventListener('DOMContentLoaded', function() {
         var form = document.getElementById('admin-form');
         if (form) {
            var new_form = form.cloneNode(true);
            form.parentNode.replaceChild(new_form, form);
         }
      });
   </script>
</body>
</html>