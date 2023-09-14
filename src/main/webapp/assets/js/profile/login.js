
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

function closeAlert() {
			var alertDiv = document.getElementById("popup1");
			alertDiv.style.display = "none";
		}