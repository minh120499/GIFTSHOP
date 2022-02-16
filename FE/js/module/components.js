export function componentHTML() {
  $(function () {
    var includes = $('[data-include]');
    $.each(includes, function () {
      var file = './' + $(this).data('include') + '.html';
      $(this).load(file);
    });
  });
}

export function indexComponentHTML() {
  var indexIncludes = $('[data-include]');
  $.each(indexIncludes, function () {
    var file = './layout/' + $(this).data('include') + '.html';
    $(this).load(file);
  });
}
