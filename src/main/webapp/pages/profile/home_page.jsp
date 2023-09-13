<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body{
	overflow-x: hidden;
	margin:0;
	padding:0;
}
.family-div {
	display: grid;
	grid-template-columns: 50% 50%;
	width: 100%;
	height: 80vh;
	background-color: white;
	margin-top: 0.5rem;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}
 
.minimalPara {
	margin-top: -6rem;
	margin-bottom: -1rem;
}

.family-div div:nth-child(1) {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
	align-content: center;
	text-align: center;
	padding-left: 50px;
	padding-right: 20px;
	font-size: 20px;
	color: rgb(16, 15, 15);
}

.family-div div:nth-child(2) {
	display: flex;
	flex-direction: row;
	font-size: 20px;
}


.family-div div:nth-child(1) h3 {
	font-family: "brandon-grotesque", serif;
	font-weight: 500;
	font-style: normal;
	font-size: 3rem;
	padding: 0rem 1rem 1rem 1rem;
	margin: -3rem 0rem 2rem 0rem;
}

.paraMini {
	margin-top: -2rem;
	padding-top: 0rem;
	text-align: center;
}


.btn_sell {
	margin-top: 1rem;
	position: relative;
	font-size: 17px;
	text-transform: uppercase;
	text-decoration: none;
	padding: 1em 2.5em;
	display: inline-block;
	border-radius: 6em;
	transition: all .2s;
	border: none;
	font-family: inherit;
	font-weight: 500;
	color: white;
	background-color: black;
}

.btn_sell:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
	color: white;
	background-color: rgb(244, 17, 17);
}

.btn_sell:active {
	transform: translateY(-1px);
	box-shadow: 0 5px 10px rgba(247, 246, 246, 0.2);
}

.btn_sell::after {
	content: "";
	display: inline-block;
	height: 100%;
	width: 100%;
	border-radius: 100px;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	transition: all .4s;
	background-color: #010101;
}


.btn_sell:hover::after {
	transform: scaleX(1.4) scaleY(1.6);
	opacity: 0;
}

.carousel {
	overflow: hidden;
	font-family: 'Roboto', serif;
	background: linear-gradient(135deg, white, #fff);
	position: relative;
	z-index: 1;
	height: 100vh;
	width: 100%;
	pointer-events: none;
}

.carousel-item {
	--items: 10;
	--width: clamp(300px, 40vw, 300px);
	--height: clamp(300px, 40vw, 400px);
	--x: calc(var(--active) * 800%);
	--y: calc(var(--active) * 200%);
	--rot: calc(var(--active) * 120deg);
	--opacity: calc(var(--zIndex) / var(--items) * 3 - 2);
	overflow: hidden;
	position: absolute;
	z-index: var(--zIndex);
	width: var(--width);
	height: var(--height);
	margin: calc(var(--height) * -0.5) 0 0 calc(var(--width) * -0.5);
	border-radius: 10px;
	top: 50%;

	user-select: none;
	transform-origin: 0% 100%;
	box-shadow: 0 10px 50px 10px rgba(0, 0, 0, .5);
	background: black;
	pointer-events: all;
	transform: translate(var(--x), var(--y)) rotate(var(--rot));
	transition: transform .8s cubic-bezier(0, 0.02, 0, 1);

	.carousel-box {
		position: absolute;
		z-index: 1;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		transition: opacity .8s cubic-bezier(0, 0.02, 0, 1);
		opacity: var(--opacity);
		font-family: 'Orelo-sw-db', serif;

		&:before {
			content: '';
			position: absolute;
			z-index: 1;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}
	}

	.title {
		position: absolute;
		z-index: 1;
		color: #fff;
		bottom: 20px;
		left: 20px;
		transition: opacity .8s cubic-bezier(0, 0.02, 0, 1);
		font-size: clamp(20px, 3vw, 30px);
		text-shadow: 0 4px 4px rgba(0, 0, 0, .1);
	}

	.num {
		position: absolute;
		z-index: 1;
		color: #fff;
		top: 10px;
		left: 20px;
		transition: opacity .8s cubic-bezier(0, 0.02, 0, 1);
		font-size: clamp(20px, 10vw, 80px);
	}

}

.carousel-box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	pointer-events: none;
}

