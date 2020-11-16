// $('.navbar .dropdown').hover(function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();
//   }, function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp()
//   });

// // Add slideup & fadein animation to dropdown
// $('.dropdown').on('show.bs.dropdown', function(e){
//     var $dropdown = $(this).find('.dropdown-menu');
//     var orig_margin_top = parseInt($dropdown.css('margin-top'));
//     $dropdown.css({'margin-top': (orig_margin_top + 10) + 'px', opacity: 0}).animate({'margin-top': orig_margin_top + 'px', opacity: 1}, 300, function(){
//        $(this).css({'margin-top':''});
//     });
//  });
//  // Add slidedown & fadeout animation to dropdown
//  $('.dropdown').on('hide.bs.dropdown', function(e){
//     var $dropdown = $(this).find('.dropdown-menu');
//     var orig_margin_top = parseInt($dropdown.css('margin-top'));
//     $dropdown.css({'margin-top': orig_margin_top + 'px', opacity: 1, display: 'block'}).animate({'margin-top': (orig_margin_top + 10) + 'px', opacity: 0}, 300, function(){
//        $(this).css({'margin-top':'', display:''});
//     });
//  });

// $('.dropdown-toggle').click(function() {
//     $(this).next('.dropdown-menu').slideToggle(500);
// });

// $('.navbar .dropdown').hover(function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400);
//     }, function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400)
//     });

// $('.navbar .dropdown').hover(function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400);
//     }, function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400)
//     });

$('.dropdown-toggle').click(function () {
    $(this).next('.dropdown-menu').slideToggle(300);
});

$('.dropdown-toggle').focusout(function () {
    $(this).next('.dropdown-menu').slideUp(300);
})

// $('.dropdown')
//   .on('show.bs.dropdown', function() {
//     $(this).find('.dropdown-menu').first().stop(true, true).slideDown(300);
//   })
//   .on('hide.bs.dropdown', function() {
//     $(this).find('.dropdown-menu').first().stop(true, false).slideUp(300, function() {
//       $(this).parent().removeClass('open');
//     });
//   })
//   .on('hidden.bs.dropdown', function() {
//     $(this).addClass('open');
//   });




