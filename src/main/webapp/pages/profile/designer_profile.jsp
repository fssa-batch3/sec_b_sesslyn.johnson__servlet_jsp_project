<%@page import="java.util.HashSet"%>
<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designer Profile</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

</head>
<style>
@charset "ISO-8859-1";

@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap")
	;

body {
	width: 100%;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	min-height: 100vh;
	font-family: "Poppins", sans-serif;
}

#designer {
	display: none;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
}

a {
	text-decoration: none;
}

.header__wrapper header {
	width: 100%;
	background:
		url("<%=request.getContextPath()%>/assets/images/home_page/bg.jpeg")
		no-repeat 50% 20%/cover;
	min-height: calc(100px + 15vw);
}

.header__wrapper .cols__container .left__col {
	padding: 25px 20px;
	text-align: center;
	max-width: 350px;
	position: relative;
	margin: 0 auto;
}

.header__wrapper .cols__container .left__col .img__container {
	position: absolute;
	top: -60px;
	left: 50%;
	transform: translatex(-50%);
}

.header__wrapper .cols__container .left__col .img__container img {
	width: 120px;
	height: 120px;
	object-fit: cover;
	border-radius: 50%;
	display: block;
	box-shadow: 1px 3px 12px rgba(0, 0, 0, 0.18);
}

.header__wrapper .cols__container .left__col .img__container span {
	position: absolute;
	background: #2afa6a;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	bottom: 3px;
	right: 11px;
	border: 2px solid #fff;
}

.header__wrapper .cols__container .left__col h2 {
	margin-top: 60px;
	font-weight: 600;
	font-size: 22px;
	margin-bottom: 5px;
}

.header__wrapper .cols__container .left__col p {
	font-size: 0.9rem;
	color: #818181;
	margin: 0;
}

.header__wrapper .cols__container .left__col .about {
	justify-content: space-between;
	position: relative;
	margin: 35px 0;
}

.header__wrapper .cols__container .left__col .about li {
	display: flex;
	flex-direction: column;
	color: #818181;
	font-size: 0.9rem;
}

.header__wrapper .cols__container .left__col .about li span {
	color: #1d1d1d;
	font-weight: 600;
}

.header__wrapper .cols__container .left__col .about:after {
	position: absolute;
	content: "";
	bottom: -16px;
	display: block;
	background: #cccccc;
	height: 1px;
	width: 100%;
}

.header__wrapper .cols__container .content p {
	font-size: 1rem;
	color: #1d1d1d;
	line-height: 1.8em;
}

.header__wrapper .cols__container .content ul {
	gap: 30px;
	justify-content: center;
	align-items: center;
	margin-top: 25px;
}

.header__wrapper .cols__container .content ul li {
	display: flex;
}

.header__wrapper .cols__container .content ul i {
	font-size: 1.3rem;
}

.header__wrapper .cols__container .right__col nav {
	display: flex;
	align-items: center;
	padding: 30px 0;
	justify-content: space-between;
	flex-direction: column;
}

.header__wrapper .cols__container .right__col nav ul {
	display: flex;
	gap: 20px;
	flex-direction: column;
}

.header__wrapper .cols__container .right__col nav ul li a {
	text-transform: uppercase;
	color: #818181;
}

.header__wrapper .cols__container .right__col nav ul li:nth-child(1) a {
	color: #1d1d1d;
	font-weight: 600;
}

.header__wrapper .cols__container .right__col nav button {
	background: #0091ff;
	color: #fff;
	border: none;
	padding: 10px 25px;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 20px;
}

.header__wrapper .cols__container .right__col nav button:hover {
	opacity: 0.8;
}

.header__wrapper .cols__container .right__col .photos {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(190px, 1fr));
	gap: 20px;
}

/* Responsiveness */
@media ( min-width : 868px) {
	.header__wrapper .cols__container {
		max-width: 1200px;
		margin: 0 auto;
		width: 90%;
		justify-content: space-between;
		display: grid;
		grid-template-columns: 1fr 2fr;
		gap: 50px;
	}
	.header__wrapper .cols__container .left__col {
		padding: 25px 0px;
	}
	.header__wrapper .cols__container .right__col nav ul {
		flex-direction: row;
		gap: 30px;
	}
	.header__wrapper .cols__container .right__col .photos {
		margin-left: 1rem;
		padding: 0 0 30px;
		display: inline;
	}
}

@media ( min-width : 1017px) {
	.header__wrapper .cols__container .left__col {
		margin: 0;
		margin-right: auto;
	}
	.header__wrapper .cols__container .right__col nav {
		flex-direction: row;
	}
	.header__wrapper .cols__container .right__col nav button {
		margin-top: 0;
	}
}

