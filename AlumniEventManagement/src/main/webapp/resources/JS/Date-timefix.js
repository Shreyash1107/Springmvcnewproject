function setMinDate() {
    var today = new Date();
    var day = today.getDate().toString().padStart(2, '0');
    var month = (today.getMonth() + 1).toString().padStart(2, '0');
    var year = today.getFullYear();
    var minDate = year + '-' + month + '-' + day;

    document.getElementById('inputdate').setAttribute('min', minDate);
}
function setMinTime() {
    var now = new Date();
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var minTime = hours + ':' + minutes;

    document.getElementById('inputtime').setAttribute('min', minTime);
}
document.addEventListener('DOMContentLoaded', function() {
    setMinDate();
    setMinTime();
});