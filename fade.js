$(window).scroll(function() {
  var scrollTop = $(this).scrollTop();
  $('.header-overlay').css({
    opacity: function() {
      var elementHeight = $(this).height();
      return 1 - (elementHeight - scrollTop) / elementHeight;
    }
  });
});
