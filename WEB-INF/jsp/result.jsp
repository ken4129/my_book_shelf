<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String keyword = (String) request.getAttribute("key");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS読込み -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="./css/card.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> -->
<title>${ key }検索結果</title>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp" />
    <%-- <div class="container">
        <table class="table" id="e-1">
            <tr>
                <th style="width: 3%">書影</th>
                <th style="width: 10%">書籍名</th>
                <th style="width: 5%">著者</th>
                <th style="width: 5%">出版社</th>
                <th style="width: 3%">出版日</th>
                <th style="width: 3%">価格</th>
                <th style="width: 5%">詳細ページ</th>
            </tr>

            <tr>
                <c:forEach var="b" items="${requestScope.result}">
                    <!-- 検索結果からの書籍情報 -->
                    <tr>
                        <td><img src="${b.imglink}" alt="書影" width="100" height="160" /></td>
                        <td><c:out value="${b.title}" /></td>
                        <td><c:out value="${b.authors}" /></td>
                        <td><c:out value="${b.publisher}" /></td>
                        <td><c:out value="${b.publishedDate}" /></td>
                        <td><c:out value="${b.price}" /></td>
                        <td>
                            <!-- 書籍詳細画面遷移 -->
                            <form action="/MyBookShelf/Main" method="post">
                                <button class="btn btn-primary btn-sm primary" type="submit">詳細</button>
                                <input type="hidden" value="検索" name="button_name"> <input type="hidden"
                                    name="flag" value="search"> <input type="hidden" name="which" value="desc">
                                <input type="hidden" name="isbn" value="${b.isbn}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
        </table>
    </div> --%>
    <div class="container">
        <br>
        <div>
            <h3>
                <%
                if (keyword != null) {
                %>
                <span> <c:out value="<%=keyword%>" />
                </span>
                <%
                }
                %>
            </h3>
        </div>
        <hr>
        <div class="row row-cols-1 row-cols-md-3 g-6">
            <c:forEach var="b" items="${requestScope.result}">
                <div class="card mx-1 my-2 " style="width: 100%; max-width: 430px; height: 310px;">
                    <div class="row g-0">
                        <div class="col-md-3">
                            <img src="${b.imglink}" alt="画像未登録">
                            <div class="mt-0">
                                <p class="card-text" style="width: 100%;">
                                    <small class="text-muted">${b.authors}</small> <br> <small class="text-muted">${b.publisher}</small>
                                </p>
                            </div>
                            <div class="mt-0">
                                <form action="/MyBookShelf/Main" method="post">
                                    <button class="btn btn-primary btn-sm primary" type="submit">詳細</button>
                                    <input type="hidden" value="検索" name="button_name"> <input type="hidden"
                                        name="flag" value="search"> <input type="hidden" name="which"
                                        value="desc"> <input type="hidden" name="isbn" value="${b.isbn}">
                                </form>
                            </div>
                        </div>
                        <div class="col-md-8 mt-0">
                            <div class="card-body" style="width: 100%; width:300px;">
                                <div style="width: 100%; width: 100%; max-width: 280px; height: 90px;">
                                    <h6 class="card-title">${b.title}</h6>
                                </div>
                                <div style="width:290px; height: 170px; overflow: auto; border: 1px">
                                    <p class="card-text">${b.description}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script src="./js/main-page.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="./js/result.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/es6-promise/3.3.1/es6-promise.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fetch/2.0.4/fetch.min.js"></script>
    <div id="pagetop">
        <a href="#"></a>
    </div>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>