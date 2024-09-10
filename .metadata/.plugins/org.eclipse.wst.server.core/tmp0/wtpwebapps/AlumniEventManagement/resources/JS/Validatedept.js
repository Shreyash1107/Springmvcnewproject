 function validateDeptName() {
        let deptName = document.getElementById("txtDept").value.trim(); 
        let validDeptName = /^[a-zA-Z\s]+$/; 

        if (deptName === "") {
            document.getElementById("deptError").innerHTML = "Department name cannot be empty.";
            return false;
        } else if (!validDeptName.test(deptName)) {
            document.getElementById("deptError").innerHTML = "Invalid department name. Only letters allowed.";
            return false;
        } else {
            document.getElementById("deptError").innerHTML = "";
            return true;
        }
    }