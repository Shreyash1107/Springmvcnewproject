window.onload = function() {
            var messageAlert = document.getElementById('message-alert');
            if (messageAlert) {
                setTimeout(function() {
                    messageAlert.style.display = 'none';
                }, 3000); // 5000 milliseconds = 5 seconds
            }
        };