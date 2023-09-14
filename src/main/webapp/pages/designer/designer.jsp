<%@page import="in.fssa.minimal.model.User"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Designers</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/designer/designer.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.3/gsap.min.js"></script>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
</head>
<style>
</style>
<body>
<%
	String headerJSP =  "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	Set<User> designerList = (Set<User>) request.getAttribute("designerDetails");
	%>
  <div class="cardDesigner">
        <section class="section">
            <div class="app">

                <div class="cardList">
                    <button class="cardList__btn btn btn--left">
                        <div class="icon">
                            <svg>
                                <use xlink:href="#arrow-left"></use>
                            </svg>
                        </div>
                    </button>

                    <div class="cards__wrapper">
                        <div class="card current--card">
                            <div class="card__image">
                                <img src="https://images.unsplash.com/photo-1618220179428-22790b461013?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80"
                                    alt="" />
                            </div>
                        </div>

                        <div class="card next--card">
                            <div class="card__image">
                                <img src="https://images.unsplash.com/photo-1564078516393-cf04bd966897?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
                                    alt="" />
                            </div>
                        </div>

                        <div class="card previous--card">
                            <div class="card__image">
                                <img src="https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
                                    alt="" />
                            </div>
                        </div>
                    </div>

                    <button class="cardList__btn btn btn--right">
                        <div class="icon">
                            <svg>
                                <use xlink:href="#arrow-right"></use>
                            </svg>
                        </div>
                    </button>
                </div>

                <div class="infoList">
                    <div class="info__wrapper">
                        <div class="info current--info">
                            <h1 class="text name">Adornment</h1>
                            <h4 class="text location">JOHNSON</h4>
                            <p class="text description">"Let color, form, space, texture, pattern, <br>line, and light
                                be your guide through the <br>world of interior design."</p>
                        </div>

                        <div class="info next--info">
                            <h1 class="text name">Intention</h1>
                            <h4 class="text location">Sam Victor</h4>
                            <p class="text description">"The interior design will aim to translate the<br> client's
                                ideas and the professional vision<br> in a renovated space combining <br>aesthetics,
                                comfort and practicality."</p>
                        </div>

                        <div class="info previous--info">
                            <h1 class="text name">Foresight </h1>
                            <h4 class="text location">Jeabsteen</h4>
                            <p class="text description"> Better facilitate and communicate <br> Barton Interiors
                                services and product<br> through our website. - Minimalistic</p>
                        </div>
                    </div>
                </div>


                <div class="app__bg">
                    <div class="app__bg__image current--image">
                        <img src="https://source.unsplash.com/Z8dtTatMVMw" alt="" />
                    </div>
                    <div class="app__bg__image next--image">
                        <img src="https://source.unsplash.com/9dmycbFE7mQ" alt="" />
                    </div>
                    <div class="app__bg__image previous--image">
                        <img src="https://source.unsplash.com/m7K4KzL5aQ8" alt="" />
                    </div>
                </div>
            </div>

            <svg class="icons" style="display: none;">
                <symbol id="arrow-left" xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'>
                    <polyline points='328 112 184 256 328 400'
                        style='fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:48px' />
                </symbol>
                <symbol id="arrow-right" xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'>
                    <polyline points='184 112 328 256 184 400'
                        style='fill:none;stroke:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:48px' />
                </symbol>
            </svg>
        </section>
        <div class="scroll-wrapper">
            <img src="https://iili.io/HgcB9Og.png" class="scroll" alt="down-arrow">
        </div>
    </div>
	

	<main id="slider">
		<section class="slider-container">
			<div class="slider">
				<div class="slider-item">

					<%
					for (User designer : designerList) {
					%>
					<div class="slide">
						<figure class="slide-image">
							<%
							String image = designer.getImage();
							if (image != null) {
							%>
							<img src="<%=image%>" alt="Image of Designers" />
							<%
							} else {
							%>
							<img
								src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
								alt="Image of Designers" />
							<%
							}
							%>
						</figure>
						<h4 class="slide-name"><%=designer.getName()%></h4>
						<p class="slide-profession">Designer</p>
						<div class="custom-line"></div>
						<div class="row">
							<p class="project">
								Id :
								<%=designer.getId()%></p>
							<strong>.</strong>
							<p class="team">3 Persons</p>
						</div>
						<div class="custom-line"></div>
						<div class="row custom-row">
							<a href="designer/details?id=<%=designer.getId()%>">
								<button class="viewMore" data-id="designerId">View More</button>
							</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</section>
	</main>
  <script src="<%=request.getContextPath()%>/assets/js/vendor/bootstrap.js"></script>

</body>
</html>