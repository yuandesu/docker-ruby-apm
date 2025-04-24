require 'ddtrace'

Datadog.configure do |c|
  c.tracing.instrument :rails
  c.tracing.instrument :active_record, service_name: 'mysql2'
  c.tracing.instrument :redis if defined?(::Redis)
  c.tracing.instrument :http
  c.tracing.instrument :sidekiq if defined?(::Sidekiq)
  
  c.env = 'development'
  c.service = 'production'
  c.version = '1.0'
  
  c.tracing.analytics.enabled = true
  c.tracing.distributed_tracing.propagation_inject_style = ['datadog']
  c.tracing.distributed_tracing.propagation_extract_style = ['datadog']
  
  c.tracing.sampling.default_rate = 1.0
end 