.layout {
	position: absolute;
	z-index: 0;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;

	&:before {
		content: '';
		position: absolute;
		z-index: 1;
		top: 0;
		left: 90px;
		width: 10px;
		height: 100%;
		border: 1px solid #fff;
		border-top: none;
		border-bottom: none;
		opacity: .15;
	}

	.box {
		position: absolute;
		bottom: 0;
		left: 30px;
		color: #fff;
		transform-origin: 0% 10%;
		transform: rotate(-90deg);
		font-size: 9px;
		line-height: 1.4;
		text-transform: uppercase;
		opacity: .4;
	}
}

.cursor {
	position: fixed;
	z-index: 10;
	top: 0;
	left: 0;
	--size: 40px;
	width: var(--size);
	height: var(--size);
	border-radius: 50%;
	border: 1px solid rgba(255, 255, 255, .2);
	margin: calc(var(--size) * -0.5) 0 0 calc(var(--size) * -0.5);
	transition: transform .85s cubic-bezier(0, 0.02, 0, 1);
	display: none;
	pointer-events: none;

	@media (pointer: fine) {
		display: block;
	}
}

.cursor2 {
	--size: 2px;
	transition-duration: .7s;
}

div.container {
	width: 62.5rem;
	border-radius: 0.5rem;
	z-index: 1;
	margin: 8rem 3.75rem 3rem 13.625rem;
	background-color: transparent;
}

.home-interiors-div {
	background-color: var(--white);
}

.home-int-heading {
	color: #222222;
	font-size: 1.5rem;
	text-align: center;
	margin-top: 3.75rem;
	margin-right: 12rem;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}

.interior-row {
	margin: 2.25rem 0;
	display: flex;
	flex-direction: row;
	flex-wrap: no-wrap;
	justify-content: space-between;
	align-items: space-between;

}

.interiors {
	display: inline-block;
	position: relative;
	padding: 0 0.625rem;
	margin: 0rem 1.875rem 0rem 0.625rem;
	box-sizing: border-box;
}

.interiors p {
	font-size: 1rem;
	margin-left: 2.5rem;
	color: var(--black);
	text-align: center;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}

.interiors a {
	text-decoration: none;
}

.interiors img {
	height: 4.063rem;
	width: 4.603rem;
	margin: 0rem 0rem 0.938rem 3rem;
	padding: 0.625rem;
}

img.bedroom {
	height: 5.063rem;
	width: 5.603rem;
}

.interiors img:hover {
	transform: scale(1.5);
	transition: 1s;
}

.color {
	color: red;
}

.project {
	margin: 5rem 12rem 0rem -13rem;
	height: 27.875rem;
	width: 93.038rem;
	background-color: whitesmoke;
}

.project-title {
	text-align: center;
	margin: 2rem;
	padding-top: 1.25rem;
	font-size: 2.5rem;

}

.project-content {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-evenly;
	align-items: space-between;
}

.project-number {
	font-size: 1.875rem;
	padding: 1.25rem 0rem 0rem 1.25rem;

}

.project-numbers {
	font-size: 1.875rem;
	padding: 1.25rem 0rem 0rem 1.25rem;
	margin: 0rem;
}

.project-text {
	font-size: 1.875rem;
	margin: 0rem 0rem 0rem 0.938rem;
	padding-top: 1.25rem;
}

.work-head {
	font-size: 1.875rem;
	text-align: center;
	padding-top: 1.25rem;
	margin-top: 3.125rem;
}

.work-content {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-evenly;
	padding: 1.875rem;
	margin-bottom: 4rem;
}

.btn-work {
	background-color: var(--white);
	border-color: #f76b6b;
	border-style: solid;
	border-radius: 3.125rem;
	margin: 0rem;
}

