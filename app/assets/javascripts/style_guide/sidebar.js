;(function(){
  var $content = document.querySelectorAll(".style-guide-content")[0];
  var $sideBar = document.querySelectorAll(".style-guide-sidebar")[0];
  var contentTop = $content.offsetTop;

  function isSideBarFixed() {
    var windowScrollTop = window.scrollY;
    return windowScrollTop > contentTop;
  }

  function adjustScroll() {
    if (isSideBarFixed()) {
      $sideBar.className = "style-guide-sidebar style-guide-fixed";
    } else {
      $sideBar.className = "style-guide-sidebar";
    }
  }

  window.onscroll = function(){ setTimeout(adjustScroll, 1); };
})();
