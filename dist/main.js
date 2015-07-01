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
      'text': 'requirejs-text/text',
      'mathjax': 'MathJax/MathJax.js?config=TeX-AMS_HTML-full'
    }
  });

  dependencies = ['jquery', 'css-regions', 'marked', 'mathjax', 'text!../document.md'];

  define(dependencies, function($, css, marked, mathjax, document) {
    var content;
    console.log("CSS Regions polyfill loaded");
    content = marked(document);
    console.log("Markdown parsed");
    $('div.cover.page').html(content);
    console.log("Document content inserted");
    MathJax.Hub.Config({
      "HTML-CSS": {
        availableFonts: ["Latin Modern Roman", "TeX"],
        preferredFont: "TeX"
      }
    });
    return MathJax.Hub.Queue(["Typeset", MathJax.Hub, $('div#MathDiv')[0]]);
  });

}).call(this);
