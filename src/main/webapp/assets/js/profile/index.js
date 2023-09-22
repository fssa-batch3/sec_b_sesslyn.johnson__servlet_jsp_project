// Register extra div css change
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
        return false; // Passwords don't match, prevent form submission
    }
    return true; // Passwords match, allow form submission
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

  // Function to validate the name field
 /* function validateName() {
    var nameField = document.getElementById("user_name");
    var namePattern = /^[a-zA-Z]+$/;
    if (!namePattern.test(nameField.value)) {
      alert("Name should only contain alphabets.");
      nameField.focus();
      return false;
    }
    return true;
  }

  // Function to validate the email field
  function validateEmail() {
    var emailField = document.getElementById("user_email");
    var emailPattern = /^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(emailField.value)) {
      alert("Invalid email format.");
      emailField.focus();
      return false;
    }
    return true;
  }

  // Function to validate the phone number field
  function validatePhoneNumber() {
    var phoneNumberField = document.getElementById("user_no");
    var phoneNumberPattern = /^[6-9][0-9]{9}$/;
    if (!phoneNumberPattern.test(phoneNumberField.value)) {
      alert("Invalid phone number format.");
      phoneNumberField.focus();
      return false;
    }
    return true;
  }

  // Function to validate the password field
  function validatePassword() {
    var passwordField = document.getElementById("user_password");
    var passwordPattern = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/;
    if (!passwordPattern.test(passwordField.value)) {
      alert("Password must contain at least one number, one uppercase and lowercase letter, and be at least 8 characters long.");
      passwordField.focus();
      return false;
    }
    return true;
  }

  // Function to perform overall form validation
  function validateForm() {
    return (
      validateName() &&
      validateEmail() &&
      validatePhoneNumber() &&
      validatePassword() &&
      checkPassword()
    );
  }*/

