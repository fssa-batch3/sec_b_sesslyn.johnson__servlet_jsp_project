function register() {
	  document.getElementById("right_corner").style.display = "block";
	  const x = document.getElementById("right_corner");
	  x.classList.remove("hide");
	  x.classList.add("block");
	  const y = document.getElementById("main_page");
	  y.style.width = "70%";
	  const j = document.getElementById("left-div");
	  j.style.width = "50%";
	  const z = document.getElementById("left-div-img");
	  z.style.width = "22rem";
	  z.style.height = "22rem";
	  z.style.margin = "8rem 2rem 1rem 5rem";
	  const s = document.getElementById("left-div-para");
	  s.style.margin = "1rem 5rem 1rem 5rem";
	  const k = document.getElementById("media-div");
	  k.style.margin = "3rem 3rem 3rem 5rem";
	  const ele = document.getElementById("media-span");
	  ele.style.padding = "0rem";
	  const ele2 = document.getElementById("media-span2");
	  ele2.style.padding = "0rem";
	  const hr = document.getElementById("new");
	  hr.style.marginTop = "-0.3rem";
	  const img = document.getElementById("rightImg");
	  img.style.width = "35.5rem";
	}

	function checkPassword() {
	  let user_password = document.getElementById("user_password").value;
	  let confirm_password = document.getElementById("confirm_password").value;
	  if (user_password !== confirm_password) {
	    alert("Password doesn't match. Please re-enter the password");
	    document.getElementById("confirm_password").value = "";
	  }
	}

	function closeAlert() {
	  var alertDiv = document.getElementById("popup1");
	  alertDiv.style.display = "none";
	}

	const passwordInput1 = document.getElementById('user_password');
	const togglePasswordButton1 = document.getElementById('togglePassword1'); 
	const eyeIcon1 = document.getElementById('togglePassword1'); 

	const passwordInput2 = document.getElementById('confirm_password');
	const togglePasswordButton2 = document.getElementById('togglePassword2'); 
	const eyeIcon2 = document.getElementById('togglePassword2'); 

	togglePasswordButton1.addEventListener('click', () => {
	    togglePasswordVisibility(passwordInput1, eyeIcon1);
	});

	togglePasswordButton2.addEventListener('click', () => {
	    togglePasswordVisibility(passwordInput2, eyeIcon2);
	});

	function togglePasswordVisibility(inputField, eyeIcon) {
	    const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
	    inputField.setAttribute('type', type);
	    eyeIcon.classList.toggle('fa-eye');
	    eyeIcon.classList.toggle('fa-eye-slash');
	}

	function showPopup() {
	    var popup = document.getElementById("popup");
	    var overlay = document.getElementById("overlay");
	    popup.style.display = "block";
	    overlay.style.display = "block";
	  }

	  function hidePopup() {
	    var popup = document.getElementById("popup");
	    var overlay = document.getElementById("overlay");
	    popup.style.display = "none";
	    overlay.style.display = "none";
	  }

	  // Inside your JavaScript code
	  var radioButtons = document.querySelectorAll('input[name="toggle"]');
	  var sellerFields = document.getElementById("sellerFields");
	  var designerFields = document.getElementById("designerFields");
	  var designDescriptionField = document.getElementById("designDescription");

	  radioButtons.forEach(function (radio) {
	    radio.addEventListener('change', function () {
	      if (radio.value === "false") {
	    	  showPopup();
	        sellerFields.style.display = "block";
	        designerFields.style.display = "none";
	        designDescriptionField.style.display = "none"; // Hide design description for sellers
	      } else if (radio.value === "true") {
	    	  showPopup();
	        sellerFields.style.display = "none";
	        designerFields.style.display = "block";
	        designDescriptionField.style.display = "block"; // Show design description for designers
	      } else {
	        sellerFields.style.display = "none";
	        designerFields.style.display = "none";
	        designDescriptionField.style.display = "none";
	      }
	    });
	  });

	  document.getElementById("popupClose").addEventListener('click', hidePopup);
	  document.getElementById("popupSubmit").addEventListener('click', function () {
	    hidePopup();
	  });
	  
	  document.getElementById("aadharNumber").addEventListener("input", function () {
		    var aadharInput = this.value;
		    
		    // Check if all 12 digits are the same
		    if (/^(\d)\1{11}$/.test(aadharInput)) {
		        this.setCustomValidity("Aadhar Number cannot have all 12 digits the same.");
		    } else {
		        this.setCustomValidity(""); // Clear custom validity message
		    }
		});