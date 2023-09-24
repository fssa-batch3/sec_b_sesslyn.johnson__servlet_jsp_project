<%@page import="in.fssa.minimal.util.StringUtil"%>
<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.model.Asset"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designer Profile</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/designer_details.css">
	  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/designer/design_list.css">
</head>
<style>
div.cardsNew {
	display: flex;
	flex-direction: row;
	text-align: center;
	margin-left: 18rem;
	flex-wrap: wrap;
	margin-bottom: 5rem;
}
.video-popup-container {
  position: absolute;
  top: 45%;
  left: 50%;
  margin:2rem;
  transform: translate(-50%, -50%);
  background: #fff;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
  padding: 20px;
  height: 540px;
  width: 750px;
  padding: 20px 15px 5px 22px;
}
#new1 {
	margin-left: 1rem;
}
.play-button{
  background-color: black;
  color: white;
  border:none;
  padding:0.2rem 2rem;
 margin: 0rem 0rem 0rem 7rem;
}
</style>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />


	<%
	User user = (User) request.getAttribute("userDetails");
	boolean designerId = false;
	if (user != null) {
		String role = user.getRole();
		designerId = "designer".equals(role);
	}
	System.out.println(user);
	%>

	<%
	User designer = (User) request.getAttribute("designerDetails");
	System.out.println(designer);

	if (designer != null) {
	%>
	<div class="card details-card p-0">
		<div class="card">
			<div class="containRow">
				<div class="col-md-6 col-sm-12">
					<%
					String image = designer.getImage();
					if (image != null) {
					%>
					<img src="<%=image%>" class="img-fluid details-img"
						alt="Image of Designers" />
					<%
					} else {
					%>
					<img class="img-fluid details-img"
						src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
						alt="Image of Designers" />
					<%
					}
					%>
				</div>
				<div class="col-md-6 col-sm-12 description-container p-5">
					<div class="main-description">
						<p class="product-category mb-0">Interior Designer</p>
						<h3><%=designer.getName()%></h3>
						<hr>
						<div class="info">
							<a href="designer_link">
								<p class="product-price">Experience :</p>
							</a>
							<p class="product-price"><%=designer.getExperience()%>
								months
							</p>
						</div>
						<hr>
						<p class="product-title mt-4 mb-1">About the Designer</p>
						<p class="product-description mb-4"><%=designer.getDesigner_description()%>
						</p>
						<hr>
						<div class="eduInfo">
							<h3 class="edutext">Grab the opportunity to make your home
								wonderful !</h3>
						</div>
						<div class="buttonInfo">
							<%
							if (user != null && !designerId) {
							%>
							<a
								href="<%=request.getContextPath()%>/pages/designer/calender.jsp?id=<%=designer.getId()%>"
								onclick="return true;">
								<button class="btnDelete" type="button">Book Now</button>
							</a>
							<%
							} else if (user == null && !designerId) {
							%>
							<button class="btnDelete" type="button"
								onclick="window.location.href='<%=request.getContextPath()%>/user/login';">Book
								Now</button>
							<%
							} else if (user != null && designerId) {
							%>
							<button class="btnDelete" type="button"
								onclick="alert('Designers cannot book appointments with other designers.');">Book
								Now</button>
							<%
							}
							%>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<p>Designer not found.</p>
	<%
	}
	%>
	<%
	Set<DesignAssetRespondDTO> designAssets = (Set<DesignAssetRespondDTO>) request.getAttribute("designAssetList");
	System.out.println(designAssets);
	if (designAssets != null) {
	%>
	<h2>Projects</h2>
	<div class="cardsNew">
		<%
		for (DesignAssetRespondDTO designAsset : designAssets) {
			Design design = designAsset.getDesignId();
			Asset asset = designAsset.getAssetsId();
			String videoUrl = designAsset.getAssetsId().getAssetsUrl();
		%>

		<div class="cardNew" id="new1">
			<div class="card__image-holderNew">
				<iframe width="300" height="280" src="<%=asset.getAssetsUrl()%>"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>

			<div class="card-titleNew">
				<a href="#" class="toggle-info btnNew"> <span class="left"></span>
					<span class="right"></span>
				</a>
				<h2>
					<%=design.getName()%>
					<small><%=design.getLocation()%></small>
				</h2>
				<button class="play-button"
					onclick="showVideoPopup('<%=videoUrl%>')">Play</button>
			</div>
			
			<div class="card-flap flap1">
				<div class="card-descriptionNew">
					<ul>
						<li>Customer Name: <%=(design != null) ? StringUtil.extractValue("Customer Name", design.getDescription()) : ""%></li>
						<li>Property Name: <%=(design != null) ? StringUtil.extractValue("Property Name", design.getDescription()) : ""%></li>
						<li>Apartment Size: <%=(design != null) ? StringUtil.extractValue("Apartment Size", design.getDescription()) : ""%></li>
						<li>Project Value: <%=(design != null) ? StringUtil.extractValue("Project Value", design.getDescription()) : ""%></li>
						<li>Designer: <%=(design != null && designer != null) ? designer.getName() : ""%></li>
					</ul>
					<p><%=(design != null) ? StringUtil.extractValue("Design Description", design.getDescription()) : ""%></p>
				</div>
				<div class="card-flap flap2"></div>
			</div>
		</div>
		<%
		}
		%>

	</div>
	<%
	}
	%>
	<div class="video-popup-overlay" id="videoPopupOverlay">
				<div class="video-popup-container" >
					<iframe width="700" height="500" id="videoFrame" frameborder="0"
						allowfullscreen></iframe>
					<button class="close_icon" onclick="closeVideoPopup()">
						<img src="https://iili.io/Hy19PWB.png" class="x_icon"
							alt="close icon" />
					</button>
				</div>
			</div>
	<script>
    function confirmBooking(e) {
        if (confirm("Please login to book an appointment.")) {
            window.location.href = '<%=request.getContextPath()%>/user/login';
			} else {
				return false;
			}
		}
    
    document.addEventListener("DOMContentLoaded", function () {
        const toggleButtons = document.querySelectorAll(".toggle-info");

        toggleButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                event.preventDefault();

                const cardFlap = this.closest(".cardNew").querySelector(".card-flap.flap1");
                cardFlap.classList.toggle("show");
            });
        });
    });
    
    // Function to show the video popup
    function showVideoPopup(videoUrl) {
      var videoFrame = document.getElementById('videoFrame');
      videoFrame.src = videoUrl;

      var videoPopupOverlay = document.getElementById('videoPopupOverlay');
      videoPopupOverlay.style.display = 'block';
    }

    // Function to close the video popup
    function closeVideoPopup() {
      var videoFrame = document.getElementById('videoFrame');
      videoFrame.src = '';

      var videoPopupOverlay = document.getElementById('videoPopupOverlay');
      videoPopupOverlay.style.display = 'none';
    }
  
	</script>

</body>
</html>