    function validateDropdown() {
        let dept = document.getElementById("deptSelect").value;
        var deptError = document.getElementById("deptError");
        if (dept === "") {
            deptError.innerHTML = "Department must be selected.";
            return false;
        } else {
            deptError.innerHTML = "";
            return true;
        }
    function validateBatchForm() {
        let batchYear = document.getElementById("passoutYear").value.trim();
        let batchError = document.getElementById("passoutYearError");

        let isBatchValid = true;
        let isDeptValid = true;
        if (batchYear === "") {
            batchError.innerHTML = "Pass-out Batch cannot be empty.";
            isBatchValid = false;
        } else if (!/^\d{4}$/.test(batchYear)) {
            batchError.innerHTML = "Pass-out Batch should be a 4-digit number.";
            isBatchValid = false;
        } else {
            batchError.innerHTML = "";
        }
        if (!validateDropdown()) {
            isDeptValid = false;
        }

        return isBatchValid && isDeptValid;
    }
    document.querySelector("form[name='frm']").onsubmit = function() {
        return validateBatchForm();
    };
    document.getElementById("passoutYear").addEventListener("input", function(event) {
        const value = event.target.value;
        event.target.value = value.replace(/\D/g, '');
    });
};