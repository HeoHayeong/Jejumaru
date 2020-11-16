
$( window ).scroll(function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.topBtn' ).fadeIn();
	} else {
		$( '.topBtn' ).fadeOut();
	}
} );


// visitJeju Api_Key
var api_key = "5741556e616b6a303131336e7153567a";
var personNum = 1;

$(document).ready(function(){
	$( '.topBtn' ).click( function() {
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		return false;
	} );
	
	var jeju_url = 
			"http://api.visitjeju.net/vsjApi/contents/searchList?apiKey="
				+api_key+"&locale=kr&category=c1";
	
		 
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success")
				parseJSON(data);
		}

	});
		
	
	
	
});



