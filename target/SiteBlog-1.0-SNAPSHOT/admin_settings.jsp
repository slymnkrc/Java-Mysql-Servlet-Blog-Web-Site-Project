<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<html>
<head>

</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">


                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Profile
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="admin_settings.jsp">Ayarlar</a></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=adm.getUsername()%></a>
                    </li>

                </ul>
                <form class="d-flex">

                </form>
            </div>
        </div>
    </nav>
    <hr/>
    <div class="card card-outline-secondary" >
        <div class="card-header">
            <h3 class="mb-0">Şifre Ayarları</h3>
        </div>
        <div class="card-body">

            <%
                Object loginObj = request.getAttribute("updatePasswordError");
                if ( loginObj != null ) {
                    String errorMessage = ""+loginObj;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>


            <form class="form" action="admin-settings-servlet" role="form" autocomplete="off" method="post">
                <div class="form-group">
                    <label for="inputPasswordOld">Güncel Şifre</label>
                    <input type="password" name="oldPass" class="form-control" id="inputPasswordOld" required="">
                </div>
                <div class="form-group">
                    <label for="inputPasswordNew">Yeni Şifre</label>
                    <input type="password" name="newPass" class="form-control" id="inputPasswordNew" required="" >
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg float-right">Kaydet</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</div>
<script src="js/admin_settings.js"></script>
</body>
</html>