function validateBatchForm() {
    var isValid = true;
    var passoutYearInput = document.getElementById('passoutYear');
    var passoutYearErrorElement = document.getElementById('passoutYearError');
    var currentYear = new Date().getFullYear();
    var passoutYear = parseInt(passoutYearInput.value, 10);
    var minYear = 2000; // Minimum allowed batch year
    passoutYearErrorElement.textContent = ''; 
    if (isNaN(passoutYear)) {
        passoutYearErrorElement.textContent = 'Please enter a valid year.';
        isValid = false;
    } else if (passoutYear >= currentYear) {
        passoutYearErrorElement.textContent = 'Passout year cannot be the current year or in the future.';
        isValid = false;
    } else if (passoutYear < minYear) {
        passoutYearErrorElement.textContent = 'Passout year cannot be before 2000.';
        isValid = false;
    }
    var deptSelect = document.getElementById('deptSelect');
    var deptErrorElement = document.getElementById('deptError');

    deptErrorElement.textContent = ''; 

    if (deptSelect.value === '') {
        deptErrorElement.textContent = 'Please select a department.';
        isValid = false;
    }

    return isValid;
}
