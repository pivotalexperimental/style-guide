(function($){
  var $window = $(window);
  var $content = $(".style-guide-content");
  var $sideBar = $(".style-guide-sidebar");
  var contentTop = $content.offset().top;

  function adjustScroll() {
    var windowScrollTop = $window.scrollTop();

    if (windowScrollTop > contentTop) {
      $sideBar.addClass("style-guide-fixed");
    } else {
      $sideBar.removeClass("style-guide-fixed");
    }
  }

  $window.scroll(function(){ setTimeout(adjustScroll, 1); });
})(window.jQuery);
