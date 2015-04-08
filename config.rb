# Compass
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'

# Asset Uri (with trailing slash)
@http_prefix = '/'
if ENV['HTTP_PREFIX']
  @http_prefix = ENV['HTTP_PREFIX']
end
set :http_prefix, @http_prefix

# Make Bower files available to Sprockets
sprockets.append_path File.join root, 'bower_components'
sprockets.append_path File.join root, 'node_modules'

# Tweak Babel options
class ::Sprockets::Babel::Template
  def prepare
    @options = @options.merge({
      sourceMaps: 'inline',
      loose: %w{es6.classes es6.modules} # loose mode enables better IE <= 10 compatibility
    })
  end
end

# Output .js.es6 files as .js
def remap_es6_files(dir)
  Dir.foreach(File.join(config[:source], dir)) do |file|
    next if file == '.' or file == '..'

    path = File.join(dir, file)
    if File.directory?(File.join(config[:source], path))
      remap_es6_files(path)
    elsif file =~ /\.es6$/
      proxy path.gsub(/\.es6$/, ''), path
      ignore path
    elsif file =~ /\.es6\.erb$/
      proxy path.gsub(/\.es6\.erb$/, ''), path.gsub(/\.erb$/, '')
      ignore path
    end
  end
end

remap_es6_files(config[:js_dir])

# Dev-specific configuration
configure :development do
  set :debug_assets, true

  # reload page
  activate :livereload, :apply_js_live => true, :apply_css_live => true
  config[:file_watcher_ignore] << %r{\.idea\/}
end