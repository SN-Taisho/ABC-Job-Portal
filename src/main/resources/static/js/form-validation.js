console.log("js connected");

//  ERROR MESSAGE TAG
const errorText = document.getElementById("error-text");

//  COLORS
const error = "#e32b2b";
const success = "#2cb67d";

// FIELD TAGS
const regForm = document.getElementById("registration");
const editProfile = document.getElementById("editProfileForm");
const fullname = document.getElementById("fullname");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");

// REGEX
var numberRegex = /\d/;
var alphanumericRegex = /^([a-z]*\d[a-z0-9]*|[a-z]+\d+[a-z0-9]*){50,}$/i;
var emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$/;


// FORM SUBMIT VALIDATION
function validateRegistration(event) {
    // STOP FORM FROM BEING SUBMITTED
    event.preventDefault();

    // FULLNAME
    if (fullname.value.length < 3) {
        fullname.style.borderColor = error;
        errorMessage = "You name cannot be shorter than 3 characters";
        showErrorPopup();
        fullname.focus();
        return false;
    } else if (numberRegex.test(fullname.value)) {
        fullname.style.borderColor = error;
        errorMessage = "Your name cannot contain a number";
        showErrorPopup();
        fullname.focus();
        return false;
    }
    // USERNAME
    else if (username.value.length < 3) {
        username.style.borderColor = error;
        errorMessage = "Usernmae cannot be shorter than 3 characters";
        showErrorPopup();
        username.focus();
        return false;
    }
    // EMAIL
    else if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
        errorMessage = "Please enter a valid email address";
        showErrorPopup();
        email.focus();
        return false;
    } 
    // PASSWORD
    else if (password.value.length < 5) {
        password.style.borderColor = error;
        errorMessage = "Please enter a password longer than 5 characters";
        showErrorPopup();
        password.focus();
        return false;
    }
    else if (!numberRegex.test(password.value)) {
        password.style.borderColor = error;
        errorMessage = "Please enter a password containing at least one number";
        showErrorPopup();
        password.focus();
        return false;
    }
    // FORM FULLY VALIDATED
    else {
        regForm.submit();
    }
}


/*----------  ON CHANGE VALIDATION  ----------*/

// FULLNAME
function validateFullname() {
        if (fullname.value.length < 3) {
            fullname.style.borderColor = error;
        } else if (numberRegex.test(fullname.value)) {
            fullname.style.borderColor = error;
        } else {
            fullname.style.borderColor = success;
        }
}


// USERNAME
function validateUsername() {
    if (username.value.length < 3) {
        username.style.borderColor = error;
    } else {
        username.style.borderColor = success;
    }
}
// EMAIL
function validateEmail() {
    if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
    } else {
        email.style.borderColor = success;
    }
}
// PASSWORD
function validatePassword() {
    if (password.value.length < 5) {
        password.style.borderColor = error;
    }
    else if (!numberRegex.test(password.value)) {
        password.style.borderColor = error;
    }
    else {
        password.style.borderColor = success
    }
}