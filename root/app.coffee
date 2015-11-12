axis         = require 'axis'
rupture      = require 'rupture'
jeet         = require 'jeet'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'

module.exports =
  ignores: [
    'readme.md',
    '**/layout.*',
    '**/_*',
    'assets/css/1-global/**/*',
    'assets/css/2-components/**/*',
    'assets/css/3-layouts/**/*',
    'assets/css/4-vendor/**/*',
    '.gitignore',
    'ship.*conf'
  ]

  extensions: [
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer(), jeet()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true
