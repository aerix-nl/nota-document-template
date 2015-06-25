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
}

# In the above config not all dependencies are declared because
# some of them which this template depends on (e.g. Backbone, _)
# have already been made available by Nota client earlier.
dependencies = [
  'jquery'
  'css-regions'
  'marked'
  'text!../document.md'
]

# We receive the dependencies as args in the same order as they are in the array
define dependencies, ( $, css, marked, document )->
  console.log "CSS Regions polyfill loaded"
  html = marked document
  console.log html
  $('div.cover.page').html html

