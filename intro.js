/*
    1. 자바스크립트 (Javascript) 란?
        
        >>> 자바스크립트(JavaScript)는 객체(object) 기반의 [ 스크립트 언어 (script language) ]입니다.
            HTML로는 웹의 내용을 작성하고, CSS로는 웹을 디자인하며, 자바스크립트로는 **웹의 동작을 구현**할 수 있습니다.

    2. <script></script> 태그를 사용하여 js 코드 작성 / 출력하기
    3. 다양한 방법으로 js 코드 출력하기
        1) window.alert() 메소드
        2) HTML DOM 요소를 이용한 innerHTML 프로퍼티
        3) document.write() 메소드
        4) console.log() 메소드
*/

// 1번
function alertDialogBox() {

    alert("확인을 누를 때까지 다른 작업을 할 수 없어요!");

}

// 2번
var str = document.getElementById("text");

str.innerHTML = "이 문장으로 바뀌었습니다!";

// 3번
document.write(4 * 5);

// 4번
console.log(4 * 5);