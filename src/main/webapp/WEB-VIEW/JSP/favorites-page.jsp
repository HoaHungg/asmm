<%@page import="dao.favoritesDAO"%>
<%@page import="model.favorites"%>
<%@page import="java.util.List"%>
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
        <title>Profile Name - Favorites</title>
        
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
                        <!-- FAVORITES -->
                        <div class="favorites pt-2 px-4 ps-lg-0 pe-xl-5">
                            <h1 class="h3 mb-4 pb-2 text-sm-start text-center">Favorites</h1>
                            <!-- Items grid-->
                            <div class="product-grid row row-cols-md-3 row-cols-sm-2 row-cols-1 gy-sm-4 gy-3 gx-3 mb-4">
                                
                            </div>
                            <form action="../../like-unlike/unlike/all" method="get">
	                            <button type="submit" class="btn btn-outline-danger btn-delete-all">
	                            	<i class="fa-solid fa-trash"></i>
	                            	<span>Delete all</span>
	                            </button>
                            </form>
                        </div>
                        <!-- FAVORITES end -->
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

        <!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script>
             // API TMDB
            const options = {
                method: 'GET',
                headers: {
                    accept: 'application/json',
                    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
                }
            };

            <%
            	List<favorites> list = favoritesDAO.getVideoDAO().selectAllwithUser(u);
            	for(favorites f : list){
            %>
	            fetch('https://api.themoviedb.org/3/movie/<%= f.getVideo().getVideoId() %>?language=en-US', options)
	            .then(response => response.json())
	            .then(response => loadAPI(response))
	            .catch(err => console.error(err));
            <%
            	}
            %>
            
            function loadAPI(response){
                const totalMinutes = response["runtime"];
                // Calculate hours and minutes
                const hours = Math.floor(totalMinutes / 60);
                const minutes = totalMinutes % 60;
                // Format the result
                const formattedResult = `${hours}h${minutes}`;
                var name = response["original_title"];
                var category = "";
                var i = 0;
                response["genres"].forEach(function(genres){
                    if(i < 3){
                        category = category + genres["name"] + ", " 
                    }
                    i++;
                });
                var href = "movie-page.jsp?id="+response["id"];
                var action = "../../like-unlike/unlike/"+response["id"];
                category = category.slice(0, category.length - 2)
                document.querySelector(".product-grid").innerHTML += `
                            <!-- Product-->
                                <div class="col mb-2">
                                	<form action=${action} class="favorite">
	                                    <article class="card h-100 border-0 shadow">
	                                        <div class="card-img-top position-relative overflow-hidden">
	                                            <!-- Image -->
	                                            <a class="d-block" href=${href}>
	                                                <img src="https://image.tmdb.org/t/p/w500${response["backdrop_path"]}" alt="Product image" style="height: 240px;">
	                                            </a>
	                                            <!-- Countdown timer-->
	                                            <div class="badge bg-dark m-3 fs-sm position-absolute top-0 start-0 zindex-5">
	                                                <i class="fa-solid fa-clock"></i>
	                                                <div class="countdown d-inline" data-countdown="12/31/2022 12:00:00 PM">
	                                                    <span class="countdown-hours mb-0 me-0">
	                                                        <span class="countdown-value">${formattedResult}</span>
	                                                    </span>
	                                                </div>
	                                            </div>
	                                            <!-- Wishlist button-->
	                                            <button class="btn-wishlist btn-sm position-absolute top-0 end-0" type="submit" data-bs-toggle="tooltip" data-bs-placement="top" style="margin: 12px;" aria-label="Remove from favorits" data-bs-original-title="Remove from favorits">
	                                                <i class="fa-solid fa-heart fa-sm"></i>
	                                            </button>
	                                        </div>
	                                        <!-- Description -->
	                                        <div class="card-body">
	                                            <h3 class="product-title fs-base mb-1">
	                                                <a class="d-block text-truncate" href=${href}>${name}</a>
	                                            </h3>
	                                            <span class="fs-sm text-muted mb-2" style="font-size: 0.875rem !important;">${response["release_date"].slice(0,4)}</span>
	                                            <div class="d-flex align-items-center flex-wrap justify-content-between">
	                                                <h4 class="mt-1 mb-0 text-darker">${category}</h4>
	                                                <span class="mt-1 ms-1 text-muted">(${(""+response["vote_average"]).slice(0,3)} IMDB)</span>
	                                            </div>
	                                        </div>
	                                        <!-- Watch button -->
	                                        <div class="card-footer mt-n1 py-0 border-0">
	                                            <div class="view d-flex align-items-center position-relative mb-3 my-3 border-top justify-content-center py-2">
	                                                <a class="fw-bold nav-link-style fs-sm stretched-link" href=${href}>WATCH</a>
	                                            </div>
	                                        </div>
	                                    </article>
	                            	</form>
                                </div>
                `
            }
        </script>
    </body>
</html>