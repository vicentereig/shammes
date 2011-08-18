# Gemfile
gem "therubyracer-heroku"

# config/initializers/barista_config.rb
Barista.configure do |c|
  c.root = Rails.root.join("app", "coffeescripts")
  c.output_root = Rails.env.production? ?  Rails.root.join("tmp", "javascripts") : Rails.root.join("public", "javascripts")
end

require 'fileutils'
root = Rails.env.production? ? "#{Rails.root}/tmp" : File.join(Rails.root, "public")
Rails.configuration.middleware.delete('Barista::Filter')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Barista::Filter')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/javascripts'],
    :root => root)