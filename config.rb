require 'builder'
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates

class WebHelpers < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def author_social(author_tuple)
      "http://twitter.com/#{author_tuple.split("/")[2]}"
    end

    def author_gravatar(author_tuple, size=32)
      gravatar(author_tuple.split("/")[1], size)
    end

    def author_name(author_tuple)
      author_tuple.split("/")[0]
    end

    def gravatar(email, size=32)
      "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.chomp.downcase)}?s=#{size}.jpg"
    end
  end
end

::Middleman::Extensions.register(:web_helpers, WebHelpers)
activate :web_helpers

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'


ready do
  sprockets.append_path File.join root, 'bower_components'
  #sprokets.import_asset 'normalize.css'
end

activate :authors do |authors|
  authors.author_template = "blog/author.html"
end


activate :syntax
set :markdown_engine, :kramdown

activate :blog do |blog|
  blog.prefix = "blog"
  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"
end


page "/blog/feed.xml", layout: false
  # Use relative URLs

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  activate :relative_assets
  set :relative_links, true

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
