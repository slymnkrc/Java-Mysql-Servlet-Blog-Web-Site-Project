
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Contents" %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<jsp:useBean id="admin" class="props.Admin"></jsp:useBean>



<!DOCTYPE html>
<html>
<head>
    <link rel = "stylesheet" href="exstyle/index.css">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>LOTR BLOG</title>
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
       <!-- <a class="navbar-brand" href="index.html">Start Bootstrap</a> -->
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


<!-- Page Header      SAYFA ÜST KISIM      -->
<header class="masthead" style="background-image: url('img/home.jpg')">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1>LOTR BLOG</h1>
                    <span class="subheading">Kendinizi buraya kapatabilirsiniz, ama dünyayı sonsuza dek dışarıya hapsedemezsiniz.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<%
    Contents content = (Contents) request.getAttribute("contents");
%>

<!-- Main Content      SAYFA ALT KISIM     -->
<div class="container px-4 px-lg-5">
    <div class="row gx-4 gx-lg-5 justify-content-center">
        <div class="col-md-10 col-lg-8 col-xl-7">
            <!-- Post preview  İÇERİK KISMI    -->

            <c:if test="${dbUtil.GetAllContents().size()>0}">
                <c:forEach items="${dbUtil.GetAllContents()}" var ="item">
                    <div class="post-preview" id="${item.cid}">
                        <a href="content-detail?cid=${item.cid}">
                            <h2 class="post-title">${item.title}</h2>
                            <h3 class="post-subtitle" style="display: block; height: 100px; overflow: hidden; word-wrap: break-word; text-overflow: ellipsis;">${item.detail}</h3>
                            <span class="post-subtitle" >Kategori :   ${item.category}</span>
                        </a>
                        <p class="post-meta">

                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                </c:forEach>
            </c:if>


        </div>
    </div>
</div>
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
</body>
</html>
