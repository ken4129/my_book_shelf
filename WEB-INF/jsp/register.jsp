<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Playfair+Display:wght@500&family=Suez+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>


<style>
div.button {
    text-align: center;
}
body {
  background-image: url("./img/women-3118387_1280.jpg");
  background-size: cover;
}
</style>
<!-- ↓JavaScriptの処理を追加 -->
        <script type="text/javascript">
            function check(){
                if (register.id.value == "" || register.pass.value==""||register.name.value==""){
                    //条件に一致する場合(メールアドレスが空の場合)
                    alert("入力されていない項目があります");    //エラーメッセージを出力
                    return false;    //送信ボタン本来の動作をキャンセルします
                }else{
                    //条件に一致しない場合(メールアドレスが入力されている場合)
                    return true;    //送信ボタン本来の動作を実行します
                }
            }
        </script>
</head>
<body>
<div class="container">
        <div class="mx-auto" style="width: 400px;">
<h1 class="a">ユーザー新規登録</h1>
<hr>
<form action="/MyBookShelf/LoginServlet?action=2" method = "post" name="register">
ID：<input type = "text" name = "id" class="form-control"
                pattern="^[0-9a-zA-Z]*$" title="英数字のみで入力して下さい。"><br>
PASS:<input type = "password" name = "pass" class="form-control"pattern="^[0-9]*$" title="数字のみで入力して下さい。" ><br>
NAME:<input type = "text" name = "name" class="form-control"><br>
<input type = "submit" value ="登録" onclick="return check()"class="btn btn-outline-secondary">
<button type="button" onclick="location.href='/MyBookShelf/index.html'" class="btn btn-outline-secondary">TOPへ</button>

 </form>

 </div>
 </div>
</body>
</html>