
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>

<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    <div class="row">
        <div class="col-sm-4">
            <h2>Yazı Ekle</h2>

            <%
                Object insertErrorObject = request.getAttribute("insertError");
                if ( insertErrorObject != null ) {
                    String errorMessage = ""+insertErrorObject;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <form action="contens-insert" method="post" >
                <div class="mb-3">
                    <input type="text" name="category" placeholder="Kategori" class="form-control" required />
                </div>
                <div class="mb-3">
                    <input type="text" name="title"  placeholder="Başlık" class="form-control" required />
                </div>
                <div class="mb-3">
                    <textarea type="text" name="detail" maxlength="5000" placeholder="Detay" class="form-control" required></textarea>
                </div>
                <button class="btn btn-success"> Ekle </button>
            </form>
        </div>
        <div class="col-sm-8">
            <h2>Yazı Listesi</h2>

            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">Cid</th>
                    <th scope="col">Kategori</th>
                    <th scope="col">Başlık</th>
                    <th scope="col">Detay</th>
                    <th scope="col">Sil</th>
                </tr>
                </thead>
                <tbody>

                <%
                    int aid = adm.getAid();
                %>

                <c:if test="${ dbUtil.allContents(aid).size() == 0 }">
                    <tr>Ürün Yok</tr>
                </c:if>

                <c:if test="${ dbUtil.allContents(aid).size() > 0 }">
                    <c:forEach items="${ dbUtil.allContents(aid) }" var="item" >
                        <tr>
                            <th scope="row"><c:out value="${item.cid}"></c:out></th>
                            <td><c:out value="${item.category}"></c:out></td>
                            <td ><c:out value="${item.title}"></c:out></td>
                            <td style="display: block; height: 100px ;overflow: hidden; word-wrap: break-word; text-overflow: ellipsis; " ><c:out value="${item.detail}"></c:out></td>
                            <td>
                                <a href="content-update?cid=${item.cid}" class="btn btn-warning btn-sm">Düzenle</a>
                                <a onclick="return show_alert(${item.cid})" href="contens-insert?cid=${item.cid}" class="btn btn-danger btn-sm">Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>

        </div>
    </div>

    </tbody>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>
        function show_alert(id) {
            return confirm(id +" nolu içeriği silmek istediğinizden emin misniz?")
        }
    </script>

</div>
</body>
</html>
