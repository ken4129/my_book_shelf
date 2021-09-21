<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Playfair+Display:wght@500&family=Suez+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
<title>ユーザー登録エラー</title>
<style>img.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }
    div.button {
    text-align: center;
}
body {
  background-image: url("./img/bookshelf-4814980_1280.jpg");
  background-size: cover;
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
<div class="container">
        <div class="mx-auto" style="width: 400px;">
<h1>登録に失敗しました</h1>
<p class="a3">すでにそのIDは利用されています。別のIDをお試しください。</p>
  <div class="button">
       <button type="button" onclick="location.href='/MyBookShelf/LoginServlet?action=1'" class="btn btn-secondary">新規登録へ</button>
            <button type="button" onclick="location.href='/MyBookShelf/index.html'" class="btn btn-secondary">TOPへ</button>
        </div>
</div>
</div>
<img class="displayed"src = "./img/inu.png">

</body>
</html>