(function($) {
  $(function(){
    $(".style-guide-partial [href^=#], .style-guide-partial-source").click(function(e) {
      e.preventDefault();
    });
    window.prettyPrint && prettyPrint();
  });
})(window.jQuery);
