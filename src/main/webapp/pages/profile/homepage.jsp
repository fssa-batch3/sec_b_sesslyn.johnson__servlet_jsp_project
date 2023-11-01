<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Homepage</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/homepage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/normalize.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/about.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&family=Oswald:wght@400;500;600&display=swap"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/lib/flaticon/font/flaticon.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=DM+Sans&family=Red+Hat+Text:wght@300;400&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />
	<%
	User user = (User) request.getAttribute("userDetails");
	%>
	<%
	String role = user.getRole();
	String exploreLink = "";

	if ("user".equals(role)) {
		exploreLink = request.getContextPath() + "/pages/product/shop.html";
	} else if ("seller".equals(role) || "designer".equals(role)) {
		exploreLink = request.getContextPath() + "/about";
	}
	%>
	<div id="family" class="family-div">
		<div>
			<div>
				<p class="minimalPara">Welcome to Minimalistic</p>
				<h3 class="heading">Decorate It With Your Heart</h3>
				<p class="paraMini">The stylish interior makes us want to spend
					more time in it. We present interesting sets to create an
					apartment. We choose the rights colors according to your own taste.
				</p>
				<a href="<%=exploreLink%>">
					<button class="btn_sell">Explore Now</button>
				</a> 
			</div>
		</div>

		<div>

			<div class="carousel">
				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Hallway</div>
						<div class="num">01</div>
						<img
							src="https://images.pexels.com/photos/2343469/pexels-photo-2343469.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Bedroom</div>
						<div class="num">02</div>
						<img
							src="https://images.pexels.com/photos/1034584/pexels-photo-1034584.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Bedroom" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Kitchen</div>
						<div class="num">03</div>
						<img
							src="https://images.pexels.com/photos/3634740/pexels-photo-3634740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Kids Area</div>
						<div class="num">04</div>
						<img
							src="https://images.pexels.com/photos/3932930/pexels-photo-3932930.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Bathroom</div>
						<div class="num">05</div>
						<img
							src="https://images.pexels.com/photos/271631/pexels-photo-271631.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">False Ceiling</div>
						<div class="num">06</div>
						<img
							src="https://images.pexels.com/photos/1457844/pexels-photo-1457844.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Renovated Home</div>
						<div class="num">07</div>
						<img
							src="https://images.pexels.com/photos/5997959/pexels-photo-5997959.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Truck House</div>
						<div class="num">08</div>
						<img
							src="https://media.istockphoto.com/id/1405860646/photo/tiny-house-modern-interior-design.jpg?b=1&s=170667a&w=0&k=20&c=oYJ-ZWYB-NVIhzTiBsNTRX8ynzCO0uTxqfRxusVP69I="
							alt="Hallway" />
					</div>
				</div>

				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Chandelier</div>
						<div class="num">09</div>
						<img
							src="https://images.pexels.com/photos/3393435/pexels-photo-3393435.jpeg"
							alt="Hallway" />
					</div>
				</div>
				<div class="carousel-item">
					<div class="carousel-box">
						<div class="title">Wadrobe</div>
						<div class="num">10</div>
						<img
							src="https://images.pexels.com/photos/3315286/pexels-photo-3315286.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="Hallway" />
					</div>
				</div>
			</div>

			<div class="cursor"></div>
			<div class="cursor cursor2"></div>
		</div>

	</div>


	<!-- Services Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="row">
				<div class="col-lg-6 pr-lg-5" style="margin-top: 4rem">
					<h6 class="text-primary font-weight-normal text-uppercase mb-3">Our
						Awesome Services</h6>
					<h1 class="mb-4 section-title">Awesome Interior Designing
						Services For Your Home</h1>
					<p>Whether you're looking to refresh a single room or redesign
						your entire home, oue interior design services offer convenience
						and expertise to help you achieve the perfect look for your living
						space.</p>
					<a  href="<%=exploreLink%>" id="aboutLink" class="btn btn-primary mt-3 py-2 px-4">View
						More</a>
				</div>
				<div class="col-lg-6 p-0 pt-5 pt-lg-0">
					<div class="owl-carousel service-carousel position-relative">
						<div class="d-flex flex-column text-center bg-light mx-3 p-4">
							<h3
								class="flaticon-bedroom display-3 font-weight-normal text-primary mb-3"></h3>
							<h5 class="mb-3">Bedroom Design</h5>
							<p class="m-0">We create inviting bedroom designs that
								showcase your exquisite taste. Our designs incorporate a
								harmonious blend of colors to elevate your space.</p>
						</div>
						<div class="d-flex flex-column text-center bg-light mx-3 p-4">
							<h3
								class="flaticon-kitchen display-3 font-weight-normal text-primary mb-3"></h3>
							<h5 class="mb-3">Kitchen Design</h5>
							<p class="m-0">Incorporate natural elements like wood and
								stone for a warm and inviting kitchen. These materials can be
								used for countertops, bringing a touch of nature indoors.</p>
						</div>
						<div class="d-flex flex-column text-center bg-light mx-3 p-4">
							<h3
								class="flaticon-bathroom display-3 font-weight-normal text-primary mb-3"></h3>
							<h5 class="mb-3">Living room Design</h5>
							<p class="m-0">Elevate your living room with eye-catching
								lighting fixtures. Chandeliers, pendant lights, and unique lamps
								can serve as both functional and decorative elements.</p>
						</div>
						<div class="d-flex flex-column text-center bg-light mx-3 p-4">
							<h3
								class="flaticon-kitchen display-3 font-weight-normal text-primary mb-3"></h3>
							<h5 class="mb-3">Bathroom Design</h5>
							<p class="m-0">Achieve a sleek and contemporary look with
								clean lines, minimalist fixtures. Incorporate glass showers and
								vanities for a modern touch.</p>
						</div>
						<div class="d-flex flex-column text-center bg-light mx-3 p-4">
							<h3
								class="flaticon-kitchen display-3 font-weight-normal text-primary mb-3"></h3>
							<h5 class="mb-3">Study Room Design</h5>
							<p class="m-0">Dedicate a cozy corner with a soft rug,
								colorful cushions, and low shelves for books and toys. This
								creates a small play nook where kids can enjoy imaginative play.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Services End -->
	<div class="body">
		<div class="faq">
			<h2>Frequently Asked Questions</h2>
			<div class="accordion">
				<div class="accordion-item">
					<button id="accordion-button-1" aria-expanded="false">
						<span class="accordion-title">What is Minimal?</span><span
							class="icon" aria-hidden="true"></span>
					</button>
					<div class="accordion-content">
						<p>Minimal is a web application that allows you to design the
							interior of your home in various styles, including stylish,
							modern, traditional, luxury, and more.</p>
					</div>
				</div>
				<div class="accordion-item">
					<button id="accordion-button-2" aria-expanded="false">
						<span class="accordion-title">How can I make my home
							beautiful?</span><span class="icon" aria-hidden="true"></span>
					</button>
					<div class="accordion-content">
						<p>Creating a beautiful home is easy with Minimal. We offer
							sophisticated living room designs, space-saving solutions, and
							clutter-free interior designs to match your needs and style.
							Simply book a session with our design experts, and we'll take
							care of the rest.</p>
					</div>
				</div>
				<div class="accordion-item">
					<button id="accordion-button-3" aria-expanded="false">
						<span class="accordion-title">Is it an E-commerce website?</span><span
							class="icon" aria-hidden="true"></span>
					</button>
					<div class="accordion-content">
						<p>Yes, Minimal is an E-commerce website. However, it's more
							than just an online store. You can also book sessions with
							world-class design experts through our website to get creative
							ideas and make your home wonderful and beautiful.</p>
					</div>
				</div>
				<div class="accordion-item">
					<button id="accordion-button-4" aria-expanded="false">
						<span class="accordion-title">What are the key principles
							of minimalist interior design?</span><span class="icon"
							aria-hidden="true"></span>
					</button>
					<div class="accordion-content">
						<p>Minimalist interior design emphasizes simplicity and
							functionality. Key principles include using a minimal color
							palette, decluttering, incorporating clean lines, maximizing
							natural light, and using furniture and decor with a focus on
							essential forms and functionality.</p>
					</div>
				</div>
				<div class="accordion-item">
					<button id="accordion-button-5" aria-expanded="false">
						<span class="accordion-title">What is the use of Minimal?</span><span
							class="icon" aria-hidden="true"></span>
					</button>
					<div class="accordion-content">
						<p>Using this website, you can modify each and every corner of
							our houme in most elegant form. We will make your home beautiful
							in a shot period of time..</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Features Start -->
	<div class="container-fluid bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 mt-5 py-5 pr-lg-5">
					<h6 class="text-primary font-weight-normal text-uppercase mb-3">Why
						Choose Us?</h6>
					<h1 class="mb-4 section-title">Simplicity and Clarity In Our
						Designs</h1>
					<p class="mb-4">Minimalist design is known for its simplicity
						and clarity. It strips away excess and clutter, creating spaces
						that are visually calming and uncluttered. Itemphasizes
						functionality in design. Furniture and decor are chosen for their
						practicality, making daily life more efficient.</p>
					<ul class="list-inline">
						<li class="list">
							<h5>
								<i class="far fa-check-square text-primary mr-3"></i>25+ Years
								Experience
							</h5>
						</li>
						<li class="list">
							<h5>
								<i class="far fa-check-square text-primary mr-3"></i>Best
								Interior Design
							</h5>
						</li>
						<li class="list">
							<h5>
								<i class="far fa-check-square text-primary mr-3"></i>Customer
								Satisfaction
							</h5>
						</li>
					</ul>
					<a  href="<%=exploreLink%>" id="dynamicLink" class="btn btn-primary mt-3 py-2 px-4">View
						More</a>
				</div>
				<div class="col-lg-5">
					<div
						class="d-flex flex-column align-items-center justify-content-center h-100 overflow-hidden">
						<img class="h-100"
							src="<%=request.getContextPath()%>/assets/images/homePage/feature.jpg"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Features End -->


	<!-- Projects Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="row justify-content-center">
				<div class="col-lg-6 col-md-8 col text-center mb-4">
					<h6 class="text-primary font-weight-normal text-uppercase mb-3">Our
						Projects</h6>
					<h1 class="mb-4">Some Of Our Awesome Interior Designing
						Projects</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-center mb-2">
					<ul class="list-inline mb-4" id="portfolio-flters">
						<li class="btn btn-outline-primary m-1 active"
							style="padding-left: 4rem;" data-filter="*">All</li>
						<li class="btn btn-outline-primary m-1" data-filter=".first">Complete</li>
						<li class="btn btn-outline-primary m-1" data-filter=".second">Running</li>
						<li class="btn btn-outline-primary m-1" data-filter=".third">Upcoming</li>
					</ul>
				</div>
			</div>
			<div class="row mx-1 portfolio-container" id="gallery">
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item first">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-1.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-1.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item second">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-2.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-2.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item third">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-3.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-3.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item first">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-4.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-4.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item second">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-5.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-5.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-12 p-0 portfolio-item third">
					<div class="position-relative overflow-hidden">
						<div
							class="portfolio-img d-flex align-items-center justify-content-center">
							<img class="img-fluid"
								src="<%=request.getContextPath()%>/assets/images/homePage/portfolio-6.jpg"
								alt="">
						</div>
						<div
							class="portfolio-text bg-secondary d-flex flex-column align-items-center justify-content-center">
							<h4 class="text-white mb-4">Project Name</h4>
							<div class="d-flex align-items-center justify-content-center">
								<a class="btn btn-outline-primary m-1" href=""> <i
									class="fa fa-link"></i>
								</a> <a class="btn btn-outline-primary m-1"
									href="<%=request.getContextPath()%>/assets/images/homePage/portfolio-6.jpg"
									data-lightbox="portfolio"> <i class="fa fa-eye"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Projects End -->
	<!-- Testimonial Start -->
	<div class="container-fluid" id="testimonial">
		<div class="container">
			<div class="row">
				<div class="col-md-7 py-5 pr-md-5" style="width: 50%;">
					<h6
						class="text-primary font-weight-normal text-uppercase mb-3 pt-5">Testimonial</h6>
					<h1 class="mb-4 section-title">What Our Clients Say</h1>
					<div
						class="owl-carousel testimonial-carousel position-relative pb-5 mb-md-5">
						<div class="d-flex flex-column">
							<div class="d-flex align-items-center mb-3">
								<img class="img-fluid rounded-circle"
									src="https://media.istockphoto.com/id/1218734307/photo/happy-indian-couple.jpg?s=612x612&w=0&k=20&c=YqpcNjYRqYwEV906iFxXTqp69Q2yLNAFS-4qirwqxoA="
									style="width: 60px; height: 60px;" alt="">
								<div class="ml-3">
									<h5>Payal & Rajat</h5>
									<i>Bengaluru</i>
								</div>
							</div>
							<p>We are happy about the journey we had with Minimal. Our
								designer helped us in each and every way. The best part is they
								met the timelines very well.</p>
						</div>
						<div class="d-flex flex-column">
							<div class="d-flex align-items-center mb-3">
								<img class="img-fluid rounded-circle"
									src="https://t4.ftcdn.net/jpg/00/56/33/21/360_F_56332153_LSLzb5CVPXMUtIHrzkCUhpuZ2K5wSBEd.jpg"
									style="width: 60px; height: 60px;" alt="">
								<div class="ml-3">
									<h5>Subhra & Manish</h5>
									<i>Gurgaon</i>
								</div>
							</div>
							<p class="m-0">We have a lot of friends. We wanted something
								good, a positive space where our friends and guests can enjoy.
								Minimal has created just that.</p>
						</div>


						<div class="d-flex flex-column">
							<div class="d-flex align-items-center mb-3">
								<img class="img-fluid rounded-circle"
									src="https://images.pexels.com/photos/2174662/pexels-photo-2174662.jpeg?cs=srgb&dl=pexels-ajay-donga-2174662.jpg&fm=jpg"
									style="width: 60px; height: 60px;" alt="">
								<div class="ml-3">
									<h5>Rohini & Kesav</h5>
									<i>Chennai</i>
								</div>
							</div>
							<p class="m-0">Over the weekends we like to call in our
								friends, especially since Minimal has done such a fabulous job.
								Our designer really understood us..</p>
						</div>

						<div class="d-flex flex-column">
							<div class="d-flex align-items-center mb-3">
								<img class="img-fluid rounded-circle"
									src="https://st.depositphotos.com/1011643/4431/i/450/depositphotos_44311211-stock-photo-lovely-young-indian-couple-outdoors.jpg"
									style="width: 60px; height: 60px;" alt="">
								<div class="ml-3">
									<h5>Rithu & Prem</h5>
									<i>Bengaluru</i>
								</div>
							</div>
							<p class="m-0">We made the right choice in identifying
								Minimal to do up the house. Our designer was like a perfect
								match. The overall experience has been phenomenal.</p>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div
						class="d-flex flex-column align-items-center justify-content-center h-100 overflow-hidden">
						<img class="h-100"
							src="<%=request.getContextPath()%>/assets/images/homePage/testimonial.jpg"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="contact-us position-relative overflow-hidden"
		style="margin-top: -16rem;">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<h4>Minimalistic</h4>
					<ul class="nav flex-column">
						<li class="nav-item"><img
							src="https://www.yudiz.com/codepen/interior-design/location.svg"
							class="img-fluid" alt="Location"> <a
							class="nav-link pe-none" href="javascript:void(0)"> 633 OMR
								road, Chennai, TN 600096 </a></li>
						<li class="nav-item"><img
							src="https://www.yudiz.com/codepen/interior-design/email.svg"
							class="img-fluid" alt="Email"> <a class="nav-link"
							href="mailto:info@design.com">sesslyn2004@gmail.com</a></li>
						<li class="nav-item"><img
							src="https://www.yudiz.com/codepen/interior-design/call.svg"
							class="img-fluid" alt="Call"> <a class="nav-link"
							href="tel:2150021500">9952393445</a></li>
					</ul>
				</div>
				<div class="col-md-7">
					<div class="contact-info">
						<div class="contact-box"></div>
						<div class="contact-border"></div>
						<h3>Follow Us !</h3>
						<p>Thank You for visiting us. Grab a opportunity to meet a
							designer.</p>
						<a href="https://www.linkedin.com/in/sesslyn-j-989b18250/"
							class="common-btn">Follow <img
							src="https://www.yudiz.com/codepen/interior-design/arrow-right.svg"
							class="img-fluid" alt="Arrow"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/lib/easing/easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/lib/isotope/isotope.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/lib/lightbox/js/lightbox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/homepage_main.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/homepage.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/vendor/homepage_bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
</body>

</html>

