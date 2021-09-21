<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー削除画面</title>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="/style.css">
<style>
div.button {
    text-align: center;
}
body {
  background-image: url("./img/bookshelf-4814980_1280.jpg");
  background-size: cover;
  color:white;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  width: 300px;
  height: 300px;
}
</style>
</head>
<body>

<div class="delteFrom">
    <div class="mx-auto" style="width: 400px;">

<h1>ユーザー削除</h1>

<hr>

<form action="/MyBookShelf/LoginServlet" method="get">
        削除するユーザーID：<c:out value="${loginUser.id} "/><br>

    <div class="button">
         <input type="submit" id="btn" name="delete" onclick="return window.confirm('このユーザーを削除しますか？')" value="削除"class="btn btn-primary btn-lg"><br>
<input type="hidden" name=action value="3">
        <hr>

        <button type="button" onclick="location.href='/MyBookShelf/index.html'"class="btn btn-secondary btn-lg">
         Topへ
        </button>
    </div>

</form>
    </div>
</div>

</body>
</html>