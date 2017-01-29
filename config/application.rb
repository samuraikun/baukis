require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Baukis
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators.template_engine = :slim
    config.action_controller.permit_all_parameters = true
    config.time_zone = 'Tokyo'
    config.i18n.load_path +=
      Dir[Rails.root.join('config', 'locales', '**', '*{rb.yml}').to_s]
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.helper false
      g.assets false
      g.test_framework :rspec
      g.controller_specs false
      g.view_specs false
    end
  end
end
