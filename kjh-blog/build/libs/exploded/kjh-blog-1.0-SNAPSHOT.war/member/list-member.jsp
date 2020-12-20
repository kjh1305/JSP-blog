<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <%@ include file="../main/index-head.jsp" %>
    <title>Blog List : Clean Blog - Start Bootstrap Theme</title>

</head>

<body>

<!-- Navigation -->
<jsp:include page="../main/index-nav.jsp" />

<!-- Page Header -->
<header class="masthead" style="background-image: url('../img/index5.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Member List</h1>
                    <span class="subheading">회원 목록</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
</div>
<div class="row">
    <div class="col-lg-8 col-md-10 mx-auto">
        <c:if test="${sessionScope.login.email eq 'root@induk.ac.kr'}">
            <c:forEach items="${requestScope.memberlist }" var="member">
                <div class="post-preview">
                    <a href="read.do?id=${member.id }">
                        <h2 class="post-title">
                                ${member.email}
                        </h2>
                        <h3 class="post-subtitle">
                                ${member.pw}
                        </h3>
                    </a>
                    <p class="post-meta">이름
                            ${member.name }<br>
                        phone number ${member.phone }</p> 주소 ${member.address }
                </div>
                <hr>
            </c:forEach>
        </c:if>

        <!-- Pager
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
        </div>
        -->
    </div>
</div>
</div>

<hr>

<!-- Footer -->
<%@ include file="../main/index-footer.jsp" %>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/clean-blog.min.js"></script>

</body>

</html>
