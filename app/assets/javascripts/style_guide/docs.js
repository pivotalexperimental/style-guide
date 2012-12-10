(function($) {
  $(function(){
    $(".style-guide-example [href^=#]").click(function(e) {
      e.preventDefault();
    });

    window.prettyPrint && prettyPrint();
  });
})(window.jQuery);
