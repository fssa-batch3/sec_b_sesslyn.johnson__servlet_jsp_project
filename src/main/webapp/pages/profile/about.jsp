<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Queries</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/about.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/normalize.css">
    <link rel="dns-prefetch" href="//fonts.googleapis.com" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans&family=Red+Hat+Text:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet" />
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&amp;family=Righteous&amp;display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.4/ScrollTrigger.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/ScrollTrigger.min.js"></script>


</head>

<body>
	<%
	String headerJSP =  "/pages/profile/header_after_login.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />
   <!-- Banner Start -->
<section class="banner overflow-hidden">
    <div class="container">
      <div class="banner-box">
        <h1 id="headingBig">D</h1>
        <div class="banner-text">
          <h2 id="headingSmall">Design a Space <br> You Love.</h2>
          <h3 id="headingText">Let’s bring your creative <br> immagination to reality.</h3>
        </div>
        <div class="row gx-0">
          <div class="col-md-6 col-xxl-7 ms-auto">
            <div class="banner-img" id="bannerBigimg">
              <img src="https://www.home-designing.com/wp-content/uploads/2020/08/dark-decor-living-room.jpg" class="img-fluid" alt="Image">
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Banner End -->
  
  <!-- Company Start -->
  <section class="company-section white-bg position-relative overflow-hidden">
    <h2 class="title text-center">company</h2>
    <div class="container">
      <div class="row align-items-stretch">
        <div class="col-md-6 align-self-center pb-4 pb-md-5 pb-lg-0">
          <div class="py-lg-5" id="compDescription">
            <div class="pb-md-3 paragraph">
              <p>At Minimalistic, we bring together functionality and aesthetics to provide homeowners with customised and efficient home designs. Our designers specialise in home interior designs and home décor, and help you create a personalized home to suit your lifestyle. </p>
              <p>From sophisticated living room designs to space-saving and clutter-free interior designs, we are here to help you find the best home decor and home design to match your needs and style. All our products come with up to 10-year warranty along with unwavering support and maintenance services. Explore thousands of inspiring interior designs or get a free estimate – it's all here on HomeLane.com, your one stop for complete home interiors.</p>
            </p>
            </div>
            <a href="javascript:void(0)" class="common-btn">read more <img src="https://www.yudiz.com/codepen/interior-design/arrow-right.svg" class="img-fluid" alt="Arrow"></a>
          </div>
        </div>
        <!-- col -->
        <div class="col-md-6">
          <div class="compy-box mt-4 my-md-0 position-relative">
            <img src="https://www.yudiz.com/codepen/interior-design/company-bg.png" class="img-fluid" alt="Company">
          </div>
        </div>
        <!-- col -->
      </div>
      <!-- row -->
    </div>
  </section>
  <!-- Company End -->
  
  <!-- Designer Start -->
  <section class="designer-section black-bg theme-dark position-relative">
    <h2 class="title text-center">Designers</h2>
    <div class="container">
      <div class="row gx-4 align-items-stretch">
        <div class="col-md-6">
          <div class="designer-box position-relative">
            <div class="team-member team1">
              <img src="https://www.yudiz.com/codepen/interior-design/team-1.jpg" class="img-fluid" alt="Team Member">
            </div>
            <div class="team-member team2">
              <img src="https://www.yudiz.com/codepen/interior-design/team-2.jpg" class="img-fluid" alt="Team Member">
            </div>
            <div class="team-member team3">
              <img src="https://www.yudiz.com/codepen/interior-design/team-3.jpg" class="img-fluid" alt="Team Member">
            </div>
            <div class="box-border"></div>
          </div>
        </div>
        <!-- col -->
        <div class="col-md-6 align-self-center">
          <div class="py-4 py-lg-5" id="designDescription">
            <div class="pb-3 paragraph">
              <p>Chartered by the Board of Regents of the University of the State of TX in 1920, SID is authorized by the Board of Regents to confer the Basic Interior Design certificate (on-site and online), the degrees of Associate in Applied Science in Interior Design (on-site and online), Bachelor of Fine Arts in Interior Design, Master of Fine Arts in Interior Design, Master of Professional Studies in Lighting Design, and Master of Professional Studies in Sustainable Interior Environments.</p>
            </div>
            <a href="javascript:void(0)" class="common-btn">read more <img src="https://www.yudiz.com/codepen/interior-design/arrow-right.svg" class="img-fluid" alt="Arrow"></a>
          </div>
        </div>
        <!-- col -->
      </div>
      <!-- row -->
    </div>
  </section>
  <!-- Designer End -->
  
  <!-- Projects Start -->
  <section class="projects-section white-bg position-relative overflow-hidden">
    <h2 class="title text-center">Projects</h2>
    <div class="container">
      <div class="row align-items-stretch overflow-hidden gy-1 gy-md-0 gx-1 gx-md-3 gx-lg-4">
        <div class="col-md-9">
          <div class="row g-1 g-md-3 g-lg-4 overflow-hidden">
            <div class="col-8">
              <div class="project-box pbox-left">
                <img src="https://www.yudiz.com/codepen/interior-design/project-01.jpg" class="img-fluid" alt="Project">
              </div>
            </div>
            <div class="col-4">
              <div class="project-box pbox-right">
                <img src="https://www.yudiz.com/codepen/interior-design/project-02.jpg" class="img-fluid" alt="Project">
              </div>
            </div>
            <div class="col-4">
              <div class="project-box pbox-left">
                <img src="https://www.yudiz.com/codepen/interior-design/project-03.jpg" class="img-fluid" alt="Project">
              </div>
            </div>
            <div class="col-8 overflow-hidden">
              <div class="project-box project-content">
                <img src="https://www.yudiz.com/codepen/interior-design/project-bg.jpg" class="img-fluid bg-img" alt="Project">
                <div class="row align-items-center h-100">
                  <div class="col-10 col-md-8 col-xxl-7 ms-auto">
                    <p>We celebrated our 1st anniversary with series of events and initiatives that paid tribute to our rich history, our role in the development of the field, and the great opportunities for the future. But we're only just beginning. SID's future is exciting, and we're looking forward to the next 100 years.</p>
                    <a href="javascript:void(0)" class="common-btn ms-auto d-table"><img src="https://www.yudiz.com/codepen/interior-design/arrow-right.svg" class="img-fluid" alt="Arrow"></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="project-box big pbox-right">
            <img src="https://www.yudiz.com/codepen/interior-design/project-04.jpg" class="img-fluid" alt="Project">
          </div>
        </div>
      </div>
      <!-- row -->
    </div>
  </section>
  <!-- Projects End -->
  
  <!-- Testimonials Start -->
  <section class="testimonial-section white-bg position-relative overflow-hidden">
    <h2 class="title text-center">Testimonials</h2>
    <div class="container">
      <div class="row g-0 left-row">
        <div class="col-md-6">
          <div class="content border-end-0">
            <h3>Albert Hadley</h3>
            <p>"The essence of interior design will always be about people and how they live. It is about the realities of what makes for an attractive, civilized, meaningful environment, not about fashion or what’s in or what’s out. This is not an easy job."</p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="img-box">
            <img src="https://www.premiermagazine.biz/wp-content/uploads/2021/04/Samantha-Bartlett_200.jpg" class="img-fluid" alt="person">
          </div>
        </div>
      </div>
      <!-- row -->
      <div class="row g-0 reverse-row right-row">
        <div class="col-md-6">
          <div class="img-box">
            <img src="https://www.scad.edu/sites/default/files/styles/swarm1x1_370/public/Events/SCADstyle/2017/SCADstyle-2017-guest-Ryan-Korban-2.jpg?itok=afX9X_Ht&timestamp=1489592160" class="img-fluid" alt="person">
          </div>
        </div>
        <div class="col-md-6">
          <div class="content border-start-0">
            <h3>Jean-Louis Deniot</h3>
            <p>"Luxury is when it seems flawless, when you reach the right balance between all elements. Understated theatricality – that is what my luxury is all about."</p>
          </div>
        </div>
      </div>
      <!-- row -->
    </div>
  </section>
  <!-- Testimonials End -->
  
  <!-- Contact Start -->
  <section class="contact-us position-relative overflow-hidden">
    <div class="container">
      <div class="row">
        <div class="col-md-5">
          <h4>Minimalistic</h4>
          <ul class="nav flex-column">
            <li class="nav-item">
              <img src="https://www.yudiz.com/codepen/interior-design/location.svg" class="img-fluid" alt="Location">
              <a class="nav-link pe-none" href="javascript:void(0)">
                633 OMR road,
                Chennai,
                TN 600096
              </a>
            </li>
            <li class="nav-item">
              <img src="https://www.yudiz.com/codepen/interior-design/email.svg" class="img-fluid" alt="Email">
              <a class="nav-link" href="mailto:info@design.com">sesslyn2004@gmail.com</a>
            </li>
            <li class="nav-item">
              <img src="https://www.yudiz.com/codepen/interior-design/call.svg" class="img-fluid" alt="Call">
              <a class="nav-link" href="tel:2150021500">9952393445</a>
            </li>
          </ul>
        </div>
        <div class="col-md-7">
          <div class="contact-info">
            <div class="contact-box"></div>
            <div class="contact-border"></div>
            <h3>Follow Us !</h3>
            <p>Thank You for visiting us. Grab a opportunity to meet a designer.</p>
            <a href="https://www.instagram.com/" class="common-btn">Follow <img src="https://www.yudiz.com/codepen/interior-design/arrow-right.svg" class="img-fluid" alt="Arrow"></a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Contact End -->
   <script src="<%=request.getContextPath()%>/assets/js/profile/about.js"></script>

</body>

</html>