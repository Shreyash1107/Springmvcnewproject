function validateName() {
    let str = document.getElementById('username').value;
    let len = str.length;
    let flag = false;
    for (let i = 0; i < len; i++) {
        let ascii = str.charCodeAt(i);
        if (!((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122) || (ascii >= 48 && ascii <= 57))) {
            flag = true;
            break;
        }
    }

    if (flag) {
        document.getElementById("n").innerHTML = "Invalid username: Only letters and digits are allowed";
        return false;
    } else {
        document.getElementById("n").innerHTML = "";
        return true;
    }
}

function validateContact() {
    let str = document.getElementById('contact').value;
    if (str.length !== 10 || !/^\d{10}$/.test(str)) {
        document.getElementById("c").innerHTML = "Invalid Contact Number";
        document.getElementById("c").style.color = "red";
        return false;
    } else {
        document.getElementById("c").innerHTML = "";
        return true;
    }
}

function validatePassword() {
    let str = document.getElementById('password').value;
    let sccount = 0, dcount = 0, ucount = 0, lcount = 0;
    if (str.length < 8) {
        document.getElementById("p").innerHTML = "Password must be at least 8 characters";
        return false;
    }
    for (let i = 0; i < str.length; i++) {
        let charCode = str.charCodeAt(i);
        if (charCode >= 65 && charCode <= 90) ucount++;
        if (charCode >= 97 && charCode <= 122) lcount++;
        if (charCode >= 48 && charCode <= 57) dcount++;
        if (!((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 48 && charCode <= 57))) sccount++;
    }
    if (sccount >= 1 && dcount >= 1 && ucount >= 1 && lcount >= 1) {
        document.getElementById("p").innerHTML = "";
        return true;
    } else {
        document.getElementById("p").innerHTML = "Password must include uppercase, lowercase, number, and special character";
        return false;
    }
}

function validateEmail() {
    let str = document.getElementById('email').value;
    let index = str.indexOf("@");
    if (index <= 0 || str.indexOf("@", index + 1) > 0) {
        document.getElementById("e").innerHTML = "Invalid email address";
        return false;
    } else {
        let afterAt = str.slice(index + 1);
        let dotIndex = afterAt.lastIndexOf(".");
        if (dotIndex === -1 || !(dotIndex === afterAt.length - 4 || dotIndex === afterAt.length - 3)) {
            document.getElementById("e").innerHTML = "Invalid email address";
            return false;
        } else {
            document.getElementById("e").innerHTML = "";
            return true;
        }
    }
}

function validateForm() {
    return validateName() && validateContact() && validatePassword() && validateEmail();
}

document.addEventListener('DOMContentLoaded', (event) => {
    document.getElementById('togglePassword').addEventListener('click', function() {
        let password = document.getElementById('password');
        let icons = this.querySelector('i');
        if (password.type === 'password') {
            password.type = 'text';
            icons.classList.remove('fa-lock');
            icons.classList.add('fa-unlock');
        } else {
            password.type = 'password';
            icons.classList.remove('fa-unlock');
            icons.classList.add('fa-lock');
        }
    });
});
