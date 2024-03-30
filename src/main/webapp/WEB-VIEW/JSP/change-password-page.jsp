<%@page import="model.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="IE-edge" http-equiv="X-UA-Compatible">
        <meta content="width=device-width, intial-scale=1.0" name="viewport">

        <!-- Title -->
        <title>Profile Name</title>
        
        <!-- Fav-icon -->
        <link rel="shortcut icon" href="../images/fav-icon.png"/>
        
        <!-- Import-poppins-font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        
        <!-- Import-Monoton-Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
        
        <!-- Using-Font-Awesome -->
        <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/112b63e1a4.js" crossorigin="anonymous"></script>
        

        <!-- Using-Boostrap-CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <!-- CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <style>
        body{
            font-family: poppins;
        }
        </style>
    </head>
    <body>
    <%
	  	user u = session.getAttribute("userLogin") != null ? (user)session.getAttribute("userLogin") : null;
	  	if(u == null) {
  	%>
  			<jsp:forward page="index.jsp"></jsp:forward>
  	<% 
  		}
	  	
	  	String mess = (String)session.getAttribute("mess");
	  	String crpasswordErr = session.getAttribute("crpasswordErr") != null ? "" + session.getAttribute("crpasswordErr") : " ";
	  	String npasswordErr = session.getAttribute("npasswordErr") != null ? "" + session.getAttribute("npasswordErr") : " ";
	  	String cfpasswordErr = session.getAttribute("cfpasswordErr") != null ? "" + session.getAttribute("cfpasswordErr") : " ";
	
	  	String npassword = "";
		String cfpassword = "";
	  	if(mess != null){
	  		if(mess.equals("Update password Fail")){
	  			npassword = "" + session.getAttribute("npassword");
	  			cfpassword = "" + session.getAttribute("cfpassword");
	  		} else {
	  			session.removeAttribute("password");
	  			session.removeAttribute("cfpassword");
	  		}
	  	}
	%>
        <!-- Navigation -->
        <nav class="navigation">

            <!-- Menu-btn -->
            <input type="checkbox" class="menu-btn" id="menu-btn">
            <label for="menu-btn" class="menu-icon"><span class="nav-icon"></span></label>
    
            <!-- logo -->
            <a href="index.jsp" class="logo"> Movies<span>.hd</span></a>
    
            <!-- Menu -->
            <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">TV Shows</a></li>
                <li><a href="#">Movies</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
    
            <!-- Search -->
            <form action="" class="search-box">
                <!--input-->
                <input type="text" name="search" placeholder="Search Movie" class="search-input" required/>
                <!--btn-->
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
    
           <!-- dropdown-login -->
			<div class="dropdown text-end">
				<!-- icon -->
				<a href="#"
					class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
					src="<%= u.getAvata() %>"
					alt="mdo" width="32" height="32" class="rounded-circle">
				</a>
				<!-- function -->
				<ul class="dropdown-menu text-small">
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item" href="profile-page.jsp">Profile</a></li>
					<%
						if (u.getRole()) {
					%>
						<li><a class="dropdown-item" href="userManager.jsp">Dashboard</a></li>
					<%
						}
					%>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="../../logout">Sign out</a></li>
				</ul>
			</div>

        </nav>
        <!-- Navigation end -->

        <!-- Profile -->
        <section class="myProfile mb-5">
            <div class="myProfileOwn bg-light shadow-lg rounded-3 overflow-hidden">
                <div class="row">
                    <!-- Sidebar-->
                    <aside class="col-lg-3 pe-xl-5">
                        <!-- Account menu toggler (hidden on screens larger 992px)-->
                        <div class="d-block d-lg-none p-4"><a class="btn btn-outline-accent d-block" href="#account-menu" data-bs-toggle="collapse"><i class="ci-menu me-2"></i>Account menu</a></div>
                        <!-- Actual menu-->
                        <div class="h-100 border-end mb-2">
                            <div class="d-lg-block collapse" id="account-menu">
                            <ul class="list-unstyled mb-0">
                                <li class="border-bottom mb-0"><a class="btn_profile nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="profile-page.jsp"><i class="fa-solid fa-gear fa-lg me-2"></i>Profile Settings</a></li>
                                <li class="border-bottom mb-0"><a class="btn_changePassowrd nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="change-password-page.jsp"><i class="fa-solid fa-key fa-lg me-2"></i>Change Password<span class="fs-sm text-muted ms-auto"></span></a></li>
                                <li class="border-bottom mb-0"><a class="nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="favorites-page.jsp"><i class="fa-regular fa-heart fa-lg me-2"></i>Favorites<span class="fs-sm text-muted ms-auto">2</span></a></li>
                                <%
                                	if(u.getRole()){
                                %>
                                <li class="border-bottom mb-0"><a class="nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="userManager.jsp"><i class="fa-solid fa-list fa-lg me-2"></i>Dashboard<span class="fs-sm text-muted ms-auto">3</span></a></li>
                                <% } %>
                                <li class="border-bottom mb-0"><a class="nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="#"><i class="fa-regular fa-bell fa-lg me-2"></i>Notifications</a></li>
                                <li class="border-bottom mb-0"><a class="btn-out nav-link-style text-decoration-none d-flex align-items-center px-4 py-3" href="index.jsp"><i class="fa-solid fa-arrow-right-from-bracket fa-rotate-180 fa-lg me-2"></i>Sign out</a></li>
                            </ul>
                            </div>
                        </div>
                    </aside>
                    <!-- Content-->
                    <section class="col-lg-9 pt-lg-4 pb-4 mb-3">
                        <!-- Password -->
                        <div class="change_passowrd pt-2 px-4 ps-lg-0 pe-xl-5">
                            <!-- Title -->
                            <h1 class="h2 pt-xl-1 pb-3">Change Password</h1>
                            <!-- Content -->
                            <form action="../../change-password" method="post" id="change-password" class="needs-validation border-bottom pb-3 pb-lg-4">
                                <!-- Top -->
                                <div class="row">
                                    <!-- Current-password -->
                                    <div class="col-sm-6 mb-4">
                                        <label for="cp" class="form-label fs-base">Current password</label>
                                        <div class="password-toggle form-group">
                                            <input type="password" id="cp" class="form-control form-control-lg now-password" value="<%= u.getPassword() %>" required="" disabled>
                                            <label class="password-toggle-btn">
                                                <i class="fa-solid fa-eye fa-sm"></i>
                                                <i class="fa-solid fa-eye-slash fa-sm d-none"></i>
                                            </label>
                                            <div class="invalid-feedback"><%= crpasswordErr %></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Bottom -->
                                <div class="row pb-2">
                                    <!-- New password -->
                                    <div class="col-sm-6 mb-4">
                                        <label for="np" class="form-label fs-base ">New password</label>
                                        <div class="password-toggle form-group">
                                            <input name="npassword" type="password" id="np" class="form-control form-control-lg new-password" required="" value="<%= npassword %>">
                                            <label class="password-toggle-btn">
                                                <i class="fa-solid fa-eye fa-sm"></i>
                                                <i class="fa-solid fa-eye-slash fa-sm d-none"></i>
                                            </label>
                                            <div class="invalid-feedback"><%= npasswordErr %></div>
                                        </div>
                                    </div>
                                    <!-- Confirm new password -->
                                    <div class="col-sm-6 mb-4">
                                        <label for="cnp" class="form-label fs-base">Confirm new password</label>
                                        <div class="password-toggle form-group">
                                            <input name="cfpassword" type="password" id="cnp" class="form-control form-control-lg confirm-password" required="" value="<%= cfpassword %>">
                                            <label class="password-toggle-btn">
                                                <i class="fa-solid fa-eye fa-sm"></i>
                                                <i class="fa-solid fa-eye-slash fa-sm d-none"></i>
                                            </label>
                                            <div class="invalid-feedback"><%= cfpasswordErr %></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="d-flex mb-3">
                                    <button type="reset" class="btn bg-gradient-pink-secon me-3">Cancel</button>
                                    <button type="submit" class="btn bg-gradient-pink" style="width: 156px;">Save changes</button>
                                </div>
                            </form>
                        </div>
                        <!-- Change Password end -->
                    </section>
                </div>
            </div>
        </section>
        <!-- Profile-end -->

        <!-- Footer -->
        <footer>
            <!-- footer-logo --->
            <a href="index.jsp" class="logo">
                Movies<span>hd</span>
            </a>
            <!-- copyright ----->
            <span class="copyright">
                Copyright 2023 - DungVipPro
            </span>
        </footer>
        
        <!-- Modal -->
        <%
			if(mess != null){
		%>
			<div class="modal">
			  <div class="cookiesContent" id="cookiesPopup">
			    <button class="close">✖</button>
			    <img src="https://cdn-icons-png.flaticon.com/512/1047/1047711.png" alt="cookies-img" />
			    <p><%= mess %></p>
			    <button class="accept">OK</button>
			  </div>
			</div>
			
			<script type="text/javascript">
				document.querySelectorAll(".invalid-feedback").forEach(element => {
					element.classList.add("d-block");
				})
				document.querySelector(".modal .close").onclick = function () {
					document.querySelector(".modal").classList.add("d-none");
				}
				document.querySelector(".modal .accept").onclick = function() {
					document.querySelector(".modal").classList.add("d-none");
				}
			</script>
		<% 
			}
        
        	session.removeAttribute("mess");
        	session.removeAttribute("crpassword");
    	  	session.removeAttribute("npassword");
    	  	session.removeAttribute("cfpassword");
		%>

        <!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script src="../js/validation.js"></script>
        <script>
            document.querySelectorAll(".fa-eye").forEach(function(element){
                element.onclick = function(){
                    element.parentElement.querySelector(".fa-eye-slash").classList.remove("d-none");
                    element.classList.add("d-none");
                    element.parentElement.parentElement.querySelector("input").type = "text";
                }
            })

            document.querySelectorAll(".fa-eye-slash").forEach(function(element){
                element.onclick = function(){
                    element.parentElement.querySelector(".fa-eye").classList.remove("d-none");
                    element.classList.add("d-none");
                    element.parentElement.parentElement.querySelector("input").type = "password";
                }
            })
            
           Validator({
				workplace: "#change-password",
				formGroupSelector: '.form-group',
				rules: [
					Validator.isRequired("#np", "Please enter your user name!"),
					Validator.isLengthMin("#np", 6, "Password must have at least 6 characters!"),
					Validator.isRequired("#cnp", "Please enter your phone number!"),
					Validator.isLengthMin("#cnp", 6, "Password confirm must have at least 6 characters!"),
					Validator.isConfirm("#cnp", function() {
						return document.querySelector("#np").value
					}, "Passwords do not match!"),
				]
			});    
        </script>
    </body>
</html>