require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nbavis
  class Application < Rails::Application
    config.generators.assets = false
    config.generators.helper = false
    config.generators do |g|
      g.fixture_replacement :machinist
      g.view_specs false
      g.helper_specs false
    end

    config.i18n.available_locales         = %w(pt-BR)
    config.i18n.default_locale            = :'pt-BR'
    config.i18n.locale                    = :'pt-BR'
    config.time_zone                      = 'Brasilia'
  end
end
