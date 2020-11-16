
$( window ).scroll(function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.topBtn' ).fadeIn();
	} else {
		$( '.topBtn' ).fadeOut();
	}
} );




$(document).ready(function(){
	$( '.topBtn' ).click( function() {
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		return false;
	} );

});

