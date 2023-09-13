function login(e) {
    e.preventDefault();
    const user_password = document.getElementById("user_password").value;
    const user_email = document.getElementById("user_email").value;
    const user_crud = JSON.parse(localStorage.getItem("user_crud")) || [];

    const exist =
        user_crud.length &&
        JSON.parse(localStorage.getItem("user_crud")).some(
            (data) =>
                data.user_password == user_password &&
                data.user_email == user_email
        );

    if (!exist) {
        alert("Incorrect login credentials");
        document.querySelector("form").reset();
    } else {
        localStorage.setItem("profile_id", JSON.stringify(user_email));
        alert("Your login in successful");
        window.location.href = "./homepage.html";
    }
}



const passwordInput1 = document.getElementById('user_password');
const togglePasswordButton1 = document.getElementById('togglePassword1'); 
const eyeIcon1 = document.getElementById('togglePassword1'); 


togglePasswordButton1.addEventListener('click', () => {
togglePasswordVisibility(passwordInput1, eyeIcon1);
});

function togglePasswordVisibility(inputField, eyeIcon) {
const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
inputField.setAttribute('type', type);
eyeIcon.classList.toggle('fa-eye');
eyeIcon.classList.toggle('fa-eye-slash');
}
