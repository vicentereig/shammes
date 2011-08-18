# Gemfile
gem "therubyracer-heroku"

# config/initializers/barista_config.rb
Barista.configure do |c|
  c.root = Rails.root.join("app", "coffeescripts")
  c.output_root = Rails.root.join("tmp", "javascripts")
end

require 'fileutils'

Rails.configuration.middleware.delete('Barista::Filter')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Barista::Filter')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/javascripts'],
    :root => "#{Rails.root}/tmp")