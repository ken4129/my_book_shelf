<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Caveat rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
</head>
<body>
    <!-- ブートストラップでナビゲーションバー実装 -->
    <nav class="navbar navbar-expand-lg navbar-light" style='background-color: #e8ece9'>
        <div class="container-fluid" >
            <span class="font1">
            <a class="navbar-brand" href="#">MyBookShelf</a></span>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-4 mb-2 mb-lg-0">
                    <!-- ログアウト -->
                    <li class="nav-item">
                    <a class="nav-link active" href="/MyBookShelf/Logout">ログアウト</a>
                    </li>
                    <!-- ドロップダウンリスト -->
                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false"> メニュー </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=4">書籍一覧</a></li>
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=未読">未読</a></li>
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=読書中">読書中</a></li>
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=読了">読了</a></li>
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=購入予定">購入予定</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/MyBookShelf/Main?flag=deleteUser">ユーザ削除</a></li>
                        </ul></li>
                </ul>
                <!-- 検索フォーム -->
                <form class="d-flex" action="/MyBookShelf/Main" method="get" >
                <input class="form-control me-2" type="search"  name="abstractkey" size=20 placeholder="書棚を検索">
                <input class="btn btn-secondary me-2" type="submit" value="あいまい検索" name="flag">
                </form>
                <form class="d-flex" action="/MyBookShelf/Main" method="post" >
                    <input class="form-control me-2" type="search"  name="isbn" size=20 placeholder="ISBNで検索">
                    <input class="form-control me-2" type="search" name="keyword" size=20 placeholder="ワードで検索">
                    <input class="btn btn-secondary me-2" type="submit" value="検索" name="button_name" >
                    <!-- <input class="btn btn-primary me-2" type="reset" value="リセット"> -->
                    <input type="hidden" name="flag" value="search">
                    <input type="hidden" name="which" value="result">
                </form>
                <!-- 自分の書籍一覧 -->
                <form class="d-flex" action="/MyBookShelf/Main" method="get">
                    <button class="btn btn-secondary me-2" tabindex="2" type="submit" name="flag" value="4">書籍一覧</button>
                </form>
            </div>
        </div>
    </nav>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>