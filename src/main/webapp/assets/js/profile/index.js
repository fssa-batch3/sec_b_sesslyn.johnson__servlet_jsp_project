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

//Register function
function signUp(e) {
  e.preventDefault();
  const user_name = document.getElementById("user_name").value.trim().split(/\s+/g).join(" ");
  const user_email = document.getElementById("user_email").value;
  const user_password = document.getElementById("user_password").value;
  const confirm_password = document.getElementById("confirm_password").value;
  const is_designer = document.getElementById("inbox").checked;
  const user_no = document.getElementById("user_no").value;
  const user_uuid = uuidv4();
  const user_dob = "";
  const user_address = "";
  const user_gender = "";
  const user_city = "";
  const user_state = "";
  const user_country = "";
  const user_about = "";
  const user_image = "";

  //Check Password
  function checkPassword() {
    if (user_password !== confirm_password) {
      alert("Re-enter the Password");
      confirm_password.value = reset();
    } else {
      alert("Register Successfully ");
    }
  }
  checkPassword();
  const user_crud = JSON.parse(localStorage.getItem("user_crud")) || [];

  const exist =
    user_crud.length &&
    JSON.parse(localStorage.getItem("user_crud")).some(
      (data) => data.user_email.toLowerCase() == user_email.toLowerCase()
    );

//Phone Number
function check_phonenumber() {
  let result = 0;
  for (const digit of user_no) {
      if (user_no[0] == digit) {
          result += 1;
      } else {
          break;
      }
  }
  if (result == 10) {
      alert("Enter your number properly");
      user_no.value = reset();
  }
}check_phonenumber();
  if (!exist) {
    user_crud.push({
      user_name,
      user_email,
      user_image,
      user_password,
      confirm_password,
      is_designer,
      user_dob,
      user_no,
      user_gender,
      user_city,
      user_address,
      user_state,
      user_country,
      user_about,
      user_uuid,
    });

    localStorage.setItem("user_crud", JSON.stringify(user_crud));

    console.log(localStorage.getItem("user_crud"));

    document.querySelector("form").reset();
    document.getElementById("user_email").focus();
    location.href = "./login.html";
  } else {
    alert("Sorry the User already Exist!! \n Try with different E-mail");
    document.querySelector("form").reset();
  }
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

