require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MicrosoftGithubRailsTraining
  class Application < Rails::Application
    config.load_defaults 6.0
    config.active_job.queue_adapter = :resque
  end
end
