<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー</title>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Playfair+Display:wght@500&family=Suez+One&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
<style>
div.button {
    text-align: center;
}

img.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
    body {
  background-image: url("./img/books-1617327_1280.jpg");
  background-size: cover;
}

</style>

</head>
<body>
    <div class="container">
        <div class="mx-auto" style="width: 400px;">
            <h1>ログイン失敗しました</h1>
            <p class="a3">入力されたIDもしくはパスワードが一致しません。</p>
                 <div class="button">
            <button type="button" onclick="location.href='/MyBookShelf/index.html'" class="btn btn-secondary">TOPへ戻る</button>
        </div>
        </div>
         <!-- X<footer><jsp:include page="/WEB-INF/jsp/footer.jsp"/></footer>-->
    </div>
    <div id="mainArea">

<img class="displayed"src = "./img/usagi.png">
</div>
</body>
</html>