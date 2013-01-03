(function($) {
  $(function(){
    $(".style-guide-partial [href^=#], .style-guide-partial-source").click(function(e) {
      e.preventDefault();
    });
    
    $(".style-guide-partial-identifiers code").mouseover(function() {
      var identifier = $(this).text();
      $(this).closest(".style-guide-partial")
             .find(identifier)
             .addClass("style-guide-identifier-highlight");
    }).mouseout(function() {
      $(".style-guide-identifier-highlight").removeClass("style-guide-identifier-highlight");
    });
    
    window.prettyPrint && prettyPrint();
  });
})(window.jQuery);
