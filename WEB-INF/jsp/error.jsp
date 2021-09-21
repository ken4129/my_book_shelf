<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--セッションは利用しない --%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>エラー画面</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Playfair+Display:wght@500&family=Suez+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
<style>
div.button {
    text-align: center;
}
body {
  background-image: url("./img/book-4007822_1280.jpg");
  background-size: cover;
  color:white;
    position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  width: 500px;
  height: 300px;
}
</style>
</head>
<body>
    <h3>例外発生</h3>
    <hr>
    例外内容: ${requestScope.error}<br><br>
    <div class="button">
       <!-- <button type="button" onclick="location.href='/WEB-INF/jsp?main.jsp'" class="btn btn-secondary">メインへ</button> -->
            <button type="button" onclick="location.href='/MyBookShelf/index.html'" class="btn btn-secondary">TOPへ</button>
    </div>
</body>
</html>