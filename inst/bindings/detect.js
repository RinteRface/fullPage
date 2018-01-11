$(document).on("focus", ".fullPageBinding", function() {

  var el = $('.fullPageBinding.active').attr('id');

  // Raise an event to signal that the value changed
  el.trigger("focus");
});

console.log($('.section.active').attr('id'));

var fullPageBinding = new Shiny.InputBinding();

$.extend(fullPageBinding, {
  find: function(scope) {
    console.log($(scope).find(".fullPageBinding"));
    return $(scope).find(".fullPageBinding");
  },
  getValue: function(el) {
    return parseInt($(el).attr('id'));
  },
  setValue: function(el, value) {
    $(el).text(value);
  },
  subscribe: function(el, callback) {
    $(el).on("focus.fullPageBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".fullPageBinding");
  }
});

Shiny.inputBindings.register(fullPageBinding);
