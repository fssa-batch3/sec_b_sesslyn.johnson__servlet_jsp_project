<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Design List</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/designer/design_list.css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<style>
.flex button{
  background-color: black;
  color: white;
  border:none;
  padding:0.2rem 2rem;
  margin: 0rem 0rem 0rem 1rem;
}
</style>
<body>
    <%
    String headerJSP = "/pages/profile/header.jsp";
    %>
    <jsp:include page="<%=headerJSP%>" />
    
    <%
    Set<DesignAssetRespondDTO> totalDesign = (Set<DesignAssetRespondDTO>)request.getAttribute("totalDesign");
    System.out.println(totalDesign);
    %>

    <%
    if (totalDesign == null || totalDesign.isEmpty()) {
    %>
    <div id="cart_empty">
        <img loading="lazy" src="https://iili.io/HgdHinR.jpg" class="emptyCart" alt="No design yet" />
        <p class="cartEmpty">You haven't added your design yet!</p>
    </div>

    <%
    } else {
    %>
    <div class="cardsNew">
    <%
        for (DesignAssetRespondDTO design : totalDesign) {
        	Design designId = design.getDesignId();
            String videoUrl = design.getAssetsId().getAssetsUrl();
    %>
        <!-- Embed each video -->
        <div class="cardNew" id="new1"> <!-- Use unique id -->
      <div class="card__image-holderNew">
        <div class="video-thumbnail">
          <iframe width="300" height="250" src="<%=videoUrl%>" frameborder="0"
          allow="autoplay; encrypted-media" allowfullscreen></iframe>
        </div>
      </div>
      <div class="card-titleNew">
      <a href="<%=request.getContextPath()%>/designer/design/details?id=<%=design.getId()%>">
        <h2><%=designId.getName()%></h2></a>
        <div class="flex">
        <small><%=designId.getLocation()%>
        <% if (!design.isActive()) {
            %>
            - Inactive
            <%
            }
            %>
        
        </small>
        <button class="play-button"
        onclick="showVideoPopup('<%=videoUrl%>')">Play</button></small>
      </div>
      </div>
    </div>
    <%
        }
    %>
    </div>
    
     <div class="video-popup-overlay" id="videoPopupOverlay">
    <div class="video-popup-container">
      <iframe width="700" height="500" id="videoFrame" frameborder="0" allowfullscreen></iframe>
      <button class="close_icon" onclick="closeVideoPopup()"><img src="https://iili.io/Hy19PWB.png" class="x_icon"
          alt="close icon" /></button>
    </div>
  </div>
    <%
    }
    %>
    <script>
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