.gallery {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	padding-left: 12px;
	width: 810px;
}

header__wrapper .cols__container .right__col .photos img {
	max-width: 100%;
	display: inline;
	object-fit: none;
}

.header__wrapper .cols__container .right__col .photos {
	margin-left: 1rem;
	padding: 0 0 30px;
	display: inline;
}

.gallery img {
	width: 250px;
	height: 200px;
}

.photo {
	height: 200px;
	width: 250px;
}
/* helpers/alignment.css */
.flex {
	display: flex;
	flex-direction: row;
}

.align {
	position: relative;
	--size-button: 40px;
	color: white;
	position: relative;
	--size-button: 40px;
	color: white;
	margin-left: 10rem;
	margin-top: 1rem;
}

.input-container {
	display: flex;
	align-items: center;
	width: var(--size-button); /* Set a fixed width for the container */
}

.input {
	padding-left: var(--size-button);
	height: var(--size-button);
	font-size: 15px;
	border: none;
	color: #000;
	outline: none;
	width: var(--size-button);
	transition: all ease 0.3s;
	background-color: #fff;
	box-shadow: 1.5px 1.5px 3px #0e0e0e, -1.5px -1.5px 3px
		rgb(95 94 94/ 25%), inset 0px 0px 0px #0e0e0e, inset 0px 0px 0px
		#5f5e5e;
	border-radius: 50px;
	cursor: pointer;
}

.input:focus, .input:not(:invalid) {
	width: 200px;
	cursor: text;
	padding-left: calc(var(--size-button)* 1.5); /* Adjust padding */
	box-shadow: 0px 0px 0px #0e0e0e, 0px 0px 0px rgb(95 94 94/ 25%), inset
		1.5px 1.5px 3px #0e0e0e, inset -1.5px -1.5px 3px #5f5e5e;
}

.input:focus+.icon, .input:not(:invalid)+.icon {
	pointer-events: all;
	cursor: pointer;
}

.icon {
	position: absolute;
	width: var(--size-button);
	height: var(--size-button);
	top: 0;
	left: 0;
	padding: 8px;
	pointer-events: none;
}

.search {
	height: 25px;
	position: absolute;
	top: 40%;
	left: calc(100% - 40px);
	transform: translateY(-50%);
	cursor: pointer;
}

button {
	background-color: white;
	text-transform: uppercase;
	font-size: 10px;
	border: none;
	color: #893a3f;
	float: right;
	margin: 0rem 0rem 0rem 13rem;
}

