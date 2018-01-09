$(document).ready(function () {

  var fullPageBinding = new Shiny.InputBinding();
  $.extend(fullPageBinding, {
    find: function (scope) {
      console.log(11);
      return $(scope).find(".fullPageBinding");
    },
    getId: function (el){
      $(el).attr('id');
    },
    getValue: function (el) {
      return parseInt(Math.random());
    },
    subscribe: function (el, callback) {
      $(el).on("mouseenter.fullPageBinding", function (e) {
        console.log(22);
        callback();
      });
    },
    unsubscribe: function (el) {
      $(el).off(".fullPageBinding");
    }
  });

  Shiny.inputBindings.register(fullPageBinding);
});
