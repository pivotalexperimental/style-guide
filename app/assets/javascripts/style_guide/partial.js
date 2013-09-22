;(function() {
  var $forms = document.querySelectorAll(".style-guide-partial form");
  var $links = document.querySelectorAll(".style-guide-partial [href]");
  var $sources = document.querySelectorAll(".style-guide-partial-source");

  function eventDefaultPreventer(event) {
    event.preventDefault();
  }

  function preventDefaultOn(elements, eventName) {
    for (var i = 0, element; element = elements[i]; i++) {
      element.addEventListener(eventName, eventDefaultPreventer, false);
    }
  }

  preventDefaultOn($forms, 'submit');
  preventDefaultOn($sources, 'click');
  preventDefaultOn($links, 'click');
})();
