// validation example for Login form
$("#btnLogin").click(function(event) {

    var form = $("#loginForm");

    if (form[0].checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
    }

    // if validation passed form
    // would post to the server here

    form.addClass('was-validated');
});