function validateName() {
    var name = document.forms["frm"]["Name"].value;
    var nameError = document.getElementById("nameError");
    var namePattern = /^[A-Za-z\s]+$/;
    if (name === "") {
        nameError.innerHTML = "Name is required.";
        return false;
    } 
    if (/^\s/.test(name)) {
        nameError.innerHTML = "Name should not start with spaces.";
        return false;
    }
    if (!namePattern.test(name.trim())) {
        nameError.innerHTML = "Name should contain only letters and spaces.";
        return false;
    } 
    nameError.innerHTML = "";
    return true;
}

function validateEmail() {
    var email = document.forms["frm"]["Email"].value;
    var emailError = document.getElementById("emailError");
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        emailError.innerHTML = "Email is required.";
        return false;
    }
    if (!emailPattern.test(email)) {
        emailError.innerHTML = "Invalid email format.";
        return false;
    }
    emailError.innerHTML = "";
    return true;
}

function validateContact() {
    var contact = document.forms["frm"]["Contact"].value;
    var contactError = document.getElementById("contactError");
    var contactPattern = /^[0-9]+$/;
    if (contact === "") {
        contactError.innerHTML = "Contact number is required.";
        return false;
    }
    if (!contactPattern.test(contact) || contact.length !== 10) {
        contactError.innerHTML = "Contact number must be numeric and 10 digits long.";
        return false;
    }
    contactError.innerHTML = "";
    return true;
}

function validateAge() {
    var age = document.forms["frm"]["Age"].value;
    var ageError = document.getElementById("ageError");
    if (age === "") {
        ageError.innerHTML = "Age is required.";
        return false;
    }
    if (isNaN(age) || age <= 0) {
        ageError.innerHTML = "Age must be a positive number.";
        return false;
    }
    ageError.innerHTML = "";
    return true;
}

function validateCompany() {
    var company = document.forms["frm"]["Company"].value;
    var companyError = document.getElementById("companyError");
    var regex = /^[A-Za-z]+(?:\s[A-Za-z]+)*$/;
    if (company.startsWith(" ")) {
        companyError.innerHTML = "Starting space is not allowed.";
        return false;
    }
    if (company === "") {
        companyError.innerHTML = "Company is required.";
        return false;
    }
    if (!regex.test(company)) {
        companyError.innerHTML = "Only alphabets and spaces between words are allowed.";
        return false;
    }
    companyError.innerHTML = "";
    return true;
}

function validateGender() {
    var gender = document.getElementById("gend").value;
    var genderError = document.getElementById("genderError");
    if (gender === "") {
        genderError.innerText = "Please select a gender.";
        return false;
    }
    genderError.innerText = "";
    return true;
}

function validateDept() {
    var dept = document.getElementById("deptSelect").value;
    var deptError = document.getElementById("deptError");
    if (dept === "") {
        deptError.innerText = "Please select a department.";
        return false;
    }
    deptError.innerText = "";
    return true;
}

function validateBatch() {
    var batch = document.getElementById("batchselect").value;
    var batchError = document.getElementById("batchError");
    if (batch === "") {
        batchError.innerText = "Please select a batch.";
        return false;
    }
    batchError.innerText = "";
    return true;
}

function validateForm() {
    var isValid = true;

    if (!validateName()) isValid = false;
    if (!validateEmail()) isValid = false;
    if (!validateContact()) isValid = false;
    if (!validateAge()) isValid = false;
    if (!validateCompany()) isValid = false;
    if (!validateGender()) isValid = false;
    if (!validateDept()) isValid = false;
    if (!validateBatch()) isValid = false;

    return isValid;
}
