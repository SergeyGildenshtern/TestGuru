require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    config.load_defaults 6.1
    config.time_zone = 'Krasnoyarsk'
    config.active_record.schema_format = :ruby
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true

    config.autoload_paths << "#{Rails.root}/lib/clients"

    # Allowed tags and attributes
    config.action_view.sanitized_allowed_tags = %w[strong em a]
    config.action_view.sanitized_allowed_attributes = %w[href title]
  end
end
