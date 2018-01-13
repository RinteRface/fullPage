var fullPageBinding = new Shiny.InputBinding();
$.extend(fullPageBinding, {
  find: function(scope) {
    return $(scope).find(".fullPageBinding");
  },
  getValue: function(el) {
    console.log($(el).attr('id'));
    return $(el).attr('id');
  },
  setValue: function(el, value) {
    $(el).attr('id');
  },
  subscribe: function(el, callback) {
    $(el).on("change.fullPageBinding", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".fullPageBinding");
  },
  getRatePolicy: function getRatePolicy() {
    return {
      policy: 'throttle',
      delay: 1000
    };
  }
});

Shiny.inputBindings.register(fullPageBinding);
