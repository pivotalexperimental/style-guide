;(function(){
  var $identifiers = document.querySelectorAll(".style-guide-partial-identifiers code");
  var highlightPattern = new RegExp('(\\s|^)style-guide-identifier-highlight(\\s|$)');

  function addHighlight(elements) {
    for (var i = 0, element; element = elements[i]; i++) {
      element.className += " style-guide-identifier-highlight";
    }
  }

  function removeHighlight(elements) {
    for (var i = 0, element; element = elements[i]; i++) {
      element.className = element.className.replace(highlightPattern, ' ');
    }
  }

  function identifierHighlighter(event) {
    var selector = event.target.innerHTML;
    var $selected = document.querySelectorAll(selector);
    addHighlight($selected);
  }

  function identifierHighlightRemover(event) {
    var $highlighted = document.querySelectorAll(".style-guide-identifier-highlight");
    removeHighlight($highlighted);
  }

  function highlightOnHover(elements) {
    for (var i = 0, element; element = elements[i]; i++) {
      element.onmouseover = identifierHighlighter;
      element.onmouseout = identifierHighlightRemover;
    }
  }

  highlightOnHover($identifiers);
})();