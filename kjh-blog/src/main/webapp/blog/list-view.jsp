<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>

<head>

  <%@ include file="../main/index-head.jsp" %>
  <title>Blog List : Clean Blog - Start Bootstrap Theme</title>

  <Script>
    function PageMove(page){
      location.href = "../blog/list.do?page="+page;
    }
  </Script>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="../main/index-nav.jsp" />
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('../img/index2.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>Blog List</h1>
            <span class="subheading">블로그 목록</span>
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
        <c:if test="${sessionScope.login != null}">
        <div class="text-right">
          <a class="btn btn-primary float-right" href="./create-form.jsp">New Post</a>
        </div>
        </c:if>
      	<c:forEach items="${requestScope.bloglist }" var="blog">      	
        <div class="post-preview">
          <a href="read.do?id=${blog.id }">
            <h2 class="post-title">
              ${blog.title }
            </h2>
            <h3 class="post-subtitle">
              ${blog.content }
            </h3>
          </a>
          <p class="post-meta">Posted by
            <a href="#">${blog.blogger }</a>
            on ${blog.regDateTime }</p>
        </div>
        <hr>
        </c:forEach>
        <!-- Pager
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="#">Older Posts &rarr;</a>
        </div>
        -->

        <div class="toolbar-bottom">
          <div class="toolbar mt-lg">
            <div class="sorter">
              <ul class="pagination">
                <li><a href="javascript:PageMove(${paging.firstPageNo})">◀◀</a></li>
                <li><a href="javascript:PageMove(${paging.prevPageNo})">◀</a></li>
                <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                  <c:choose>
                    <c:when test="${i eq paging.pageNo}">
                      <li class="active"><a href="javascript:PageMove(${i})"> ${i} </a></li>
                    </c:when>
                    <c:otherwise>
                      <li><a href="javascript:PageMove(${i})"> ${i} </a></li>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <li><a href="javascript:PageMove(${paging.nextPageNo})">▶</a></li>
                <li><a href="javascript:PageMove(${paging.finalPageNo})">▶▶</a></li>
              </ul>
            </div>
          </div>
        </div>

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
