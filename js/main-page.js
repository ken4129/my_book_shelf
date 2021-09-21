'use strict';
function _onsubmit(e) {
    const q = e.target.elements["q"].value;
    if(!q) {
        window.alert('検索ワードを入力してください。');
        e.preventDefault(); // formタグのSubmitを止める
    }
    return;
}