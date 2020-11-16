(function(){
	 var url = ""
	 
	// JSON
	url = "http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=540anfdbdfd14p9b&locale=kr&category=c1";
	$.ajax({
		url :  url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success") 
				parseJSON(data);
		}
	 });
	
})(); // end getList();

function parseJSON(jsonObj){
    var items = jsonObj.items;
    var img = $(".card");
	for (var i = 0; i < 9; i++) { 
        var randomNum = parseInt(Math.random() * items.length);
        
		img.eq(i).find(".card-img-top").css("background-image", "url(" + items[randomNum].repPhoto.photoid.thumbnailpath + ")");
		img.eq(i).find(".card-title").text(items[randomNum].title);
		img.eq(i).find(".card-sub-title").text(items[randomNum].address.split(" ")[1] + " " + items[randomNum].address.split(" ")[2]);
		img.eq(i).find(".card-text").text(items[randomNum].phoneno);
	} // end for


} // end parseJSON()