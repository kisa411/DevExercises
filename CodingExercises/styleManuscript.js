
 
$(document).ready(function(){
	//button 1 - increase font size
	$("#incFont").click(function() {
		console.log("incsize function called");
		var fontSize = parseInt($("body").css("font-size"));
		console.log(fontSize);
		fontSize = fontSize + 2 + "px";
		console.log(fontSize);
		$("body").css({'font-size':fontSize});
	});
	//button 2 - drecrease font size
	$("#decFont").click(function() {
		console.log("decsize function called");
		var fontSize = parseInt($("body").css("font-size"));
		console.log(fontSize);
		if (fontSize>10) { //only decrease font size until 4px
			fontSize = fontSize - 2 + "px";
			console.log(fontSize);
			$("body").css({'font-size':fontSize});
		}
	});
	//button 3 - change background color
	$("#backColor").click(function() {
		console.log("background color function called");
		if (document.body.style.backgroundColor != "blue") {
			document.body.style.backgroundColor = "blue";
			document.body.style.color = "white";
		} else {
			document.body.style.backgroundColor = "white";
			document.body.style.color = "black";
		}
	});
	//button 4 - change text color
	$("#textColor").click(function() {
		console.log("text color function called");
		var div = document.getElementById("information");
		if (div.style.color != "purple") {
			div.style.color = "purple";
		} else {
			div.style.color = "black";
		}
	});
	//button 5 - increase title size
	$("#titleSize").click(function() {
		console.log("title size function called");
		var fontSize = parseInt($("h4").css("font-size"));
		console.log(fontSize);
		fontSize = fontSize + 2 + "px";
		console.log(fontSize);
		$("h4").css({'font-size':fontSize});
	});
	//button 6 - hide buttons
	$("#hidden").click(function() {
		console.log("hide function called");
		$(".hide").hide();
	});
	//button 7 - show buttons
	$("#show").click(function() {
		console.log("show function called");
		$(".hide").show();
	});
});











