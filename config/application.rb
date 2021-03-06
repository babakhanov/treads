require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Treads
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.i18n.available_locales = :en
    config.i18n.default_locale = :en
    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :haml
    end
  end
end