.seller-img {
	width: 30rem;
	height: 30rem;
	margin: 8rem 0rem 0rem 6rem;
}

.heading {
	font-family: "brandon-grotesque", serif;
	font-weight: 500;
	font-style: normal;
	font-size: 3rem;
	padding: 0rem 1rem 1rem 1rem;
	margin: 1rem 0rem 0rem 0rem;
}

.work-btn {
	margin: 0rem 34.375rem 3rem 34.375rem;
	background-color: var(--black);
	color: var(--white);
	padding: 0.625rem 0.938rem;
	font-size: 1.25rem;
	border-radius: 0.625rem;
}

.work-btn a {
	color: var(--white);
	text-decoration: none;
}

.work-btn:hover {
	transform: scale(1.2);
	transition: 1s;
	background-color: rgb(199, 4, 4);
	border-radius: 0.625rem;
	border-color: transparent;
}

.work-btn a:hover {
	color: var(--white);
	height: 0.625rem;
	width: 0.625rem;
}

.work-images {
	height: 3.438rem;
	width: 5rem;
	padding: 1.563rem 0.938rem;
	margin-left: 1.25rem;
	margin-right: 1.875rem;
}

.work-img {
	height: 6.563rem;
	width: 5rem;
	margin-left: 2.5rem;
	margin-right: 1.875rem;
}

.work-content-article p {
	margin-left: 2.5rem;
}

.dotted-line {
	width: 8.75rem;
	margin-bottom: 1.25rem;
}

.top {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: space-between;

}

.customer {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	align-items: space-between;
}

.customer-img {
	height: 18.75rem;
	width: 23.75rem;
	margin: 0rem 3.125rem 1.25rem 3.75rem;
	padding-left: -3.125rem;
}

.customer-content {
	font-size: 1.25rem;
	padding: 0rem 0rem 0rem 1.875rem;
	margin: 0rem 1.875rem 0rem 2.813rem;
}

.review {
	margin-top: 12rem;
}

.review-head {
	margin: 3.125rem 0rem 0rem 5rem;
	font-size: 2.5rem;

}

.customer-heading {
	margin-left: 4.688rem;
	font-size: 1.563rem;
}

.footer {
	margin-top: 1rem;

}

.question {
	margin: 7rem 0rem 7rem 0rem;
}

.question-head {
	font-size: 4rem;
	margin: -1rem 0rem 0rem 5rem;
	color: #232f3e;
}

.question-para {
	margin: 1.5rem 0rem 0rem 5rem;
	font-size: 1.5rem;
	padding-top: 0.5rem;
}

.topContainer {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	justify-content: space-between;
	padding: 2rem;
	margin: 2rem;
}

.containerDiv {
	box-sizing: border-box;
	margin: 2rem;
	background-color: rgb(214, 214, 214);
	padding: 3rem 3rem 2rem 3rem;
	margin-top: 0rem;
}

.containerDiv h3 {
	text-align: center;
}

.containerDiv p {
	text-align: center;
}

#delivery {
	border-radius: 1.5rem;
}

#firstNumber {
	margin-top: 0rem;
}

#card_new {
	margin-left: 1.60rem;
}
/* Designers */
.containerDesigner {
	font-family: 'Red Hat Text', sans-serif;
    text-align: center;
    color: #333;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-image: url(https://images.unsplash.com/photo-1519120944692-1a8d8cfc107f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80);
    background-size: cover;
    background-position: center;
    margin: 4rem 0rem 0rem 0rem;

 }
 
 .designerHeading{
   font-weight: 700;
   font-size: 3rem;
 }
 
 .paraDesigner{
   max-width: 52ch;
   line-height: 1.5;
   padding: 1em;
 }
 
 .applyNow {
   display: inline-block;
   padding: 1em 3.5em;
   background-color: #333;
   color: white;
   text-decoration: none;
   text-transform: uppercase;
   border-radius: 0.3em;
   font-weight: 700;
   letter-spacing: .5px;
   font-size: .875rem;
   margin-bottom:2rem;
 }
 
