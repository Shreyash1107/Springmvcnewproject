function validateName() {
    var name = document.forms["frm"]["Name"].value;
    var nameError = document.getElementById("nameError");
    if (name === "") {
        nameError.innerText = "Name is required.";
        return false;
    } else {
        nameError.innerText = "";
        return true;
    }
}

function validateEmail() {
    var email = document.forms["frm"]["Email"].value;
    var emailError = document.getElementById("emailError");
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        emailError.innerText = "Email is required.";
        return false;
    } else if (!emailPattern.test(email)) {
        emailError.innerText = "Invalid email format.";
        return false;
    } else {
        emailError.innerText = "";
        return true;
    }
}

function validateContact() {
    var contact = document.forms["frm"]["Contact"].value;
    var contactError = document.getElementById("contactError");
    var contactPattern = /^[0-9]+$/;
    if (contact === "") {
        contactError.innerText = "Contact number is required.";
        return false;
    } else if (!contactPattern.test(contact) || contact.length < 10) {
        contactError.innerText = "Contact number must be numeric and at least 10 digits long.";
        return false;
    } else {
        contactError.innerText = "";
        return true;
    }
}

function validateAge() {
    var age = document.forms["frm"]["Age"].value;
    var ageError = document.getElementById("ageError");
    if (age === "") {
        ageError.innerText = "Age is required.";
        return false;
    } else if (isNaN(age) || age <= 0) {
        ageError.innerText = "Age must be a positive number.";
        return false;
    } else {
        ageError.innerText = "";
        return true;
    }
}

function validateCompany() {
    var company = document.forms["frm"]["Company"].value;
    var companyError = document.getElementById("companyError");
    if (company === "") {
        companyError.innerText = "Company is required.";
        return false;
    } else {
        companyError.innerText = "";
        return true;
    }
}

function validateGender() {
    var gender = document.forms["frm"]["Gender"].value;
    var genderError = document.getElementById("genderError");
    if (gender === "") {
        genderError.innerText = "Gender is required.";
        return false;
    } else {
        genderError.innerText = "";
        return true;
    }
}

function validateDept() {
    var dept = document.forms["frm"]["dept_id"].value;
    var deptError = document.getElementById("deptError");
    if (dept === "") {
        deptError.innerText = "Department is required.";
        return false;
    } else {
        deptError.innerText = "";
        return true;
    }
}

function validateBatch() {
    var batch = document.forms["frm"]["Bid"].value;
    var batchError = document.getElementById("batchError");
    if (batch === "") {
        batchError.innerText = "Batch is required.";
        return false;
    } else {
        batchError.innerText = "";
        return true;
    }
}

function validateForm() {
    var isValid = true;
    isValid &= validateName();
    isValid &= validateEmail();
    isValid &= validateContact();
    isValid &= validateAge();
    isValid &= validateCompany();
    isValid &= validateGender();
    isValid &= validateDept();
    isValid &= validateBatch();
    return isValid;
}
