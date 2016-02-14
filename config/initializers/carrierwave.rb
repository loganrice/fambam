CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: Rails.application.secrets.aws_region
  }
  config.fog_directory = Rails.application.secrets.aws_bucket_name
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end