.footer {
 
  position: relative;
  width: 100%;
  background: #0a0a0a;
  padding: 20px 0px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.social-icon,
.menu {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10px -2px;
  flex-wrap: wrap;
}

.social-icon__item,
.menu__item {
  list-style: none;
}

.facebook_icon {
  width: 30px;
  height: 30px;
}

.social-icon__link {
  font-size: 2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
}

.social-icon__link:hover {
  transform: translateY(-10px);
}

.menu__link {
  font-size: 1.2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
  text-decoration: none;
  opacity: 0.75;
  font-weight: 300;
}

.menu__link:hover {
  opacity: 1;
}

.footer p {
  color: #fff;
  margin: 15px 0 10px 10px;
  font-size: 1rem;
  font-weight: 300;
}

.wave {
  position: absolute;
  top: -100px;
  left: 0;
  width: 100%;
  height: 100px;
  background: url("https://iili.io/HU3NTtn.png");
  background-size: 1000px 100px;
}

.wave#wave1 {
  z-index: 1000;
  opacity: 1;
  bottom: 0;
  animation: animateWaves 4s linear infinite;
}

.wave#wave2 {
  z-index: 999;
  opacity: 0.5;
  bottom: 10px;
  animation: animate 4s linear infinite !important;
}

.wave#wave3 {
  z-index: 1000;
  opacity: 0.2;
  bottom: 15px;
  animation: animateWaves 3s linear infinite;
}

.wave#wave4 {
  z-index: 999;
  opacity: 0.7;
  bottom: 20px;
  animation: animate 3s linear infinite;
}

@keyframes animateWaves {
  0% {
  background-position-x: 1000px;
  }
  
  100% {
  background-position-x: 0px;
  }
  }
  
  @keyframes animate {
  from {
  background-position-x: -1000px;
  }
  
  to {
  background-position-x: 0px;
  }
  }
