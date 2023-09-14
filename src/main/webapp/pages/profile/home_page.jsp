<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/homepage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/normalize.css">
<link rel="dns-prefetch" href="//fonts.googleapis.com" />
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&family=Red+Hat+Text:wght@300;400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />
	<div id="family" class="family-div">
		<div>
			<div>
				<p class="minimalPara">Welocme to Minimalistic</p>
				<h3 class="heading">Decorate It With Your Heart</h3>
				<p class="paraMini">The stylish interior makes us want to spend
					more time in it. We present interesting sets to create an
					apartment. We choose the rights colors according to your own taste.
				</p>

				<a href="../product/shop.html">

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
	<div class="container">
		<div class="home-interiors-div">
			<div class="home-interiors-subdiv">
				<h2 class="home-int-heading">
					<span class="color">E</span>ND-TO-<span class="color">E</span>ND
					INTERIOR
				</h2>

				<div class="interior-row" id="row1Interior"></div>

				<div class="interior-row" id="row2Interior"></div>

				<div class="project">
					<div class="project-title">
						<p>Let our numbers do the talking!</p>
					</div>

					<div class="project-content">
						<p class="project-number" id="firstNumber">
							<span class="color">5000</span>+
						</p>
						<p class="project-numbers">
							<span class="color">50</span>+
						</p>
						<p class="project-numbers">
							<span class="color">5</span>
						</p>
						<p class="project-numbers">
							<span class="color">1</span>
						</p>
					</div>

					<div class="project-content">
						<p class="project-text">#live space homes</p>
						<p class="project-text">designers</p>
						<p class="project-text">conurbation</p>
						<p class="project-text">countries</p>
					</div>

					<div class="review">
						<div class="review-head">
							<p>
								<span class="color">C</span>ilent <span class="color">T</span>estimonials
							</p>
						</div>

						<div class="customer">
							<div>
								<img class="customer-img" src="https://iili.io/HgJDBLP.webp"
									alt="customer image" />
								<h4 class="customer-heading">
									Praveen <span class="color">and</span> Varshini
								</h4>
								<p class="customer-content">We really fell in love with the
									quality that Casas assured and the multiple options that they
									were to offer. The designers were able to provide us with a lot
									of smart options.</p>
							</div>

							<div>
								<img class="customer-img" src="https://iili.io/HgJbB9f.jpg"
									alt="customer image" />
								<h4 class="customer-heading">
									Mithran <span class="color">and</span> Meena
								</h4>
								<p class="customer-content">We’re really happy with the
									materials that were used and the timeline for the project. The
									reaction we got from our friends when they first saw our place
									was priceless.</p>
							</div>

							<div class="customer-3">
								<img class="customer-img" src="https://iili.io/HgJmKiP.jpg"
									alt="customer image" />
								<h4 class="customer-heading">
									Vignesh <span class="color">and</span> Varnika
								</h4>
								<p class="customer-content">Our designer took us through our
									options in extraordinary detail and was extremely helpful in
									setting up our home the way we wanted.</p>
							</div>
						</div>

					</div>

					<div class="work">
						<div class="work-head">
							<p>How it works?</p>
						</div>
						<div class="work-content">
							<div class="work-content-article">
								<button class="btn-work">
									<img class="work-img" src="https://iili.io/HgdWRZ7.png"
										alt="meeting icon" />
								</button>
								<img class="dotted-line" src="https://iili.io/HgJmOdu.png"
									alt="dotted line" />
								<p>Meet a Designer</p>
							</div>
							<div class="work-content-article">
								<button class="btn-work">
									<img class="work-img" src="https://iili.io/HgdXoV1.png"
										alt="sofa image" />
								</button>
								<img class="dotted-line" src="https://iili.io/HgJmOdu.png"
									alt="dotted line" />
								<p>
									<b>(5% payment)</b><br>Book a Renovation
								</p>
							</div>
							<div class="work-content-article">
								<button class="btn-work">
									<img class="work-img" src="https://iili.io/HgdXmdJ.png"
										alt="offer image" />
								</button>
								<img class="dotted-line" src="https://iili.io/HgJmOdu.png"
									alt="dotted line" />
								<p>
									<b>(50% payment)</b><br>Execution begins
								</p>
							</div>
							<div class="work-content-article">
								<button class="btn-work">
									<img class="work-images" id="card_new"
										src="https://iili.io/HgdhYdb.png" alt="installment image" />
								</button>
								<img class="dotted-line" src="https://iili.io/HgJmOdu.png"
									alt="dotted line" />
								<p>
									<b>(100% payment)</b><br>Final Installations
								</p>
							</div>
							<div class="work-content-article" id="work-content-5">
								<button class="btn-work">
									<img class="work-images" src="https://iili.io/HgdjhnS.png"
										alt="delivery image" />
								</button>

								<p class="para-5">Move in and Enjoy</p>
							</div>
						</div>

					</div>

					<footer class="footer" id="footer"> </footer>
					<script src="../../assets/js/profile/homepage.js"></script>
					<script src="<%=request.getContextPath()%>/assets/js/vendor/homepage_bootstrap.js"></script>
					<script src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
</body>
</html>