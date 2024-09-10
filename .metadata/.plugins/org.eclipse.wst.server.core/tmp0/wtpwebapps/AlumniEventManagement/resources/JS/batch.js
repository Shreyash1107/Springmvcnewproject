function validateBatchForm() {
    var isValid = true;
    var passoutYearInput = document.getElementById('passoutYear');
    var errorMessageElement = document.getElementById('passoutYearError');
    var currentYear = new Date().getFullYear();
    var passoutYear = parseInt(passoutYearInput.value, 10);

    errorMessageElement.textContent = '';

    if (isNaN(passoutYear)) {
        errorMessageElement.textContent = 'Please enter a valid year.';
        isValid = false;
    } else if (passoutYear > currentYear) {
        errorMessageElement.textContent = 'Passout year cannot be in the current year or future years.';
        isValid = false;
    }

    return isValid;
}