#edit_icon {
	width: 1.2rem;
	height: 1rem;
	padding-right: 0.5rem;
}
</style>
<body>
	<%
	String errorMsg = (String) request.getAttribute("error");
	%>
	<%
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div id="popup1" class="overlay">
		<div class="popup">
			<h2>Alert !</h2>
			<a class="close" href="#">&times;</a>
			<div class="content">
				<%=errorMsg%>
			</div>
			<button id="alert" onclick="closeAlert()" type="button">Ok</button>
		</div>
	</div>
	<%
	}
	%>

	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	User user = (User) request.getAttribute("userDetails");
	System.out.println(user);
	%>
	<div class="header__wrapper">
		<header></header>
		<div class="cols__container">
			<div class="left__col">
				<div class="img__container">
					<%
					String image = user.getImage();
					%>
					<%
					if (image != null && !image.trim().isEmpty()) {
					%>
					<img src="<%=user.getImage()%>" 
						class="user_profile" alt="Profile Image" />
					<%
					} else {
					%>
					<img
						src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
						alt="Profile Image" />
					<%
					}
					%>

					<span class="tooltip"> <a
						href="<%=request.getContextPath()%>/user/edit"> <img
							src="https://iili.io/JHo3RHP.png" id="edit_icon" alt="edit icon"></a>
						<p class="tooltiptext">Edit</p>
					</span>
				</div>

				<h2><%=user.getName()%></h2>
				<p><%=user.getPhoneNumber()%></p>
				<p><%=user.getEmail()%></p>

				<ul class="about">
					<li><span><%=user.getExperience()%></span>Experience</li>
					<li><span>322</span>Following</li>
					<li><span>200,543</span>Attraction</li>
				</ul>

				<div class="content">
					<p>
						<%=user.getDesigner_description()%>
					</p>
					<p id="designer"><%=user.getId()%></p>
				</div>
			</div>
			<div class="right__col">
				<div class="flex">
					<nav>
						<ul>
							<li><a href="#" id="photosLink">Photos</a></li>
							<li><a href="#" id="galleryLink">Gallery</a></li>
							<li><a href="">groups</a></li>
							<li><a href="">about</a></li>
						</ul>
					</nav>

					<div class="align">
						<form class="flex" id="uploadForm">
							<div class="input-container">
								<input type="url" name="text" class="input" id="imageUrlInput"
									required placeholder="Image Url">
								<div class="icon">
									<img
										src="<%=request.getContextPath()%>/assets/images/home_page/search_icon.png"
										class="search" />
								</div>
							</div>
							<input type="hidden" name="text" class="input" id="designerId"
								required="" value="<%=user.getId()%>">
							<button type="submit" id="uploadButton">Upload</button>
						</form>
					</div>
				</div>
				<div class="gallery" id="photosSection">
					<%
					Set<DesignAssetRespondDTO> totalDesign = (Set<DesignAssetRespondDTO>) request.getAttribute("totalDesign");
					System.out.println(totalDesign);
					if (totalDesign == null || totalDesign.isEmpty()) {
						totalDesign = new HashSet<>(); // Initialize it to an empty set.
					}

					int imagesToDisplay = Math.min(totalDesign.size(), 6);

					for (DesignAssetRespondDTO design : totalDesign) {
						Design designId = design.getDesignId();
						String videoUrl = design.getAssetsId().getAssetsUrl();
					%>
					<div class="photos">
						<iframe width="250" height="200" src="<%=videoUrl%>"
							frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
					<%
					}
					%>
					<%
					for (int i = 0; i < 6 - imagesToDisplay; i++) {
					%>
					<div class="photos">
						<img
							src="<%=request.getContextPath()%>/assets/images/home_page/img_<%=i + 1%>.avif"
							calss="photo" alt="Photo" />
					</div>
					<%
					}
					%>
				</div>
				<div class="gallery" id="gallerySection">
					<!-- This is the Gallery section -->
				</div>
			</div>
		</div>
	</div>
	<script>
		// Function to show the Photos section
		function showPhotosSection() {
		    document.getElementById("photosSection").style.display = "block";
		    document.getElementById("gallerySection").style.display = "none";
		}

		// Function to show the Gallery section
		function showGallerySection() {
		    document.getElementById("photosSection").style.display = "none";
		    document.getElementById("gallerySection").style.display = "block";
		}

		// Event listeners for the links
		document.getElementById("photosLink").addEventListener("click", showPhotosSection);
		document.getElementById("galleryLink").addEventListener("click", showGallerySection);

		// Initial display (you can choose one to be initially displayed)
		showPhotosSection();

		// Your JavaScript code here...
		document.addEventListener("DOMContentLoaded", function () {
    var userId = document.getElementById("designer").textContent; // Use textContent to get the value
    var imageDesigner = JSON.parse(localStorage.getItem("image_designer")) || [];
    var filteredData = imageDesigner.filter(function (item) {
        return item.designerId === userId;
    });

    var gallery = document.getElementById("gallerySection"); // Get the gallery container

    for (var i = 0; i < 6; i++) {
        var photoContainer = document.createElement("div");
        photoContainer.classList.add("photos");
        var imgElement = document.createElement("img");
        imgElement.classList.add("photo");

        if (i < filteredData.length) {
            imgElement.src = filteredData[i].imageUrl;
            imgElement.alt = "Photo";
        } else {
        	  imgElement.src = "<%=request.getContextPath()%>/assets/images/home_page/img_" + (i + 1) + ".avif";
              imgElement.alt = "Random Photo";
		}

								photoContainer.appendChild(imgElement);
								gallery.appendChild(photoContainer);

								// Prevent the default link behavior when clicking the div
								photoContainer.addEventListener("click",
										function(event) {
											event.preventDefault();
											// Add your custom click behavior here if needed
										});
							}
						});

		document.addEventListener("DOMContentLoaded", function() {
			var uploadForm = document.getElementById("uploadForm");
			var designerId = document.getElementById("designerId").value;
			var imageUrlInput = document.getElementById("imageUrlInput");
			var uploadButton = document.getElementById("uploadButton");

			uploadForm.addEventListener("submit", function(e) {
				e.preventDefault();
				var imageUrl = imageUrlInput.value;
				if (imageUrl) {
					var imageDesigner = JSON.parse(localStorage
							.getItem("image_designer"))
							|| [];
					imageDesigner.push({
						designerId : designerId,
						imageUrl : imageUrl,
						is_active : true,
					});

					localStorage.setItem("image_designer", JSON
							.stringify(imageDesigner));

					alert("Image has been stored successfully.");
					location.reload();
					imageUrlInput.value = "";
				} else {
					alert("Please enter an Image URL.");
				}
			});
		});
	</script>
</body>
</html>