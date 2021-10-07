<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html>
<head>
    <link rel = "stylesheet" href="exstyle/index.css">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>İletişim</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
    <div class="container px-4 px-lg-5">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Anasayfa</a></li>
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="about.jsp">Hakkımda</a></li>
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="contact.jsp">İletişim</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Page Header-->
<header class="masthead" style="background-image: url('assets/img/eye.jpg')">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="page-heading">
                    <h1>İrtibata Geçiniz...</h1>
                    <span class="subheading">Her zaman beklenmedik bir anda gelir ve gider.</span>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Main Content-->
<main class="mb-4">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <p>İletişime geçmek ister misiniz? Bana mesaj göndermek için aşağıdaki formu doldurun, en kısa sürede size geri döneceğim!</p>
                <div class="my-5">


                    <div class="container px-5 my-5">

                        <%
                            Object insertErrorObject = request.getAttribute("contactError");
                            if ( insertErrorObject != null ) {
                                String errorMessage = ""+insertErrorObject;
                        %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Hata!</strong> <%=errorMessage %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <% } %>

                        <form action="contact-servlet" method="post" >
                            <div class="mb-3">
                                <input type="text" name="name" placeholder="İsim" class="form-control" required />
                            </div>
                            <div class="mb-3">
                                <input type="email" name="email" placeholder="E-Mail" class="form-control" required />
                            </div>
                            <div class="mb-3">
                                <input type="text" name="phone" placeholder="Telefon" class="form-control" required />
                            </div>
                            <div class="form-floating">
                                <textarea class="form-control" name="message" maxlength="1000" placeholder="Leave a comment here" id="message" required></textarea>
                                <label for="message">Mesaj</label>
                            </div>
                            <button onclick="show_alert()" class="btn btn-success"> Gönder </button>
                        </form>
                    </div>
                    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Footer-->
<footer class="border-top">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <ul class="list-inline text-center">

                    <li class="list-inline-item">
                        <a href="https://github.com/slymnkrc">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                        </a>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script>
    function show_alert(){
        return confirm("Göndermek istediğinizden emin misiniz?")
    }

</script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>