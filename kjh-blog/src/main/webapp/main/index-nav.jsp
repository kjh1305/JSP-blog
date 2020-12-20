<%--
  Created by IntelliJ IDEA.
  User: jhkim@office.induk.ac.kr
  Date: 2020-11-06
  Time: 오전 1:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="../main/index.jsp">kjh's blog</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../main/index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../blog/list.do">Blogs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../member/memberlist.do">Members</a>
                </li>

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
                    <li class="nav-item">
                        <a class="nav-link" href="../member/member-signup.jsp">SIGN UP</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="../member/member-login2.jsp">SIGN IN</a>
                    </li>
                </c:when>
                    <c:when test="${sessionScope.login != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="../member/member-datail.jsp">Detail</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../member/signout.do">LOGOUT</a>
                        </li>
                    </c:when>

                </c:choose>

            </ul>
        </div>
    </div>
</nav>
