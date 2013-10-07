$(document).ready(function () {
    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#spin_button").click();
        }
    });
});