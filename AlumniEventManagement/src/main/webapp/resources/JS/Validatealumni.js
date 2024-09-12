function validateName() {
    var name = document.forms["frm"]["Name"].value;
    var nameError = document.getElementById("nameError");
    var namePattern = /^[A-Za-z\s]+$/;
    if (name === "") {
        nameError.innerHTML = "Name is required.";
        return false;
    } 
    else if (/^\s/.test(name)) {
        nameError.innerHTML = "Name should not start with spaces.";
        return false;
    }
    else if (!namePattern.test(name.trim())) {
        nameError.innerHTML = "Name should contain only letters and spaces.";
        return false;
    } 
    else {
        nameError.innerHTML = "";
        return true;
    }
}

function validateEmail() {
    var email = document.forms["frm"]["Email"].value;
    var emailError = document.getElementById("emailError");
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        emailError.innerHTML = "Email is required.";
        return false;
    } else if (!emailPattern.test(email)) {
        emailError.innerHTML = "Invalid email format.";
        return false;
    } else {
        emailError.innerHTML = "";
        return true;
    }
}

function validateContact() {
    var contact = document.forms["frm"]["Contact"].value;
    var contactError = document.getElementById("contactError");
    var contactPattern = /^[0-9]+$/;
    if (contact === "") {
        contactError.innerHTML = "Contact number is required.";
        return false;
    } else if (!contactPattern.test(contact) || contact.length < 10) {
        contactError.innerHTML = "Contact number must be numeric and at least 10 digits long.";
        return false;
    } else {
        contactError.innerHTML = "";
        return true;
    }
}

function validateAge() {
    var age = document.forms["frm"]["Age"].value;
    var ageError = document.getElementById("ageError");
    if (age === "") {
        ageError.innerHTML = "Age is required.";
        return false;
    } else if (isNaN(age) || age <= 0) {
        ageError.innerHTML = "Age must be a positive number.";
        return false;
    } else {
        ageError.innerHTML = "";
        return true;
    }
}

function validateCompany() {
    var company = document.forms["frm"]["Company"].value;
    var companyError = document.getElementById("companyError");
    var regex = /^[A-Za-z]+(?:\s[A-Za-z]+)*$/;

    if (company.startsWith(" ")) {
        companyError.innerHTML = "Starting space is not allowed.";
        return false;
    }

    else if (company === "") {
        companyError.innerHTML = "Company is required.";
        return false;
    }

    else if (!regex.test(company)) {
        companyError.innerHTML = "Only alphabets and spaces between words are allowed.";
        return false;
    } 

    else {
        companyError.innerHTML = "";
        return true;
    }
}

function validateGender() {
    var gender = document.forms["frm"]["Gender"].value;
    var genderError = document.getElementById("genderError");
    if (gender === "") {
        genderError.innerHTML = "Gender is required.";
        return false;
    } else {
        genderError.innerHTML = "";
        return true;
    }
}

function validateDept() {
    var dept = document.forms["frm"]["dept_id"].value;
    var deptError = document.getElementById("deptError");
    if (dept === "") {
        deptError.innerHTML = "Department is required.";
        return false;
    } else {
        deptError.innerHTML = "";
        return true;
    }
}

function validateBatch() {
    var batch = document.forms["frm"]["Bid"].value;
    var batchError = document.getElementById("batchError");
    if (batch === "") {
        batchError.innerHTML = "Batch is required.";
        return false;
    } else {
        batchError.innerHTML = "";
        return true;
    }
}

function validateForm() {
    var isValid = true;

    if (!validateName()) {
        isValid = false;
    }
    if (!validateEmail()) {
        isValid = false;
    }
    if (!validateContact()) {
        isValid = false;
    }
    if (!validateAge()) {
        isValid = false;
    }
    if (!validateCompany()) {
        isValid = false;
    }
    if (!validateGender()) {
        isValid = false;
    }
    if (!validateDept()) {
        isValid = false;
    }
    if (!validateBatch()) {
        isValid = false;
    }   
    return isValid;
}