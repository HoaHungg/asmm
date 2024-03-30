<%@page import="dao.favoritesDAO"%>
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
        <title>Movie Name - DDD</title>
        
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
    	String movieId = "" + request.getParameter("id");
	  	session.setAttribute("urlBack", request.getRequestURL());
	  	user u = session.getAttribute("userLogin") != null ? (user)session.getAttribute("userLogin") : null;
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
                <%
		        	if(u == null){
		        %>
		        	<li><a href="signin-page.jsp">Login</a></li>
		        <%
		        	}
		        %>
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
    		<%
				if(u != null) {
			%> 
		      <!-- dropdown-login -->
		      <div class="dropdown text-end">
		        <!-- icon -->
		        <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		          <img src="<%= u.getAvata() %>" alt="mdo" width="32" height="32" class="rounded-circle">
		        </a>
		        <!-- function -->
		        <ul class="dropdown-menu text-small">
		          <li><a class="dropdown-item" href="#">Settings</a></li>
		          <li><a class="dropdown-item" href="profile-page.jsp">Profile</a></li>
		          <%
		          	if(u.getRole()){
		          %>
		          <li><a class="dropdown-item" href="userManager.jsp">Dashboard</a></li>
		          <% } %>
		          <li><hr class="dropdown-divider"></li>
		          <li><a class="dropdown-item" href="../../logout">Sign out</a></li>
		        </ul>
		      </div>
			<%
				}
			%>
        </nav>
        <!-- Navigation end -->

        <!-- Movie-banner -->
        <section class="movie-banner">

            <!-- Image -->
            <div class="m-banner-img">
                <img src="#" alt="">
            </div>

            <!-- Content -->
            <div class="banner-container">
                <!-- Title container -->
                <div class="title-container">
                    <!-- Title top -->
                    <div class="title-top">
                        <!-- Title -->
                        <div class="movie-title">
                            <h1></h1>
                        </div>

                        <!-- more-about-movie -->
                        <div class="more-about-movie">
                            <span class="quality">Full HD</span>
                            <div class="rating">
                                <span style="margin: 0;"></span> <img alt="imbd" src="../images/IMDb-icon.png">
                            </div>
                            <span id="date"></span>
                            <span id="runtime"></span>
                        </div>

                        <!--language--------->
                        <div class="language">
                            
                        </div>

                        <!-- Like - Share -->
                        <div class="like-share">
                            <div class="language like">
                                <span>
                                	<%
                                		Boolean liked = favoritesDAO.getVideoDAO().selectOne(u, movieId) != null ? true : false;
                                		session.setAttribute("movieId", movieId);
                                		if(!liked){
                                	%>
                                    		<a href="../../like-unlike/like">Like</a>
                                    <%
                                		} else {
                                    %>
                                    		<a href="../../like-unlike/unlike">Unlike</a>
                                    <% } %>
                                </span>
                            </div>

                            <div class="language share">
                                <span>
                                    <a href="#" id="btnShare">Share</a>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Title bottom -->
                    <div class="title-bottom">
                        <!-- category -->
                        <div class="category">
                            <strong>Category</strong><br/>
                            
                        </div>
                        <!-- trailer-btn -->
                        <a href="https://www.youtube.com/watch?v=ZgQkEf3dQ08" class="watch-btn" target="_blank">Watch Trailer</a>
                    </div>

                </div>

                <!-- Button play -->
                <div class="play-btn-container">
                    <div class="play-btn">
                        <a href="javascript:void">
                            <i class="fas fa-play"></i>
                        </a>
                    </div>
                </div>

                <!-- Video full moive -->
                <div class="play" id="play">
                    <!-- close-btn --->
                    <a href="javascript:void" class="close-movie">
                        <i class="fas fa-times"></i>
                    </a>
                    <!-- Movie -->
                    <div class="play-movie">
                        
                    </div>
                </div>
            </div>

        </section>
        <!-- Banner-end -->

        <!-- Details -->
        <section class="movie-details">
            <strong> </strong>
            <p> </p>
        </section>
        <!-- Details-end -->

        <!-- Screenshots -->
        <section class="screenshots">
            <strong>ScreenShots</strong>
            <!-- screenshots-container -->
            <div class="screen-s-container">

            </div>
        </section>
        <!-- Screenshots-end -->

        <!-- Download -->
        <section class="download-movie">
            <!--container----------------->
            <div class="download-container">
                <!--box---->
                <div class="download-box">
                    <span><i class="fas fa-server"></i> Server 1</span>
                    <span>English</span>
                    <span>480p</span>
                    <a href="#" download>Download</a>
                </div>
                <!--box---->
                <div class="download-box">
                    <span><i class="fas fa-server"></i> Server 2</span>
                    <span>English</span>
                    <span>720p</span>
                    <a href="#" download>Download</a>
                </div>
                <!--box---->
                <div class="download-box">
                    <span><i class="fas fa-server"></i> Server 3</span>
                    <span>English</span>
                    <span>1080p</span>
                    <a href="#" download>Download</a>
                </div>
            </div>
        </section>
        <!-- Download-end -->

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
        	String mess = (String)session.getAttribute("mess");
			if(mess != null){
		%>
			<div class="modal modalMess">
			  <div class="cookiesContent" id="cookiesPopup">
			    <button class="close">✖</button>
			    <img src="https://cdn-icons-png.flaticon.com/512/1047/1047711.png" alt="cookies-img" />
			    <p><%= mess %></p>
			    <button class="accept">OK</button>
			  </div>
			</div>
			
			<script type="text/javascript">
				document.querySelector(".modalMess .close").onclick = function () {
					document.querySelector(".modalMess").classList.add("d-none");
				}
				document.querySelector(".modalMess .accept").onclick = function() {
					document.querySelector(".modalMess").classList.add("d-none");
				}
			</script>
		<% 
			}
        
        	session.removeAttribute("mess");
		%>

		<div class="modal modalSendMail d-none">
			<form action="../../share" method="get" id="sendMail">
				<div class="sendMailContent form-group" id="cookiesPopup">
					<button class="close">✖</button>
					<img src="https://cdn-icons-png.flaticon.com/512/1047/1047711.png" alt="cookies-img" />
					<h3>Enter email!</h3>
					<input class="email" name="email" type="email" style="width: 100%; margin-bottom: 4px; border-radius: 8px; padding: 3px; font-size: .9rem">
					<div class="invalid-feedback mb-2">  </div>
					<button type="submit" class="accept">SEND</button>
				</div>
			</form>
		</div>

	<!-- Using-Boostrap-JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        
        <script src="../js/jQuery.js"></script>
        <script src="../js/validation.js"></script>
        <script>
			document.querySelector(".modalSendMail .close").onclick = function () {
				document.querySelector(".modalSendMail").classList.add("d-none");
			}
			document.querySelector(".modalSendMail .accept").onclick = function() {
				document.querySelector(".modalSendMail").classList.add("d-none");
			}
			
            // Menu btn fixed
            $(window).scroll(function(){
                if($(document).scrollTop() > 20){
                    $('.navigation').addClass('fix-icon');
                } else {
                    $('.navigation').removeClass('fix-icon');
                }
            });
			
            // Play video
            $(document).on('click','.play-btn a',function(){
                $('.play').addClass('active-popup');
            });

            // Close video
            $(document).on('click','.close-movie',function(){
                $('.play').removeClass('active-popup');
            });
            
            // Close-video-when-poppup-close
            $('.close-movie').click(function(){
                var iframe = document.getElementById('m-video');
                var iframeSrc = iframe.src;

                // Update the source to pause the video
                iframe.src = iframeSrc.replace('?autoplay=1', '');
            });

			// go to signin when not user
            document.querySelector(".like-share .like").onclick = function(e){
            	<%
					if(u != null) {
				%> 
					
				<% } else { %>
					e.preventDefault();
					window.location.href = 'signin-page.jsp';
				<% } %>
            }

            document.querySelector(".like-share .share").onclick = function(e){
            	<%
					if(u != null) {
				%> 
					document.querySelector(".modalSendMail").classList.remove("d-none");
				<% } else { %>
					e.preventDefault();
					window.location.href = 'signin-page.jsp';
				<% } %>
            }

            document.querySelector(".play-btn a").onclick = function(e){
            	<%
					if(u != null) {
				%> 
					console.log("asd")
				<% } else { %>
					e.preventDefault();
					window.location.href = 'signin-page.jsp';
				<% } %>
            }

            document.querySelector(".title-bottom a").onclick = function(e){
            	<%
					if(u != null) {
				%> 
					console.log("asd")
				<% } else { %>
					e.preventDefault();
					window.location.href = 'signin-page.jsp';
				<% } %>
            }

            document.querySelectorAll(".download-box a").forEach(function(element){
            	element.onclick = function(e){
            		<%
						if(u != null) {
					%> 
						console.log("asd")
					<% } else { %>
						e.preventDefault();
						window.location.href = 'signin-page.jsp';
					<% } %>
                }
            })
            
            Validator({
				workplace: "#sendMail",
				formGroupSelector: '.form-group',
				rules: [
					Validator.isRequired(".email", "Please enter valid email address!"),
					Validator.isEmail(".email", "Please enter email in correct format!"),
				]
			});
            
            // API TMDB
            const options = {
                method: 'GET',
                headers: {
                    accept: 'application/json',
                    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
                }
            };

            fetch('https://api.themoviedb.org/3/movie/<%= movieId %>?language=en-US', options)
            .then(response => response.json())
            .then(response => loadAPI(response))
            .catch(err => console.error(err));

            function loadAPI(response){
                document.querySelector(".m-banner-img img").src = "https://image.tmdb.org/t/p/w500" + response["backdrop_path"];
                var name = response["original_title"];
                document.querySelector(".movie-title h1").textContent = name;
                document.querySelector(".rating span").textContent = (""+response["vote_average"]).slice(0,3);

                const inputDate = response["release_date"];
                // Create a new Date object using the input date
                const dateObject = new Date(inputDate);
                // Options for formatting the date
                const options = { day: 'numeric', month: 'long', year: 'numeric' };
                // Convert the date to the desired format
                const formattedDate = dateObject.toLocaleDateString('en-GB', options);
                document.querySelector(".more-about-movie #date").textContent = formattedDate;

                const totalMinutes = response["runtime"];
                // Calculate hours and minutes
                const hours = Math.floor(totalMinutes / 60);
                const minutes = totalMinutes % 60;
                // Format the result
                const formattedResult = `${hours}h${minutes}`;
                document.querySelector(".more-about-movie #runtime").textContent = formattedResult;

                var languages = "";
                response["spoken_languages"].forEach(function(element){
                    languages += `<span>${element["name"]}</span> `
                });
                document.querySelector(".language").innerHTML = languages;

                var category = "";
                response["genres"].forEach(function(genres){
                    category += `<a href="#">${genres["name"]}</a> `
                });
                document.querySelector(".category").innerHTML += category

                const options1 = {
                    method: 'GET',
                    headers: {
                        accept: 'application/json',
                        Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
                    }
                };

                fetch('https://api.themoviedb.org/3/movie/<%= movieId %>/videos?language=en-US', options1)
                .then(response1 => response1.json())
                .then(response1 => 
                    document.querySelector(".title-bottom .watch-btn").href = "https://www.youtube.com/watch?v=" + (response1["results"][0]["key"])
                )
                .catch(err1 => console.error(err1));

                fetch('https://api.themoviedb.org/3/movie/<%= movieId %>/videos?language=en-US', options1)
                .then(response2 => response2.json())
                .then(response2 => {
                    const videoKey = response2["results"][(response2["results"].length - 2) < 0 ? 0 : (response2["results"].length - 2)]["key"];
                    const youtubeEmbedUrl = `https://www.youtube.com/embed/${videoKey}`;
                    document.querySelector(".play-movie").innerHTML = `<iframe id="m-video" src="${youtubeEmbedUrl}" frameborder="0" allowfullscreen></iframe>`;
                })
                .catch(err2 => console.error(err2));
                
                fetch('https://api.themoviedb.org/3/movie/<%= movieId %>/videos?language=en-US', options1)
                .then(response3 => response3.json())
                .then(response3 => {
                    const videoKey = response3["results"][(response3["results"].length - 2)]["key"];
                    const youtubeEmbedUrl = `https://www.youtube.com/embed/${videoKey}`;
                    document.querySelectorAll(".download-box").forEach(element => {
                        element.querySelector("a").href = youtubeEmbedUrl;
                    })
                })
                .catch(err3 => console.error(err3));

                document.querySelector(".movie-details strong").textContent = name["name"];
                document.querySelector(".movie-details p").textContent = response["overview"];
           
                const options2 = {
                    method: 'GET',
                    headers: {
                        accept: 'application/json',
                        Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
                    }
                };

                fetch('https://api.themoviedb.org/3/movie/<%= movieId %>/images', options2)
                .then(response4 => response4.json())
                .then(response4 =>
                    document.querySelector(".screen-s-container").innerHTML = `
                        <img alt="" src="https://image.tmdb.org/t/p/w500${response4["backdrops"][1-1]["file_path"]}">
                        <img alt="" src="https://image.tmdb.org/t/p/w500${response4["backdrops"][2-1]["file_path"]}">
                        <img alt="" src="https://image.tmdb.org/t/p/w500${response4["backdrops"][3-1]["file_path"]}">
                        <img alt="" src="https://image.tmdb.org/t/p/w500${response4["backdrops"][4-1]["file_path"]}">
                    `
                )
                .catch(err3 => console.error(err3));
            }
        </script>
        <script src="https://www.youtube.com/iframe_api"></script>
    </body>
</html>