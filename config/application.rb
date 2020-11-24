require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
module CatMarketplace
  class Application < Rails::Application # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.generators.helper = false
    config.generators.assets = false
    config.assets.paths << Rails.root.join("app", "assets", "images")
    # the framework and any gems in your application.
  end
end
