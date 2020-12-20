<%--
  Created by IntelliJ IDEA.
  User: jhkim@office.induk.ac.kr
  Date: 2020-11-06
  Time: 오전 1:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../css/clean-blog.min.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<jsp:include page="../main/index-nav.jsp"/>

<!-- Page Header -->
<header class="masthead" style="background-image: url('../img/index4.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="page-heading">
                    <h1>로그인</h1>
                    <span class="subheading">Email, Passward를 입력하세요.</span>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">

            <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
            <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
            <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
            <%
                Cookie[] cookies = request.getCookies();
                String cookie_id = null;
                String cookie_pw = null;
                if(cookies != null){
                    for(Cookie tempCookie : cookies){
                        if(tempCookie.getName().equals("id")){
                            request.setAttribute("cookie_id",tempCookie.getValue());
                        }
                        if(tempCookie.getName().equals("pw")){
                            request.setAttribute("cookie_pw",tempCookie.getValue());
                        }
                    }
                }
            %>

<c:choose>
    <c:when test="${sessionScope.login == null}">
                    <form action="./signin.do" method="post">
                        <c:choose>
                                <c:when test="${cookie==null}">
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Name</label>
                                <input type="email" class="form-control" placeholder="email" id="email" name="email" required data-validation-required-message="Please enter your email.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="form-group floating-label-form-group controls">
                                <label>Email Address</label>
                                <input type="password" class="form-control" placeholder="pw" id="pw" name="pw" required data-validation-required-message="Please enter your password.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div>
                            <input type="checkbox" name="checked"> Remember
                        </div>
                                </c:when>
                            <c:otherwise>
                                <div class="control-group">
                                    <div class="form-group floating-label-form-group controls">
                                        <label>Name</label>
                                        <input type="email" class="form-control" placeholder="email" id="email" name="email" value="${cookie_email}" required data-validation-required-message="Please enter your email.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="form-group floating-label-form-group controls">
                                        <label>Email Address</label>
                                        <input type="password" class="form-control" placeholder="pw" id="pw" name="pw" value="${cookie_pw}" required data-validation-required-message="Please enter your password.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div>
                                    <input type="checkbox" name="checked" value="yes"> Remember
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <br>
                        <div id="success"></div>
                        <input type="submit" class="btn btn-primary" value="로그인">
                    </form>

        </c:when>
        <c:otherwise>
            <jsp:forward page="../main/index.jsp"></jsp:forward>
        </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<hr>

<!-- Footer -->
<jsp:include page="../main/index-footer.jsp"/>

<!-- Bootstrap core JavaScript -->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="../js/jqBootstrapValidation.js"></script>
<script src="../js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="../js/clean-blog.min.js"></script>

</body>

</html>
