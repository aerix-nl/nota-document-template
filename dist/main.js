(function() {
  'use strict';
  var base, dependencies;

  (base = Function.prototype).bind || (base.bind = function(_this) {
    return (function(_this) {
      return function() {
        return _this.apply(_this, arguments);
      };
    })(this);
  });

  requirejs.config({
    baseUrl: '../',
    paths: {
      'css-regions': 'css-regions-polyfill/css-regions-polyfill'
    }
  });

  dependencies = ['css-regions'];

  define(dependencies, function(css) {
    console.log("CSS Regions polyfill loaded");
    return window.requestAnimationFrame = function(f) {
      return setTimeout(f, 16);
    };
  });

}).call(this);
