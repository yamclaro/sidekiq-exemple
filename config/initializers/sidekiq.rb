# config/initializers/sidekiq.rb

require "sidekiq"
require "sidekiq-cron"

# Configuração do Sidekiq para o servidor
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/1' }

  # Carrega jobs cron definidos no arquivo YAML
  schedule_file = Rails.root.join("config", "sidekiq_cron.yml")
  if File.exist?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

# Configuração do Sidekiq para o cliente
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/1' }
end