</style>
<body>
	<%
	String headerJSP = "";
	if (request.getAttribute("userDetails") != null) {
		headerJSP = "/header_after_login.jsp";
	} else {
		headerJSP = "/header_before_login.jsp";
	}
	%>

	<jsp:include page="<%=headerJSP%>" />
	<div id="family" class="family-div">
		<div>
			<div>
				<p class="minimalPara">Welcome to Minimalistic</p>
				<h3 class="heading">Decorate It With Your Heart</h3>
				<p class="paraMini">The stylish interior makes us want to spend
					more time in it. We present interesting sets to create an
					apartment. We choose the rights colors according to your own taste.
				</p>

				<a href="./shop.html">

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
					quality that Casas assured and the multiple options that they were
					to offer. The designers were able to provide us with a lot of smart
					options.</p>
			</div>

			<div>
				<img class="customer-img" src="https://iili.io/HgJbB9f.jpg"
					alt="customer image" />
				<h4 class="customer-heading">
					Mithran <span class="color">and</span> Meena
				</h4>
				<p class="customer-content">We’re really happy with the
					materials that were used and the timeline for the project. The
					reaction we got from our friends when they first saw our place was
					priceless.</p>
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
	<footer class="footer">
    <div class="waves">
        <div class="wave" id="wave1"></div>
        <div class="wave" id="wave2"></div>
        <div class="wave" id="wave3"></div>
        <div class="wave" id="wave4"></div>
      </div>
      <ul class="social-icon">
        <li class="social-icon__item"><a class="social-icon__link" href="https://www.facebook.com/profile.php?id=100087049213851">
            <img src="https://iili.io/J9F6Wxa.png" class="facebook_icon" alt="facebook-logo">
          </a></li>
        <li class="social-icon__item"><a class="social-icon__link" href="https://twitter.com/narendramodi/status/1617894256928247808?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1617894256928247808%7Ctwgr%5E56ae42402f42bde87178a40653b92ee0b79920d8%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fthesportsgrail.com%2Fwho-is-rishi-shiv-prasanna-his-iq-biography-age-family-parents-father-app-name%2F">
            <img src="https://iili.io/J9F6XWJ.png" class="facebook_icon" alt="twitter-logo">
          </a></li>
        <li class="social-icon__item"><a class="social-icon__link" href="https://www.linkedin.com/notifications/?filter=all">
            <img src="https://iili.io/J9F6Z57.png" class="facebook_icon" alt="linkedin-logo">
          </a></li>
        <li class="social-icon__item"><a class="social-icon__link" href="https://www.instagram.com/endeavour_sess/?next=https%3A%2F%2Fwww.instagram.com%2F">
            <img src="https://iili.io/J9F6te9.png" class="facebook_icon" alt="insta-logo">
          </a></li>
      </ul>
      <ul class="menu">
        <li class="menu__item"><a class="menu__link" href="#">Home</a></li>
        <li class="menu__item"><a class="menu__link" href="#">About</a></li>
        <li class="menu__item"><a class="menu__link" href="#">Shop</a></li>
        <li class="menu__item"><a class="menu__link" href="#">Orders</a></li>
        <li class="menu__item"><a class="menu__link" href="#"></a></li>
  
      </ul>
      <p>&copy;2023 Sesslyn Johnson | All Rights Reserved</p>
    </footer>
	<script>
	
                    let progress = 50
                    let startX = 0
                    let active = 0
                    let isDown = false

                    /*--------------------
                    Contants
                    --------------------*/
                    const speedWheel = 0.02
                    const speedDrag = -0.1

                    /*--------------------
                    Get Z
                    --------------------*/
                    const getZindex = (array, index) => (array.map((_, i) => (index === i) ? array.length : array.length - Math.abs(index - i)))

                    /*--------------------
                    Items
                    --------------------*/
                    const $items = document.querySelectorAll('.carousel-item')
                    const $cursors = document.querySelectorAll('.cursor')

                    const displayItems = (item, index, active) => {
                        const zIndex = getZindex([...$items], active)[index]
                        item.style.setProperty('--zIndex', zIndex)
                        item.style.setProperty('--active', (index - active) / $items.length)
                    }

                    /*--------------------
                    Animate
                    --------------------*/
                    const animate = () => {
                        progress = Math.max(0, Math.min(progress, 100))
                        active = Math.floor(progress / 100 * ($items.length - 1))

                        $items.forEach((item, index) => displayItems(item, index, active))
                    }
                    animate()

                    /*--------------------
                    Click on Items
                    --------------------*/
                    $items.forEach((item, i) => {
                        item.addEventListener('click', () => {
                            progress = (i / $items.length) * 100 + 10
                            animate()
                        })
                    })

                    /*--------------------
                    Handlers
                    --------------------*/
                    const handleWheel = e => {
                        const wheelProgress = e.deltaY * speedWheel
                        progress = progress + wheelProgress
                        animate()
                    }

                    const handleMouseMove = (e) => {
                        if (e.type === 'mousemove') {
                            $cursors.forEach(($cursor) => {
                                $cursor.style.transform = `translate(${e.clientX}px, ${e.clientY}px)`
                            })
                        }
                        if (!isDown) return
                        const x = e.clientX || (e.touches && e.touches[0].clientX) || 0
                        const mouseProgress = (x - startX) * speedDrag
                        progress = progress + mouseProgress
                        startX = x
                        animate()
                    }

                    const handleMouseDown = e => {
                        isDown = true
                        startX = e.clientX || (e.touches && e.touches[0].clientX) || 0
                    }

                    const handleMouseUp = () => {
                        isDown = false
                    }

                    /*--------------------
                    Listeners
                    --------------------*/
                    document.addEventListener('mousewheel', handleWheel)
                    document.addEventListener('mousedown', handleMouseDown)
                    document.addEventListener('mousemove', handleMouseMove)
                    document.addEventListener('mouseup', handleMouseUp)
                    document.addEventListener('touchstart', handleMouseDown)
                    document.addEventListener('touchmove', handleMouseMove)
                    document.addEventListener('touchend', handleMouseUp)

                </script>

</body>
</html>