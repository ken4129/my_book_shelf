'use strict';

window.addEventListener('load', () => {
    const query = getParamater('q');
    searchBooksBy(query);
    init(query);
});

/**
 * fetchで受け取った結果を画面に表示する.
 * 結果はBookクラスでインスタンス化され、BookのappendInnerHtml()を使って表示する.
 * @param items {object}
 */
function _itemsChanged(items) {
    // 書き込む先の親要素を取得する.
    const element = document.getElementById('resultsWrapper');
    for (let i = 0; i < items.length; i++) {
        // Bookの詳細を元に親要素にDomを追加する.
        new Book(items[i]).appendInnerHtml(element);
    }
}

function init(query) {
    document.title = query + ' ' + document.title;
    document.getElementById('query').innerHTML = query;
    document.getElementById('inputQuery').value = query;
}

/**
 * 引数のクエリで本のリストを検索する.
 *
 * @param query {string}
 */
function searchBooksBy(query) {
    if (!query) {
        return [];  // queryがないため検索を行わない.
    }
    // // https://developers.google.com/books/docs/v1/getting_started?hl=ja#rest-in-the-books-api
    const by = 'relevance';
    const fields = 'fields=items(id,volumeInfo/*,accessInfo(embeddable,country,viewability))';
    fetch(`https://www.googleapis.com/books/v1/volumes?q=${query}&orderBy=${by}&${fields}&download=epub&maxResults=20`)
        .then(res => res.json())
        .then(data => _itemsChanged(data.items))
        .catch((e) => console.error(e, `Search books fetch error. query is ${query}`));
}