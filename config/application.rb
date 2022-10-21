require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Ufcwarehouse
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true
  end
end
