function validateFeedbackForm() {
    var isValid = true;

    // Get form elements
    var eventName = document.getElementById("eventName");
    var rating = document.getElementById("rating");
    var feedbackDetails = document.getElementById("feedbackDetails");
    var alumniName = document.getElementById("alumniName");

    // Clear previous error messages
    document.getElementById("eventError").innerHTML = "";
    document.getElementById("ratingError").innerHTML = "";
    document.getElementById("feedbackDetailsError").innerHTML = "";
    document.getElementById("alumniNameError").innerHTML = "";

    // Validate Event Name
    if (eventName.value.trim() === "") {
        document.getElementById("eventError").innerHTML = "<span class='error-message'>Event Name cannot be empty.</span>";
        isValid = false;
    }

    // Validate Rating
    if (rating.value.trim() === "") {
        document.getElementById("ratingError").innerHTML = "<span class='error-message'>Rating cannot be empty.</span>";
        isValid = false;
    }

    // Validate Feedback Details
    var feedbackValue = feedbackDetails.value.trim();
    if (feedbackValue === "") {
        document.getElementById("feedbackDetailsError").innerHTML = "<span class='error-message'>Feedback Details cannot be empty.</span>";
        isValid = false;
    } else if (!/^[a-zA-Z\s]+$/.test(feedbackValue)) {
        document.getElementById("feedbackDetailsError").innerHTML = "<span class='error-message'>Feedback Details should only contain alphabets and spaces.</span>";
        isValid = false;
    } else if (/^\s/.test(feedbackValue)) {
        document.getElementById("feedbackDetailsError").innerHTML = "<span class='error-message'>Feedback Details should not start with a space.</span>";
        isValid = false;
    }
    var alumniNameValue = alumniName.value.trim();
    var alumniNameRegex = /^[A-Za-z]+(?:\s[A-Za-z]+)*$/;
    
    if (alumniNameValue === "") {
        document.getElementById("alumniNameError").innerHTML = "<span class='error-message'>Alumni Name cannot be empty.</span>";
        isValid = false;
    } else if (!alumniNameRegex.test(alumniNameValue)) {
        document.getElementById("alumniNameError").innerHTML = "<span class='error-message'>Alumni Name should only contain letters and spaces between words, and should not start with a space.</span>";
        isValid = false;
    }

    return isValid;
}
