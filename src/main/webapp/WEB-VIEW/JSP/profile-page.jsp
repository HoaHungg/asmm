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
	  	String fullnameErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("fullnameErr") : " ";
	  	String usernameErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("usernameErr") : " ";
	  	String phoneErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("phoneErr") : " ";
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
                                	if(u.getRole()) {
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
                        <!-- PROFILE SETTING -->
                        <div class="profile_setting pt-2 px-4 ps-lg-0 pe-xl-5">
                            <!-- Information -->
                            <form action="../../edit-profile" method="post" id="edit-profile" enctype="multipart/form-data">
	                            <!-- Title -->
	                            <h1 class="h3 mb-4 pt-2 text-center text-sm-start">Profile Settings</h1>
	                            <!-- Image -->
	                            <div class="bg-body-secondary rounded-3 p-4 mb-4 text-center text-sm-start">
	                                <div class="d-flex flex-sm-row flex-column align-items-sm-start align-items-center">
	                                	<img class="rounded mb-sm-0 mb-3" src="<%= u.getAvata() %>" width="90" alt="Createx Studio" id="avatarImage">
	                                    <div class="ms-n2 ps-sm-4">
	                                        <button class="btn btn-outline-accent mb-2 ms-2" type="button" id="fileButton"><i class="fa-solid fa-arrows-rotate fa-lg me-2"></i>Change <span class="d-none d-sm-inline">avatar</span></button>
	                                        <!-- File input (hidden) -->
											<input name="photo_file" class="d-none" type="file" id="fileInput" accept=".png, .jpg, .jpeg"/>
	                                        <button class="btn btn-outline-danger mb-2 ms-2" type="button" id="deleteButton"><i class="fa-solid fa-trash-can fa-lg me-2"></i>Delete</button>
	                                        <div class="pt-1 mb-0 fs-sm text-muted">We recommend an image of at least 400x400. Gifs work too :)</div>
	                                    </div>
	                                </div>
	                            </div>
                                <!-- Important information -->
                                <div class="row gy-3 mb-4 pb-md-3 mb-2">
                                    <div class="col-sm-6 form-group">
                                        <label class="form-label" for="profile-name">Full name</label>
                                        <input name="fullname" class="form-control" id="profile-name" type="text" value="<%= u.getFullname() %>" placeholder="Example">
                                        <div class="invalid-feedback"><%= fullnameErr %></div>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <label class="form-label" for="profile-username">Username</label>
                                        <input name="username" class="form-control" id="profile-username" type="text" placeholder="@enter_name" value="<%= u.getUsername() %>">
                                    	<div class="invalid-feedback"><%= usernameErr %></div>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <label class="form-label" for="profile-phone">Phone Number</label>
                                        <input name="phone" class="form-control" id="profile-phone" type="text" value="<%= u.getPhone() %>">
                                   		<div class="invalid-feedback"><%= phoneErr %></div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="profile-email">E-mail Address</label>
                                        <input name="email" class="form-control" id="profile-email" type="email" value="<%= u.getEmail() %>" disabled>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label" for="profile-bio">Short bio</label>
                                        <textarea class="form-control" id="profile-bio" rows="4" placeholder="Tell about yourself in few words"></textarea><span class="form-text">0 of 500 characters used.</span>
                                    </div>
                                </div>
                                <!-- Additional information -->
                                <h3 class="h5 mb-3">Social media profiles</h3>
                                <div class="row gy-3 mb-4 pb-2">
                                    <div class="col-sm-6">
                                        <label class="form-label" for="profile-website">Website</label>
                                        <input class="form-control" id="profile-website" type="url" placeholder="Enter URL">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="profile-twitter">Twitter</label>
                                        <input class="form-control" id="profile-twitter" type="url" placeholder="Enter URL">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="profile-facebook">Facebook</label>
                                        <input class="form-control" id="profile-facebook" type="url" placeholder="Enter URL">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="profile-instagram">Instagram</label>
                                        <input class="form-control" id="profile-instagram" type="url" placeholder="Enter URL">
                                    </div>
                                    <div class="col-12"><a style="color: #fe696a;" href="#"><i class="fa-solid fa-plus fa-lg me-2"></i><ins>Add more</ins></a></div>
                                </div>
                                <!-- Submit-->
                                <div class="d-flex flex-sm-row flex-column">
                                    <button class="btn btn-mainPrimary" type="submit">Update profile</button>
                                </div>
                            </form>
                        </div>
                        <!-- Profile setting end -->
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
        	session.removeAttribute("fullnameErr");
    	  	session.removeAttribute("usernameErr");
    	  	session.removeAttribute("phoneErr");
		%>

        <!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script src="../js/validation.js"></script>
        <script type="text/javascript">
	        Validator({
				workplace: "#edit-profile",
				formGroupSelector: '.form-group',
				rules: [
					Validator.isRequired("#profile-name", "Please enter your full name!"),
					Validator.isRequired("#profile-username", "Please enter your user name!"),
					Validator.isRequired("#profile-phone", "Please enter your phone number!"),
					Validator.isPhone("#profile-phone", "Please enter valid phone number!"),
				]
			});   
			
	        $(document).ready(function () {
	            // Attach click event to the button
	            $("#fileButton").click(function () {
	                // Trigger the click event of the hidden file input
	                $("#fileInput").click();
	            });

	         	// Attach change event to the file input
	            $("#fileInput").change(function () {
	                // Handle the selected file here
	                var selectedFile = $(this).prop('files')[0];

	                // Check if a file is selected
	                if (selectedFile) {
	                    // Update the src attribute of the avatar image with the selected file
	                    var imageUrl = URL.createObjectURL(selectedFile);
	                    $("#avatarImage").attr('src', imageUrl);
	                }
	            });

	            // Attach click event to the "Delete" button
	            $("#deleteButton").click(function () {
	                // Reset the avatar image to the default image URL
	                $("#avatarImage").attr('src', 'https://cartzilla.createx.studio/img/nft/vendor/avatar-square.jpg');
	            });
	        });     
        </script>
    </body>
</html>