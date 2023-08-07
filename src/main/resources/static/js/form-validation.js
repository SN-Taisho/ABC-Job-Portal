
// ERROR MESSAGE TAG
const errorText = document.getElementById("error-text");

// COLORS
const error = "#e32b2b";
const success = "#2cb67d";
const bgDark = "#16161a";

// FIELD TAGS
const regForm = document.getElementById("registrationForm");
const emailForm = document.getElementById("emailForm");
// const codeForm = document.getElementById("codeForm");

const fullname = document.getElementById("fullname");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");

// const code = document.getElementById("code");

// REGEX
var numberRegex = /\d/;
var alphanumericRegex = /^([a-z]*\d[a-z0-9]*|[a-z]+\d+[a-z0-9]*){50,}$/i;
var emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$/;


/*----------  ON SUBMIT VALIDATION  ----------*/

// VALIDATE REGISTRATION FORM ON SUBMIT
function validateRegistration(event) {
    // STOP FORM FROM BEING SUBMITTED
    event.preventDefault();

    // FULLNAME
    if (fullname.value.length < 3) {
        fullname.style.borderColor = error;
        errorText.innerText = "You name cannot be shorter than 3 characters";
        fullname.focus();
        return false;
    } else if (numberRegex.test(fullname.value)) {
        fullname.style.borderColor = error;
        errorText.innerText = "Your name cannot contain a number";
        fullname.focus();
        return false;
    }
    // USERNAME
    else if (username.value.length < 3) {
        username.style.borderColor = error;
        errorText.innerText = "Usernmae cannot be shorter than 3 characters";
        username.focus();
        return false;
    }
    // EMAIL
    else if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
        errorText.innerText = "Please enter a valid email address";
        email.focus();
        return false;
    } 
    // PASSWORD
    else if (password.value.length < 5) {
        password.style.borderColor = error;
        errorText.innerText = "Please enter a password longer than 5 characters";
        password.focus();
        return false;
    }
    else if (!numberRegex.test(password.value)) {
        password.style.borderColor = error;
        errorText.innerText = "Please enter a password containing at least one number";
        password.focus();
        return false;
    }
    // FORM FULLY VALIDATED
    else {
        regForm.submit();
    }
}

// VALIDATE EMAIL ON SUBMIT
function validateEmailForm(event) {
	
	event.preventDefault();

	// EMAIL
	if (!emailRegex.test(email.value)) {
	    email.style.borderColor = error;
	    errorText.innerText = "Please enter a valid email address";
	    email.focus();
	    return false;
	} 
	// FORM FULLY VALIDATED
	else {
	    emailForm.submit();
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
    	errorText.innerText = "";
        fullname.style.borderColor = success;
    }
}
// USERNAME
function validateUsername() {
    if (username.value.length < 3) {
        username.style.borderColor = error;
    } else {
    	errorText.innerText = "";
        username.style.borderColor = success;
    }
}
// EMAIL
function validateEmail() {
    if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
    } else {
    	errorText.innerText = "";
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
    	errorText.innerText = "";
        password.style.borderColor = success;
    }
}



/*----------  6-DIGIT CODE VALIDATION  ----------*/

// ERROR MESSAGE TAG

const form = document.getElementById("otpForm");
const fullOTP = document.getElementById("fullOTP");
const inputs = form.querySelectorAll('.OTP');
const KEYBOARDS = {
	backspace: 8,
	arrowLeft: 37,
	arrowRight: 39,
}

/*----------  OTP Functions ----------*/

// MOVE TO NEXT INPUT BOX
function handleInput(e) {
const input = e.target;
const nextInput = input.nextElementSibling
	if (nextInput && input.value) {
		nextInput.focus();
	if (nextInput.value) {
		nextInput.select();
		}
	}
}

// SPLIT PASTE INTO THE DIFFERENT INPUTS
function handlePaste(e) {
	e.preventDefault();
	const paste = e.clipboardData.getData('text')
	inputs.forEach((input, i) => {
		input.value = paste[i] || ''
	})
}

// MOVE BACK UPON BACKSPACE
function handleBackspace(e) { 
	const input = e.target;
		if (input.value) {
		input.value = '';
		return;
	}

	try {
		input.previousElementSibling.focus();
	} catch(err) {
		
	}
}

// MOVE LEFT
function handleArrowLeft(e) {
const previousInput = e.target.previousElementSibling
	if (!previousInput) return
		previousInput.focus()
	}

// MOVE RIGHT
function handleArrowRight(e) {
const nextInput = e.target.nextElementSibling
	if (!nextInput) return
		nextInput.focus()
	}
	
	form.addEventListener('input', handleInput)
	inputs[0].addEventListener('paste', handlePaste)
	
	inputs.forEach(input => {
	input.addEventListener('focus', e => {
	setTimeout(() => {
	  e.target.select()
	}, 0)
	})
	
		input.addEventListener('keydown', e => {
		switch(e.keyCode) {
		  case KEYBOARDS.backspace:
		    handleBackspace(e)
		    break
		  case KEYBOARDS.arrowLeft:
		    handleArrowLeft(e)
		    break
		  case KEYBOARDS.arrowRight:
		    handleArrowRight(e)
		    break
		  default:  
		}
	})
})

/*----------  OTP Form Validations ----------*/

function validateOTPForm(event) {

	event.preventDefault();
	
	const digits = [];
	const errFound = [];

// 	STORES INPUT VALUES INTO DIGITS[]
	for (i=0; i < inputs.length; i++) {
		digits.push(inputs[i].value);
		
		if (isNaN(inputs[i].value)) {
			errFound.push(i);
			inputs[i].classList.add("error");
		} else {
			inputs[i].classList.remove("error");
		}
	}

// 	CONCATENATED DIGITS
	const otpCode = digits.join('');

	if (otpCode.length < 6) {
		errorText.innerText = "Please enter the full 6 digit code";
		return false;
		
	} else if (isNaN(otpCode)) {
		errorText.innerText = "Please only enter numerical digits";
		return false;
		
	} else {
		fullOTP.value = otpCode;
		form.submit();
		alert(fullOTP.value);
	}
}

// ONKEYUP OTP VALIDATION
function validateOTP() {
	
	const digits = [];
	const errFound = [];

// 	STORES INPUT VALUES INTO DIGITS[]
	for (i=0; i < inputs.length; i++) {
		digits.push(inputs[i].value);
		
		if (isNaN(inputs[i].value)) {
			errFound.push(i);
			inputs[i].classList.remove("correct");
			inputs[i].classList.add("error");
		} else if (inputs[i].value == "") {
			inputs[i].classList.remove("correct");
			inputs[i].classList.remove("error");
		} else {
			inputs[i].classList.remove("error");
			inputs[i].classList.add("correct");
		}
	}
	if (errFound == "") {
		errorText.innerText = "";
	}
}
