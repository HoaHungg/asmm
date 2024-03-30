<%@page import="dao.userDAO"%>
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
	    <title>Dashboard</title>
	    
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
  	<body style="background-color: #fff;">
  	<%
	  	user u = session.getAttribute("userLogin") != null ? (user)session.getAttribute("userLogin") : null;
	  	u = new user();
	  	u.setRole(true);
	  	String ac = request.getParameter("ac");
	  	String id = request.getParameter("id");
	  	if(u == null || u.getRole() == false) {
  	%>
  			<jsp:forward page="index.jsp"></jsp:forward>
  	<% 
  		}
	  	
	  	String fullnameErr = session.getAttribute("fullnameErr") != null ? "" + session.getAttribute("fullnameErr") : " ";
	  	String usernameErr = session.getAttribute("usernameErr") != null ? "" + session.getAttribute("usernameErr") : " ";
	  	String phoneErr = session.getAttribute("phoneErr") != null ? "" + session.getAttribute("phoneErr") : " ";
	  	String emailErr = session.getAttribute("emailErr") != null ? "" + session.getAttribute("emailErr") : " ";
	  	String passwordErr = session.getAttribute("passwordErr") != null ? "" + session.getAttribute("passwordErr") : " ";
	  	
	  	String mess = (String)session.getAttribute("mess");
	  	String fullname = "";
		String username = "";
		String phone = "";
		String email = "";
		String password = "";
        if(mess != null){
	  		if(mess.equals("Sign-up Fail")){
	  			fullname = "" + session.getAttribute("fullname");
	  			username = "" + session.getAttribute("username");
	  			phone = "" + session.getAttribute("phone");
	  			email = "" + session.getAttribute("email");
	  			password = "" + session.getAttribute("password");
	  		} else {
	  			session.removeAttribute("fullname");
	  			session.removeAttribute("username");
	  			session.removeAttribute("phone");
	  			session.removeAttribute("email");
	  			session.removeAttribute("password");
	  		}
	  	}
	%>
	    <!-- Wrapper -->
	    <div class="wrapper">
	        <!-- Slider -->
	        <nav id="sidebar" class="sidebar">
	            <!-- Logo -->
				<a class="sidebar-brand" href="index.jsp">
	                DASHBOARD
				</a>
	            <!-- Content -->
				<div class="sidebar-content">
	                <!-- user -->
					<div class="sidebar-user">
						<img src="<%= u.getAvata() %>" class="img-fluid rounded-circle mb-2" alt="DungVipPro">
						<div class="fw-medium fs-6"><%= u.getEmail() %></div>
						<small>Full stack Developer</small>
					</div>
	                <!-- nav -->
					<ul class="sidebar-nav">
	                    <!-- Title -->
						<li class="sidebar-header">
							Main
						</li>
	                    <!-- Item-dowpdown -->
						<li class="sidebar-item active">
							<a data-bs-target="#dashboards" data-bs-toggle="collapse" class="sidebar-link" aria-expanded="true">
								<i class="align-middle me-2 fas fa-fw fa-home"></i> <span class="align-middle sidebar-head-link">Dashboards</span>
							</a>
							<ul id="dashboards" class="sidebar-dropdown list-unstyled collapse show" data-bs-parent="#sidebar">
								<li class="sidebar-item active"><a class="sidebar-link" href="userManager.jsp">User Manager</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="videoManager.jsp">Video Manager</a></li>
							</ul>
						</li>
	                    <!-- Title -->
						<li class="sidebar-header">
							Elements
						</li>
	                    <!-- Item-dowpdown -->
						<li class="sidebar-item">
							<a data-bs-target="#charts" data-bs-toggle="collapse" class="sidebar-link collapsed">
								<i class="align-middle me-2 fas fa-fw fa-chart-pie"></i> <span class="align-middle sidebar-head-link">Charts</span>
								<span class="sidebar-badge badge rounded-pill bg-primary">New</span>
							</a>
							<ul id="charts" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
								<li class="sidebar-item"><a class="sidebar-link" href="filter-share-page.jsp">Filter Share</a></li>
								<li class="sidebar-item"><a class="sidebar-link" href="filter-favorite-page.jsp">Filter Favorite</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
	        <!-- Slider-end -->
	        <!-- Main -->
	        <div class="main bg-light">
	            <!-- nav -->
				<nav class="navbar navbar-expand navbar-theme py-0 px-2 me-2">
	                <!-- icon -->
					<a class="sidebar-toggle d-flex me-2">
						<i class="hamburger align-self-center"></i>
					</a>
	                <!-- input -->
					<form class="d-none d-sm-inline-block nav_input">
						<input class="form-control form-control-lite" type="text" placeholder="Search projects...">
					</form>
	
					<div class="navbar-collapse collapse">
						<ul class="navbar-nav ms-auto">
							<li class="nav-item dropdown ms-lg-2 pe-4 me-2">
								<a class="nav-link dropdown-toggle position-relative" href="#" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="align-middle fas fa-cog fa-lg"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="#"><i class="align-middle me-1 fas fa-fw fa-user"></i> View Profile</a>
									<a class="dropdown-item" href="#"><i class="align-middle me-1 fas fa-fw fa-comments"></i> Contacts</a>
									<a class="dropdown-item" href="#"><i class="align-middle me-1 fas fa-fw fa-chart-pie"></i> Analytics</a>
									<a class="dropdown-item" href="#"><i class="align-middle me-1 fas fa-fw fa-cogs"></i> Settings</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#"><i class="align-middle me-1 fas fa-fw fa-arrow-alt-circle-right"></i> Sign out</a>
								</div>
							</li>
						</ul>
					</div>
				</nav>
	            <!-- content -->
				<main class="content">
					<div class="container-fluid">
						<div class="header">
							<h1 class="header-title pt-4"> Tables </h1>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h5 class="card-title">User Manager DataTables</h5>
										<h6 class="card-subtitle text-muted">Highly flexible tool that many advanced features to any HTML table. See official
											documentation <a href="https://datatables.net/extensions/responsive/" target="_blank" rel="noopener noreferrer nofollow">here</a>.</h6>
									</div>
									<div class="card-body">
										<div id="datatables-reponsive_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
											<div class="row px-2">
												<div class="col-sm-12 col-md-6  d-flex">
													<div class="dataTables_length" id="datatables-reponsive_length">
														<label>Show 
															<select name="datatables-reponsive_length" aria-controls="datatables-reponsive" class="form-select form-select-sm">
																<option value="10">10</option><option value="25">25</option>
																<option value="50">50</option><option value="100">100</option>
															</select> 
															entries
														</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6 d-flex justify-content-end">
													<div id="datatables-reponsive_filter" class="dataTables_filter">
														<label>Search:
															<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="datatables-reponsive">
														</label>
													</div>
												</div>
											</div>
										</div>
										<div class="row dt-row">
											<div class="col-sm-12 cc">	
												<table id="datatables-reponsive" class="table table-striped dataTable no-footer dtr-inline" style="width: 100%;" aria-describedby="datatables-reponsive_info">
													<thead>
														<tr>
															<th class="sorting sorting_asc" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 220px;" aria-sort="ascending" aria-label="Name: activate to sort column descending">Email</th>
															<th class="sorting" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 180px;" aria-label="Office: activate to sort column ascending">Full name</th>
															<th class="sorting" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 180px;" aria-label="Start date: activate to sort column ascending">User name</th>
															<th class="sorting" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 120px;" aria-label="Age: activate to sort column ascending">Phone</th>
															<th class="sorting" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 80px;" aria-label="Position: activate to sort column ascending">Role</th>
															<th class="sorting" tabindex="0" aria-controls="datatables-reponsive" rowspan="1" colspan="1" style="width: 100px;" aria-label="Salary: activate to sort column ascending">Action</th></tr>
													</thead>
													<tbody>	
													<%
														int i = 1;
														List<user> list = userDAO.getUserDAO().selectAll();
														for(user us : list) {
															if(i % 2 ==0){
													%>
																<tr class="odd">			
													<%
															} else {
													%>
																<tr class="even">
													<%			
															}
													%>
																	<td class="dtr-control sorting_1" tabindex="0"><%= us.getEmail() %></td>
																	<td><%= us.getFullname() %></td>
																	<td><%= us.getUsername() %></td>
																	<td><%= us.getPhone() %></td>
																	<td class=""><%= us.getRole() ? "Admin" : "User" %></td>
																	<td class="">
																		<a href="?ac=update&id=<%= us.getEmail() %>"><i class="align-middle fas fa-fw fa-pen"></i></a>
																		<a href="../../usermanager/delete/id=<%= us.getEmail() %>"><i class="align-middle fas fa-fw fa-trash"></i></a>
																	</td>
																</tr>
													<%
															i++;
														}
													%>
													</tbody>
												</table>
											</div>
										</div>
										<div class="row footer_table">
											<div class="col-sm-12 col-md-5">
												<div class="dataTables_info" id="datatables-reponsive_info" role="status" aria-live="polite">
													Showing 1 to 10 of 57 entries
												</div>
											</div>
											<div class="col-sm-12 col-md-7">
												<div class="dataTables_paginate paging_simple_numbers" id="datatables-reponsive_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled" id="datatables-reponsive_previous">
															<a aria-controls="datatables-reponsive" aria-disabled="true" aria-role="link" data-dt-idx="previous" tabindex="0" class="page-link">
																Previous
															</a>
														</li>
														<li class="paginate_button page-item active">
															<a href="#" aria-controls="datatables-reponsive" aria-role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a>
														</li>
														<li class="paginate_button page-item ">
															<a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="1" tabindex="0" class="page-link">2</a>
														</li>
														<li class="paginate_button page-item ">
															<a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="2" tabindex="0" class="page-link">3</a>
														</li>
														<li class="paginate_button page-item ">
															<a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="3" tabindex="0" class="page-link">4</a>
														</li>
														<li class="paginate_button page-item ">
															<a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="4" tabindex="0" class="page-link">5</a>
														</li>
														<li class="paginate_button page-item "><a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="5" tabindex="0" class="page-link">6</a>
														</li><li class="paginate_button page-item next" id="datatables-reponsive_next"><a href="#" aria-controls="datatables-reponsive" aria-role="link" data-dt-idx="next" tabindex="0" class="page-link">Next</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 mt-4">
								<div class="tab-content">
									<div class="tab-pane fade show active" id="account" role="tabpanel">
	
										<div class="card">
											<div class="card-header">
												<div class="card-actions float-end">
													<a href="userManager.jsp" class="me-1">
														<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw align-middle"><polyline points="23 4 23 10 17 10"></polyline><polyline points="1 20 1 14 7 14"></polyline><path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path></svg>
													</a>
													<div class="d-inline-block dropdown show">
														<a href="#" data-bs-toggle="dropdown" data-bs-display="static">
															<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical align-middle"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
														</a>
	
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#">Action</a>
															<a class="dropdown-item" href="#">Another action</a>
															<a class="dropdown-item" href="#">Something else here</a>
														</div>
													</div>
												</div>
												<h5 class="card-title mb-0">Public info</h5>
											</div>
											<div class="card-body">
												<form id="usermanager" action="../../info" method="post" enctype="multipart/form-data">
												<%
													user uDAO = new user();
													if(ac != null){
														if(ac.equals("update")){
															user uu = new user();
															uu.setEmail(id);
															uDAO = userDAO.getUserDAO().selectX(uu);
														}
													}
												%>
													<div class="row">
														<div class="col-md-8">
															<div class="mb-3 form-group">
																<label for="inputemail">Email Address</label>
																<input name="email" type="text" class="form-control" id="inputemail" placeholder="Email Address" value="<%= uDAO.getEmail() != null ? uDAO.getEmail() : email %>"/>
																<div class="invalid-feedback"><%= emailErr %></div>
															</div>
															<div class="mb-3 form-group">
																<label for="inputpassword">Password</label>
																<input name="password" type="password" class="form-control" id="inputpassword" placeholder="password" value="<%= uDAO.getPassword() != null ? uDAO.getPassword() : password %>">
																<div class="invalid-feedback"><%= passwordErr %></div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="text-center">
																<img id="avatarImage" alt="Chris Wood" src="<%= uDAO.getAvata() != null ? uDAO.getAvata() : "https://cartzilla.createx.studio/img/nft/vendor/avatar-square.jpg" %>" class="rounded-circle img-responsive mt-2" width="128" height="128">
																<div class="mt-2">
																	<span class="btn btn-primary" id="fileButton"><i class="fas fa-upload"></i> Upload</span>
																	<input name="photo_file" class="d-none" type="file" id="fileInput" accept=".png, .jpg, .jpeg"/>
																</div>
																<small>For best results, use an image at least 128px by 128px in .jpg format</small>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="mb-3 col-md-6 form-group">
															<label for="inputFullName">Full name</label>
															<input name="fullname" type="text" class="form-control" id="inputFullName" placeholder="Full name" value="<%= uDAO.getFullname() != null ? uDAO.getFullname() : fullname %>">
															<div class="invalid-feedback"><%= fullnameErr %></div>
														</div>
														<div class="mb-3 col-md-6 form-group">
															<label for="inputUsertName">User name</label>
															<input name="username" type="text" class="form-control" id="inputUsertName" placeholder="User name" value="<%= uDAO.getUsername() != null ? uDAO.getUsername() : username %>">
															<div class="invalid-feedback"><%= usernameErr %></div>
														</div>
													</div>
													<div class="mb-3 form-group">
														<label for="inputphone">Phone Number</label>
														<input name="phone" type="text" class="form-control" id="inputphone" placeholder="Phone Number" value="<%= uDAO.getPhone() != null ? uDAO.getPhone() : phone %>">
														<div class="invalid-feedback"><%= phoneErr %></div>
													</div>
													<button type="submit" class="btn btn-primary">Save changes</button>
												</form>
	
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
	            <!-- footer -->
				<footer class="footer pt-4 bg-light">
					<div class="container-fluid pt-2 p-0">
						<div class="row text-muted">
							<div class="col-8 text-start  p-0">
								<ul class="list-inline">
									<li class="list-inline-item">
										<a class="text-muted" href="#">Support</a>
									</li>
									<li class="list-inline-item">
										<a class="text-muted" href="#">Privacy</a>
									</li>
									<li class="list-inline-item">
										<a class="text-muted" href="#">Terms of Service</a>
									</li>
									<li class="list-inline-item">
										<a class="text-muted" href="#">Contact</a>
									</li>
								</ul>
							</div>
							<div class="col-4 text-end">
								<p class="mb-0">
									© 2023 - <a class="text-muted" href="/dashboard-default">Spark</a>
								</p>
							</div>
						</div>
					</div>
				</footer>
			</div>
	        <!-- Main-end -->
	    </div>    
	    
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
    	  	session.removeAttribute("emailErr");
    	  	session.removeAttribute("passwordErr");
		%>
	
	
	    <!-- Using-Boostrap-JS -->
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
	  
	    <!-- Using-Swiper-JS -->
	    <script src="../js/swiper-bundle.min.js"></script>
	    <script src="../js/jQuery.js"></script>
	    <script src="../js/validation.js"></script>
	
		<script>
			document.querySelector(".sidebar-toggle").onclick = function(){
				document.querySelector("#sidebar").classList.toggle("toggled"); 
			}

			Validator({
				workplace: "#usermanager",
				formGroupSelector: '.form-group',
				rules: [
					Validator.isRequired("#inputFullName", "Please enter your full name!"),
					Validator.isRequired("#inputUsertName", "Please enter your user name!"),
					Validator.isRequired("#inputphone", "Please enter your phone number!"),
					Validator.isPhone("#inputphone", "Please enter valid phone number!"),
					Validator.isRequired("#inputemail", "Please enter valid email address!"),
					Validator.isEmail("#inputemail", "Please enter email in correct format!"),
					Validator.isRequired("#inputpassword", "Please enter password!"),
					Validator.isLengthMin("#inputpassword", 6, "Password must have at least 6 characters!"),
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
	        });  
		</script>
  	</body>
</html>