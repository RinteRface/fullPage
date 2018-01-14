var fullPageBinding = new Shiny.InputBinding();
$.extend(fullPageBinding, {
  find: function(scope) {
    return $(scope).find(".fullPageBinding");
  },
  getValue: function(el) {
    console.log($(el).data('anchor'));
    return Math.random();
  },
  setValue: function(el, value) {
    Math.random();
  },
  subscribe: function(el, callback) {
    $(el).on("active.fullPageBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".fullPageBinding");
  }
});

Shiny.inputBindings.register(fullPageBinding);
