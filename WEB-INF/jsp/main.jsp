<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/style.css">
<title>書籍管理メイン</title>
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp" />
    <div>
    <br>

    </div>
    <div class="container">
    <jsp:include page="/WEB-INF/jsp/disp.jsp" />
      <%--   <c:choose>
            <c:when test="${empty myBookList}">
                <br>
                <h3>
                    <span><c:out value="${loginUser.name} " /> さんの本棚 登録件数：0件</span>
                </h3>
            </c:when>
            <c:when test="${not empty myBookList}">
                <br>
                <div>
                    <h3>
                        <span><c:out value="${loginUser.name} " /> さんの本棚 </span>
                    </h3>
                </div>
                <hr>
                <!-- 書籍一覧の表示 -->
                <table class="table">
                    <tr>
                        <th id="0" data-sort="" style="width: 8%">書影</th>
                        <th id="1" data-sort="" style="width: 15%">書籍名</th>
                        <th id="2" data-sort="" style="width: 10%">著者</th>
                        <th id="3" data-sort="" style="width: 12%">出版社</th>
                        <th id="4" data-sort="" style="width: 12%">出版日</th>
                        <th id="5" data-sort="" style="width: 10%">価格</th>
                        <th id="6" data-sort="" style="width: 10%">状態</th>
                        <th id="7" data-sort="" style="width: 10%">詳細</th>
                    </tr>

                    <c:forEach var="book" items="${myBookList}">
                        <!-- DBからの書籍情報 -->
                        <tr>
                            <td><img src=${ book.imglink } alt="書籍画像" /></td>
                            <td><c:out value="${ book.title }" /></td>
                            <td><c:out value="${ book.authors }" /></td>
                            <td><c:out value="${ book.publisher }" /></td>
                            <td><c:out value="${ book.publishedDate }" /></td>
                            <td><c:out value="${ book.price }" /></td>
                            <!-- checklistの数字で表示を振り分け -->
                            <c:choose>
                                <c:when test="${ book.checklist }==1">
                                    <td><c:out value="未読" /></td>
                                </c:when>
                                <c:when test="${ book.checklist }==2">
                                    <td><c:out value="読書中" /></td>
                                </c:when>
                                <c:when test="${ book.checklist }==3">
                                    <td><c:out value="読了" /></td>
                                </c:when>
                                <c:when test="${ book.checklist }==4">
                                    <td><c:out value="購入予定" /></td>
                                </c:when>
                                <c:otherwise>
                                    <td><c:out value="${ book.checklist }" /></td>
                                </c:otherwise>
                            </c:choose>
                            <!-- 詳細画面遷移ボタン -->

                            <td>
                                <form action="/MyBookShelf/Main" method="post">
                                    <button class="btn btn-success btn-sm" type="submit">詳細</button>
                                    <!-- <input type="hidden" name="flag" value="search"> -->
                                    <input type="hidden" name="flag" value="myBookDetail"> <input type="hidden"
                                        name="isbn" value="${ book.isbn }"> <input type="hidden" name="imglink"
                                        value="${ book.imglink }"> <input type="hidden" name="title"
                                        value="${ book.title }"> <input type="hidden" name="authors"
                                        value="${ book.authors }"> <input type="hidden" name="publisher"
                                        value="${ book.publisher }"> <input type="hidden" name="publishedDate"
                                        value="${ book.publishedDate }"> <input type="hidden" name="description"
                                        value="${ book.description }"> <input type="hidden" name="price"
                                        value="${ book.price }"> <input type="hidden" name="checklist"
                                        value="${ book.checklist }">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
        </c:choose> --%>
    </div>
    <c:if test="${not empty myBookList}">
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
    </c:if>
    <script src="./js/main-page.js"></script>
</body>
</html>