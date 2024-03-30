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
        <title>Sign in</title>
        
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
	  	if(u != null) {
  	%>
  			<jsp:forward page="index.jsp"></jsp:forward>
  	<% 
  		}
	  	
	  	String mess = (String)session.getAttribute("mess");
	  	String emailErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("emailErr") : " ";
	  	String email = "";
	  	if(!emailErr.equals(" ")){
	  		email = (String)session.getAttribute("email");
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
                <li><a href="signin-page.jsp">Login</a></li>
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
        </nav>
        <!-- Navigation end -->

        <!-- Profile -->
        <section class="myProfile mb-5">
            <div class="myProfileOwn bg-light shadow-lg rounded-3 overflow-hidden" style="width: 100%;">
                <div class="row">
                    <!-- Content-->
                    <section class="col-12 pt-4 pb-4 mb-3 d-flex justify-content-center align-items-center">
                        <!-- Forgot-password -->
                        <div class="justify-content-center mt-4 px-4" style="width: 950px;">
                            <div class="col-12">
                                <h2 class="h3 mb-4">Forgot your password?</h2>
                                <p class="fs-md">Change your password in three easy steps. This helps to keep your new password secure.</p>
                                <ol class="list-unstyled fs-md">
                                    <li><span class="text-read me-2">1.</span>Fill in your email address below.</li>
                                    <li><span class="text-read me-2">2.</span>We'll email you a temporary code.</li>
                                    <li><span class="text-read me-2">3.</span>Use the code to change your password on our secure website.</li>
                                </ol>
                                <div class="card py-2 mt-4">
                                    <form action="../../forgot-password" method="get" id="forgotPassowrd" class="card-body needs-validation" novalidate="">
                                        <div class="mb-3 form-group">
                                            <label class="form-label" for="recover-email">Enter your email address</label>
                                            <input name="email" class="form-control email-forgot" type="text" id="recover-email" value="<%= email %>">
                                            <div class="invalid-feedback"><%= emailErr %></div>
                                        </div>
                                        <button class="btn btn-mainPrimary fs-6" type="submit" style="width: 200px;">Get new password</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Forgot-password end -->
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
        	session.removeAttribute("email");
    	  	session.removeAttribute("emailErr");
		%>

        <!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script src="../js/validation.js"></script>
        <script type="text/javascript">
        Validator({
			workplace: "#forgotPassowrd",
			formGroupSelector: '.form-group',
			rules: [
				Validator.isRequired("#recover-email", "Please enter valid email address!"),
				Validator.isEmail("#recover-email", "Please enter email in correct format!"),
			]
		});        
        </script>
        
    </body>
</html>