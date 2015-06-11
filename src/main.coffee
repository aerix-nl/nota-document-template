'use strict'

# Workaround to suppress PhantomJS warnings in certain versions
Function.prototype.bind ||= ( _this ) -> => @apply(_this, arguments)

# We use requireJS to load dependencies
requirejs.config {
  baseUrl: '../'
  paths:
    'css-regions':        'css-regions-polyfill/css-regions-polyfill'
}

# In the above config not all dependencies are declared because
# some of them which this template depends on (e.g. Backbone, _)
# have already been made available by Nota client earlier.
dependencies = [
  'css-regions'
]

# We receive the dependencies as args in the same order as they are in the array
define dependencies, ( css )->
  console.log "CSS Regions polyfill loaded"
  # https://github.com/FremyCompany/css-regions-polyfill/issues/21#issuecomment-101338966
  window.requestAnimationFrame = (f)-> return setTimeout(f, 16)

