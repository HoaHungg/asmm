<%@page import="java.util.List"%>
<%@page import="model.video"%>
<%@page import="dao.videoDAO"%>
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
	    <title>DDD - Full HD Movies</title>
	    
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
	
	    <!-- CSS-Swiper -->
	    <link rel="stylesheet" href="../css/swiper-bundle.min.css"/>
	
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
  	session.setAttribute("urlBack", request.getRequestURL());
  	user u = session.getAttribute("userLogin") != null ? (user)session.getAttribute("userLogin") : null;
  %>
    <!-- Navigation -->
    <nav class="navigation">

      <!-- Menu-btn -->
      <input type="checkbox" class="menu-btn" id="menu-btn">
      <label for="menu-btn" class="menu-icon">
          <span class="nav-icon"></span>
      </label>

      <!-- logo -->
      <a href="index.jsp" class="logo">
        Movies<span>.hd</span>
      </a>

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
	
    <!-- Slider -->
    <section id="main-slider">
    
      <!-- Swiper -->
      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            
        </div>
      </div>

    </section>

    <!-- Button -->
    <div class="slider-btns">
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>
    <!-- Slider-end -->


    <!-- Latest Movies -->
    <div id="latest">
     
      <!-- Heading -->
      <div class="latest-heading">
        <h1>Latest Moives</h1>
      </div>
    
      <!-- Container -->
      <div class="post-container">
        
      </div>
      <!-- Container-end -->

      <!-- Page -->
      <div class="page-number">
        <a href="#" class="page-active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        ....
        <a href="#">100</a>
      </div>

    </div>
    <!-- Latest-post-end -->

    <!-- Footer -->
    <footer>
      <!-- Footer-logo --->
      <a href="index.jsp" class="logo">
          Movies<span>hd</span>
      </a>

      <!-- Copyright ----->
      <span class="copyright">
          Copyright 2023 - DungVipPro
      </span>
    </footer>    

		<!-- Modal -->
        <%
        	String mess = session.getAttribute("mess") != null ? (String)session.getAttribute("mess") : " ";
			if(mess.equals("Sign-in Success")){
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
		%>

    <!-- Using-Boostrap-JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
  
    <!-- Using-Swiper-JS -->
    <script src="../js/swiper-bundle.min.js"></script>
    <script src="../js/jQuery.js"></script>
    <script>
        // Initialize Swiper
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            spaceBetween: 10,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            autoplay:{
                delay: 4000,
                disableOnInteraction: false,
            },
            breakpoints: {
                640: {
                    slidesPerView: 1,
                    spaceBetween: 20,
                },
                768: {
                    slidesPerView: 2,
                    spaceBetween: 40,
                },
                1024: {
                    slidesPerView: 3,
                    spaceBetween: 50,
                },
            },
        });

        // Menu btn fixed
        $(window).scroll(function(){
            if($(document).scrollTop() > 20){
            $('.navigation').addClass('fix-icon');
            } else {
            $('.navigation').removeClass('fix-icon');
            }
        });

        //   Load API
        let genres = [
                            {
                                "id": 28,
                                "name": "Action"
                            },
                            {
                                "id": 12,
                                "name": "Adventure"
                            },
                            {
                                "id": 16,
                                "name": "Animation"
                            },
                            {
                                "id": 35,
                                "name": "Comedy"
                            },
                            {
                                "id": 80,
                                "name": "Crime"
                            },
                            {
                                "id": 99,
                                "name": "Documentary"
                            },
                            {
                                "id": 18,
                                "name": "Drama"
                            },
                            {
                                "id": 10751,
                                "name": "Family"
                            },
                            {
                                "id": 14,
                                "name": "Fantasy"
                            },
                            {
                                "id": 36,
                                "name": "History"
                            },
                            {
                                "id": 27,
                                "name": "Horror"
                            },
                            {
                                "id": 10402,
                                "name": "Music"
                            },
                            {
                                "id": 9648,
                                "name": "Mystery"
                            },
                            {
                                "id": 10749,
                                "name": "Romance"
                            },
                            {
                                "id": 878,
                                "name": "Science Fiction"
                            },
                            {
                                "id": 10770,
                                "name": "TV Movie"
                            },
                            {
                                "id": 53,
                                "name": "Thriller"
                            },
                            {
                                "id": 10752,
                                "name": "War"
                            },
                            {
                                "id": 37,
                                "name": "Western"
                            }
                        ];
        // Swiper-slider
        const settings = {
            async: true,
            crossDomain: true,
            url: 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',
            method: 'GET',
            headers: {
                accept: 'application/json',
                Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
            }
        };
        
        var main_silder = document.querySelector(".swiper-wrapper");
        var silder_box = "";
        
        $.ajax(settings).done(function (response) {
            var i = 1;
            Object.values(response)[1].forEach(element => {
                var img = element["poster_path"]
                var date = element["release_date"].slice(0,4).trim();
                var title = element["title"]
                var average = ("" + element["vote_average"]).slice(0,3);
                var id = element["id"];
                var genre_name = [];
                genres.forEach(function(genre){
                    element["genre_ids"].forEach(function(g){
                        if(g === genre["id"]){
                            genre_name.push(genre["name"])
                        }
                    })
                })
                
                for(var j = genre_name.length ; j < 3; j++){
                    genre_name.push("");
                }

                if(i < 7){
                    silder_box += `
                        <!-- Slide ${i} -->
                        <div class="swiper-slide">
                            <!-- Box -->
                            <div class="main-slider-box">
                            <!-- Overlay -->
                            <a href="movie-page.jsp?id=${id}" class="main-slider-overlay">
                                <i class="fas fa-play"></i>
                            </a>

                            <!-- Image -->
                            <div class="main-slider-img">
                                <img src="https://image.tmdb.org/t/p/w500${img}" alt="Poster"/>
                            </div>
                            
                            <!-- Text -->
                            <div class="main-slider-text">
                                <!-- quality -->
                                <span class="quality">FULL HD</span>

                                <!-- Title -->
                                <div class="title">
                                <!-- Name -->
                                <div class="movie-name">
                                    <span>${date}</span>
                                    <a href="#">${title}</a>
                                </div>

                                <!-- Category and rating -->
                                <div class="category-rating">
                                    <!-- Category -->
                                    <div class="category">
                                    <a href="">${genre_name[0]}</a> <a href="">${genre_name[1]}</a> <a href="">${genre_name[2]}</a>
                                    </div>

                                    <!-- Rating -->
                                    <div class="rating">
                                    ${average} <img src="../images/IMDb-icon.png" alt="imbd"/>
                                    </div>
                                </div>
                                </div>

                            </div>
                            
                            </div>
                        </div>
                    `
                }
                i++;
            });;
            main_silder.innerHTML = silder_box
        });

        // lastest video
        var i = 1;
        var post_container = document.querySelector(".post-container");
		const options1 = {
		      method: 'GET',
		      headers: {
		                 accept: 'application/json',
		                 Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
		               }
		};
        <%
        	List<video> list = videoDAO.getVideoDAO().selectAll();
        	for(video v : list){
        %>
		
		            fetch('https://api.themoviedb.org/3/movie/<%= v.getVideoId() %>?language=en-US', options1)
		            .then(response => response.json())
		            .then(response => loadAPI(response))
		            .catch(err => console.error(err));
		
		            function loadAPI(response){
		            	var img = response["poster_path"]
		                var date = response["release_date"].slice(0,4).trim();
		                var title = response["title"]
		                var average = (""+response["vote_average"]).slice(0,3);
		                var id = response["id"];
		                var genre_name = [];
		                response["genres"].forEach(function(genres){
		                	genre_name.push(genres["name"])
		                });
		                
		                for(var j = genre_name.length ; j < 3; j++){
		                    genre_name.push("");
		                }

		                
		                  post_container.innerHTML += `
		                    <!-- Post-box-${i} -->
		                    <div class="post-box">
		                      <!-- Image -->
		                      <div class="post-img">
		                        <img src="https://image.tmdb.org/t/p/w500${img}" alt="" />
		                      </div>
		                      <!-- Text -->
		                      <div class="main-slider-text">
		                        <!-- quality -->
		                        <span class="quality">FULL HD</span>

		                        <!-- Title -->
		                        <div class="title">
		                          <!-- Name -->
		                          <div class="movie-name">
		                            <span>${date}</span>
		                            <a href="movie-page.jsp?id=${id}">${title}</a>
		                          </div>

		                          <!-- Category and rating -->
		                          <div class="category-rating">
		                            <!-- Category -->
		                            <div class="category">
		                              <a href="">${genre_name[0]}</a> <a href="">${genre_name[1]}</a> <a href="">${genre_name[2]}</a>
		                            </div>

		                            <!-- Rating -->
		                            <div class="rating">
		                              ${average} <img src="../images/IMDb-icon.png" alt="imbd"/>
		                            </div>
		                          </div>
		                        </div>

		                      </div>
		                    </div>
		                  `
		              i++;
			        }
        <%	
        	}
        %>
        	i = 1;
        
        
       /* const settings1 = {
    		async: true,
    		crossDomain: true,
    		url: 'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1',
    		method: 'GET',
    		headers: {
    			accept: 'application/json',
    		    Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzg5MWM0MGM3N2YzYzUxMzA4ODRiODhmOTAyYjUwMyIsInN1YiI6IjY1NTg2ZTJlZWE4NGM3MTA5MjI5Mzg0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fN4fr0fDI-SR67iMwkAaIszJc3xHWKc9WiG_dFOILnY'
    		}
		};

        var post_container = document.querySelector(".post-container");

        $.ajax(settings1).done(function (response) {
          var i = 1;
            Object.values(response)[2].forEach(element => {
                var img = element["poster_path"]
                var date = element["release_date"].slice(0,4).trim();
                var title = element["title"]
                var average = ("" + element["vote_average"]).slice(0,3);
                var id = element["id"];
                var genre_name = [];
                genres.forEach(function(genre){
                    element["genre_ids"].forEach(function(g){
                        if(g === genre["id"]){
                            genre_name.push(genre["name"])
                        }
                    })
                })
                
                for(var j = genre_name.length ; j < 3; j++){
                    genre_name.push("");
                }

                
                  post_container.innerHTML += `
                    <!-- Post-box-${i} -->
                    <div class="post-box">
                      <!-- Image -->
                      <div class="post-img">
                        <img src="https://image.tmdb.org/t/p/w500${img}" alt="" />
                      </div>
                      <!-- Text -->
                      <div class="main-slider-text">
                        <!-- quality -->
                        <span class="quality">FULL HD</span>

                        <!-- Title -->
                        <div class="title">
                          <!-- Name -->
                          <div class="movie-name">
                            <span>${date}</span>
                            <a href="movie-page.jsp?id=${id}">${title}</a>
                          </div>

                          <!-- Category and rating -->
                          <div class="category-rating">
                            <!-- Category -->
                            <div class="category">
                              <a href="">${genre_name[0]}</a> <a href="">${genre_name[1]}</a> <a href="">${genre_name[2]}</a>
                            </div>

                            <!-- Rating -->
                            <div class="rating">
                              ${average} <img src="../images/IMDb-icon.png" alt="imbd"/>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>
                  `
              i++;
            });; 
        });*/
    </script>
  </body>
</html>