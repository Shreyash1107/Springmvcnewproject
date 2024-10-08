function validateName(str) {
    let flag = false;
    if (str.trim() === "") {
        document.getElementById("n").innerHTML = "Username cannot be blank";
        document.getElementById("n").style.color="red";
        return false;
    }
    for (let i = 0; i < str.length; i++) {
        let ascii = str.charCodeAt(i);
        if (!((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122) || (ascii >= 48 && ascii <= 57))) {
            flag = true;
            break;
        }
    }
    if (flag) {
        document.getElementById("n").innerHTML = "Invalid username";
        return false;
    } else {
        document.getElementById("n").innerHTML = "";
        return true;
    }
}

function validatePassword(str) {
    let ucount = 0, lcount = 0, dcount = 0, sccount = 0;
    if (str.trim() === "") {
        document.getElementById("p").innerHTML = "Password cannot be blank";
        return false;
    }
    if (str.length < 8) {
        document.getElementById("p").innerHTML = "Password must be at least 8 characters long";
        return false;
    } else {
        for (let i = 0; i < str.length; i++) {
            let ascii = str.charCodeAt(i);
            if (ascii >= 65 && ascii <= 90) ucount++;
            if (ascii >= 97 && ascii <= 122) lcount++;
            if (ascii >= 48 && ascii <= 57) dcount++;
            if (!((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122) || (ascii >= 48 && ascii <= 57))) sccount++;
        }
        if (ucount >= 1 && lcount >= 1 && dcount >= 1 && sccount >= 1) {
            document.getElementById("p").innerHTML = "";
            return true;
        } else {
            document.getElementById("p").innerHTML = "Password must include uppercase, lowercase, numeric, and special characters";
            return false;
        }
    }
}
document.getElementById('username').addEventListener('focus', function() {
    document.getElementById('n').innerHTML = "";
});
document.getElementById('password').addEventListener('focus', function() {
    document.getElementById('p').innerHTML = "";
});

function validateForm() {
    let usernameValid = validateName(document.getElementById('username').value);
    let passwordValid = validatePassword(document.getElementById('password').value);
    return usernameValid && passwordValid;
}
