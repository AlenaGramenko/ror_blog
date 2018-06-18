import "./page.css"

window.onload = function() {
  let elem = document.getElementById("hello");
  if (elem) {
    console.log(elem.innerText);
    document.body.insertAdjacentHTML("afterbegin", elem.innerText);
  }
};
//alert("PAGE");