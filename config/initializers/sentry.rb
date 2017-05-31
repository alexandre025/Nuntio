Raven.configure do |config|
  config.dsn = 'https://0cef0666a1c448d5af0f43cb7c6dd207:2f21b1c580f241189b20778964ac80e6@sentry.io/174413'
  config.environments = ['production']
  config.silence_ready = true
  config.tags = { environment: Rails.env }
end
