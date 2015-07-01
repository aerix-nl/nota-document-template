'use strict'

# Workaround to suppress PhantomJS warnings in certain versions
Function.prototype.bind ||= ( _this ) -> => @apply(_this, arguments)

# We use requireJS to load dependencies
requirejs.config {
  baseUrl: '../bower_components/'
  paths:
    'css-regions':        '../css-regions-polyfill/css-regions-polyfill'
    'jquery':             'jquery/dist/jquery'
    'marked':             'marked/lib/marked'
    'text':               'requirejs-text/text'
    'mathjax':            'MathJax/MathJax.js?config=TeX-AMS_HTML-full'
}

# In the above config not all dependencies are declared because
# some of them which this template depends on (e.g. Backbone, _)
# have already been made available by Nota client earlier.
dependencies = [
  'jquery'
  'css-regions'
  'marked'
  'mathjax'
  'text!../document.md'
]

# We receive the dependencies as args in the same order as they are in the array
define dependencies, ( $, css, marked, mathjax, document )->
  console.log "CSS Regions polyfill loaded"

  content = marked document
  console.log "Markdown parsed"

  $('div.cover.page').html content
  console.log "Document content inserted"

  MathJax.Hub.Config
    "HTML-CSS":
      availableFonts: ["Latin Modern Roman","TeX"]
      preferredFont: "TeX"

  MathJax.Hub.Queue ["Typeset", MathJax.Hub, $('div#MathDiv')[0]]

  # html2 = $ "<p>
  # When $a \ne 0$, there are two solutions to \(ax^2 + bx + c = 0\) and they are
  # $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$
  # </p>"
  # setTimeout (-> 
  #   # ex = window.document.getElementById("a")
  #   # console.log ex

  #   math = MathJax.Hub.getAllJax("MathDiv")[0]
  #   console.log math
  #   MathJax.Hub.Queue(["Text",math,"x+1"]);

  #   # MathJax.Hub.Queue ["Typeset", MathJax.Hub, ex]
  #   # MathJax.Hub.Queue -> console.log arguments
  #   # MathJax.Hub.Queue -> MathJax.Hub.Typeset(ex)
  #   ), 3000


