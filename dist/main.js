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
    baseUrl: '../bower_components/',
    paths: {
      'css-regions': '../css-regions-polyfill/css-regions-polyfill',
      'jquery': 'jquery/dist/jquery',
      'marked': 'marked/lib/marked',
      'text': 'requirejs-text/text'
    }
  });

  dependencies = ['jquery', 'css-regions', 'marked', 'text!../document.md'];

  define(dependencies, function($, css, marked, document) {
    var html;
    console.log("CSS Regions polyfill loaded");
    html = marked(document);
    console.log(html);
    return $('div.cover.page').html(html);
  });

}).call(this);
