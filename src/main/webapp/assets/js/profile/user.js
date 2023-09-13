//Class Validation
class User {
   name
   email
   password
   phoneNumber

   validateName(name) {
      const pattern = new RegExp(/^[a-zA-Z]+$/)
      return pattern.test(name)
   }

   validateEmail(email) {
      const pattern = new RegExp(/^[a-zA-Z0-9]+([a-zA-Z0-9_+\-.]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$/)
      return pattern.test(email)
   }

   validatePassword(password) {
      const pattern = new RegExp(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/)
      return pattern.test(password)
   }

   validatePhoneNumber(phoneNumber) {
      const pattern = /^[6-9]\d{9}$/;
      return pattern.test(phoneNumber);
   }

}

const _name = "sesslyn"

const user = new User();
if (user.validateName(_name)) {
   console.log("Name is matched")
}
else {
   console.log("Name is not matched")
}


