//button 1 - increase font size
window.onload=function(){
	var el = document.getElementById("incFont");
	el.addEventListener("click", incSize); 
}

function incSize(fontChange=2) {
	console.log("incsize function called");
    var div = document.getElementById("information");
	var originalSize = div.style.fontSize.replace("px", "");

	div.style.fontSize = parseInt(originalSize) + parseInt(fontChange) + "px";
}

//button 2 - drecrease font size
var el = document.getElementById("decFont");
el.addEventListener("click", decSize); 

function decSize(fontChange=2) {
	console.log("decSize function called!");
    var div = document.getElementById("information");
	var originalSize = div.style.fontSize.replace("px", "");

	div.style.fontSize = parseInt(originalSize) + parseInt(fontChange) + "px";
}

//button 3 - change background color
window.onload=function(){
	var el = document.getElementById("backColor");
	el.addEventListener("click", changeBackgroundColor); 
}

function changeBackgroundColor() {
		console.log("backgroundcolor function called!");
    if (document.body.style.backgroundColor != "blue") {
		document.body.style.backgroundColor = "blue";
		document.body.style.fontColor = "white";
	} else {
		document.body.style.backgroundColor = "white";
		document.body.style.fontColor = "black";
	}
}

//button 4 - change text color
window.onload=function(){
	var el = document.getElementById("textColor");
	if (el) {
		el.addEventListener("click", changeTextColor); 
}

function changeTextColor() {
		console.log("textcolor function called!");
    var div = document.getElementById("information");
	if (div.style.color != "purple") {
		div.style.color = "purple";
	} else {
		div.style.color = "black";
	}
}

//button 5 - change picture size
window.onload=function(){
	var el = document.getElementById("titleSize");
	el.addEventListener("click", increaseTitle); 
}
var el = document.getElementById("titleSize");
el.addEventListener("click", increaseTitle); 

function increaseTitle(fontChange=10) {
		console.log("title function called!");
    var div = document.getElementById("title");
	var originalSize = div.style.fontSize.replace("px", "");

	div.style.fontSize = parseInt(originalSize) + parseInt(fontChange) + "px";
}


