
function isAlphaSpace(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;

    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode === 32) {
        return true;
    }
    // Prevent default behavior
    evt.preventDefault();
    return false;
}


function validateFeedbackForm() {
    let eventName = document.getElementById("eventName").value.trim();
    let eventError = document.getElementById("eventError");
    let rating = document.getElementById("rating").value.trim();
    let ratingError = document.getElementById("ratingError");
    let alumniName = document.getElementById("alumniName").value.trim();
    let alumniNameError = document.getElementById("alumniNameError");
    let feedbackDetails = document.getElementById("feedbackDetails").value.trim();
    let feedbackDetailsError = document.getElementById("feedbackDetailsError");

    let valid = true;


    if (eventName === "") {
        eventError.innerHTML = "Event Name is required.";
        valid = false;
    } else {
        eventError.innerHTML = "";
    }


    if (rating === "") {
        ratingError.innerHTML = "Rating is required.";
        valid = false;
    } else {
        ratingError.innerHTML = "";
    }


    if (alumniName === "") {
        alumniNameError.innerHTML = "Alumni Name is required.";
        valid = false;
    } else if (!/^[A-Za-z\s]+$/.test(alumniName)) {
        alumniNameError.innerHTML = "Alumni Name should only contain letters.";
        valid = false;
    } else {
        alumniNameError.innerHTML = "";
    }


    if (feedbackDetails === "") {
        feedbackDetailsError.innerHTML = "Feedback Details are required.";
        valid = false;
    } else if (!/^[A-Za-z\s]+$/.test(feedbackDetails)) {
        feedbackDetailsError.innerHTML = "Feedback Details should only contain letters.";
        valid = false;
    } else {
        feedbackDetailsError.innerHTML = "";
    }

    return valid;
}

// Attach event listeners to input fields for real-time validation
document.getElementById("alumniName").addEventListener("keypress", isAlphaSpace);
document.getElementById("feedbackDetails").addEventListener("keypress", isAlphaSpace);
