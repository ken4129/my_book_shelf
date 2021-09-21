<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書籍詳細画面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
    <jsp:include page="/WEB-INF/jsp/navbar.jsp" />
    <br>
    <c:forEach var="rb" items="${requestScope.result}">
        <div>
            <form action="/MyBookShelf/Main" method="post">
                <div class="container">
                    <div class="form-group my-3">
                        <!-- 画像 -->
                        <img class="co-2" src="${rb.imglink}" alt="書影" width="100" height="160" /> <input type="hidden"
                            name="imglink" value="${rb.imglink}"> <br>
                        <!-- isbn -->
                        <div class="input-group my-3">
                            <span class="input-group-text" id="basic-addon1">ISBN</span> <input type="text"
                                class="form-control" name="isbn" value="${rb.isbn}" aria-label="isbn"
                                aria-describedby="basic-addon1" readonly>
                        </div>
                        <!-- タイトル -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon2">タイトル</span> <input type="text"
                                class="form-control" name="title" value="${rb.title}" aria-describedby="basic-addon2">
                            <!-- 著者 -->
                            <span class="input-group-text" id="basic-addon3">著者</span> <input type="text"
                                class="form-control" name="authors" value="${rb.authors}" id="basic-url"
                                aria-describedby="basic-addon3">
                        </div>
                        <!-- 出版社 -->
                        <div class="input-group my-3">
                            <span class="input-group-text">出版社</span> <input type="text" class="form-control"
                                name="publisher" value="${rb.publisher }">
                            <!-- 出版日 -->
                            <span class="input-group-text">出版日</span> <input type="text" class="form-control"
                                name="publishedate" value="${rb.publishedDate}">
                            <!-- 価格 -->
                            <span class="input-group-text" id="basic-addon2">価格</span> <input type="text"
                                class="form-control" name="price" value="${rb.price}" aria-label="Recipient's username"
                                aria-describedby="basic-addon2">
                        </div>
                        <!-- 詳細 -->
                        <div class="input-group my-3">
                            <span class="input-group-text">詳細</span>
                            <textarea class="form-control" name="description" aria-label="With textarea" rows="7"><c:out
                                    value="${rb.description }" /></textarea>
                        </div>
                        <!-- 状態 -->
                        <c:forEach var="rb" items="${requestScope.result}">
                            <div class="input-group my-3">
                                <label class="input-group-text" for="inputGroupSelect01">状態</label> <select
                                    class="form-select" name="checklist" id="inputGroupSelect01">
                                            <option selected>状態を選択してください 必須項目</option>
                                            <option value="未読">未読</option>
                                            <option value="読書中">読書中</option>
                                            <option value="読了">読了</option>
                                            <option value="購入予定">購入予定</option>
                                </select>
                            </div>
                        </c:forEach>
                        <!-- ボタン -->
                        <div class="d-flex justify-content-around">
                            <div class="text-right">
                                <button class="btn btn-success btn-lg" id="col-3" type="submit" name="flag"
                                    value="addBook">登録</button>
                                <!-- <button class="btn btn-success btn-lg" id="col-3" type="submit" name="flag"
                                    value="back">戻る</button> -->
                                <!-- <button class="btn btn-danger btn-lg" id="col-3" type="submit" name="flag"
                                    value="deleteBook">削除</button> -->
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <jsp:include page="/WEB-INF/jsp/footer.jsp" />
</body>
</html>