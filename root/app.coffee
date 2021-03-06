<% stylus_exts = ''; yaml_ext = ''; postcss_exts = ''; -%>
<%
  if (grid == true) { stylus_exts = 'grid(), '; postcss_exts = 'lost(), '; }
-%>
axis         = require 'axis'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
poststylus   = require 'poststylus'
rupture      = require 'rupture'
<% if (grid == true) { %>
grid         = require 'jeet'
lost         = require 'lost'
<% } %>
<% if (postcssPlugins["rucksack"] && postcssPlugins["rucksack"].checked) { %>
<% postcss_exts += 'rucksack(), '; -%>
rucksack     = require 'rucksack-css'
<% } %>
<% if (postcssPlugins["cssnext"] && postcssPlugins["cssnext"].checked) { %>
<% postcss_exts += 'cssnext(), '; -%>
cssnext      = require 'cssnext'
<% } %>
<% if (postcssPlugins["system"] && postcssPlugins["system"].checked) { %>
<% postcss_exts += 'system.postcss(), '; -%>
system       = require 'postcss-system'
<% } %>
<% if (postcssPlugins["postcss font pack"] && postcssPlugins["postcss font pack"].checked) { %>
<% postcss_exts += 'fontPack(), '; -%>
fontPack     = require 'postcss-font-pack'
<% } %>
<% if (postcssPlugins["postcss import"] && postcssPlugins["postcss import"].checked) { %>
<% postcss_exts += 'atImport(), '; -%>
atImport     = require 'postcss-import'
<% } %>

module.exports =
  ignores: [
    'readme.md'
    '.DS_Store'
    '.travis.yml'
    '**/layout.*'
    '**/_*'
    'assets/css/_**/*'
    '**/*.swp'
    '.gitignore'
    '.git'
    '.editorconfig'
    'test/**'
  ]

  extensions: [
    js_pipeline(files: 'assets/js/**'),
    css_pipeline(files: 'assets/css/**')
  ]

  stylus:
    use: [axis(), rupture(), <%= stylus_exts %> poststylus(<%= postcss_exts %>), autoprefixer()]
    sourcemap: true
    'include css': true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true
