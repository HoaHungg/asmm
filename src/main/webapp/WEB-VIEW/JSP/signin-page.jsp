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
	  
	  	String emailErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("emailErr") : " ";
	  	String passwordErr = session.getAttribute("passwordErr") != null ? "" + session.getAttribute("passwordErr") : " ";
    	
		String email = "";
		String password = "";
	  	String mess = (String)session.getAttribute("mess");
	  	if(mess != null){
	  		if(mess.equals("Sign-in Fail")){
	  			email = "" + session.getAttribute("email");
	  			password = "" + session.getAttribute("password");
	  		} else {
	  			session.removeAttribute("email");
	  			session.removeAttribute("password");
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
                <li><a href="#">Login</a></li>
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
                        <!-- Signin -->
                        <div class="signin pt-2 ps-0" style="width: 90%;">
                            <h1 class="h3 mb-3 text-sm-start text-center">Sign in</h1>
                            <div class="">
                                <h3 class="d-inline-block align-middle fs-base fw-medium me-2">With social account:</h3>
                                <div class="d-inline-block align-middle">
                                    <a class="btn-social bs-google me-2 mb-2" href="#" data-bs-toggle="tooltip" aria-label="Sign in with Google" data-bs-original-title="Sign in with Google">
                                        <i class="fa-brands fa-google fa-lg"></i>
                                    </a>
                                    <a class="btn-social bs-facebook me-2 mb-2" href="#" data-bs-toggle="tooltip" aria-label="Sign in with Facebook" data-bs-original-title="Sign in with Facebook">
                                        <i class="fa-brands fa-facebook fa-lg"></i>
                                    </a>
                                    <a class="btn-social bs-twitter me-2 mb-2" href="#" data-bs-toggle="tooltip" aria-label="Sign in with Twitter" data-bs-original-title="Sign in with Twitter">
                                        <i class="fa-brands fa-twitter fa-lg"></i>
                                    </a>
                                </div>
                            </div>
                            <hr/>
                            <h3 class="fs-base pt-4 pb-2">Or using form below</h3>
                            <form action="../../signin" method="post" class="needs-validation" id="signin">
                                <div class="input-group form-group mb-3"><i class="ci-mail position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                    <div class="form-floating mb-3">
                                        <input name="email" type="text" class="form-control rounded-3" id="floatingEmail" placeholder="name@example.com" value="<%= email %>">
                                        <label for="floatingEmail">Email address</label>
                                    </div>
                                    <div class="invalid-feedback"><%= emailErr %></div>
                                </div>
                                <div class="input-group form-group mb-3"><i class="ci-locked position-absolute top-50 translate-middle-y text-muted fs-base ms-3"></i>
                                    <div class="form-floating mb-3">
                                        <input name="password" type="password" class="form-control rounded-3" id="floatingPassword" placeholder="Password" value="<%= password %>">
                                        <label for="floatingPassword">Password</label>
                                    </div>
                                    <div class="invalid-feedback"><%= passwordErr %></div>
                                </div>
                                <div class="d-flex flex-wrap justify-content-between">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="remember_me">
                                        <label class="form-check-label" for="remember_me">Remember me</label>
                                    </div>
                                    <a class="forgot-password nav-link-inline fs-sm" href="forgot-password-page.jsp">Forgot password?</a>
                                </div>
                                <hr class="mt-4">
                                <div class="text-end pt-4 d-flex justify-content-between">
                                    <div class="change-to-signup">
                                        <span>Don't have an account?</span>
                                        <a href="signup-page.jsp" style="color: #c51e1e;">Register</a>
                                    </div>
                                    <button class="btn btn-primary" type="submit">
                                        <i class="fa-solid fa-arrow-right-to-bracket"></i>
                                        Sign In
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- Signin end -->
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
    	  	session.removeAttribute("emailErr");
    	  	session.removeAttribute("passwordErr");
		%>

        <!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script type="text/javascript" src="../js/validation.js"></script>
        <script>
	        Validator({
				workplace: "#signin",
				formGroupSelector: '.form-group',
				rules: [
					Validator.isRequired("#floatingEmail", "Please enter valid email address!"),
					Validator.isRequired("#floatingPassword", "Please enter password!")
				]
			});
        </script>
    </body>
</html>