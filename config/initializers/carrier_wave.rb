require 'fog/aws'
if Rails.env.development?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY'],
        :region => "us-east-2",
      }
      config.fog_directory = ENV['S3_BUCKET']
      config.fog_public     = true
      config.cache_dir = "#{Rails.root}/tmp/uploads"

      case Rails.env
  when 'production'
    config.fog_directory = 'dummy'
    config.asset_host = 'https://s3-ap-us-east-1.amazonaws.com/dummy'

  when 'development'
    config.fog_directory = 'dev.dummy'
    config.asset_host = 'https://s3-ap-us-east-1.amazonaws.com/dev.dummy'

  when 'test'
    config.fog_directory = 'test.dummy'
    config.asset_host = 'https://s3-ap-us-east-1.amazonaws.com/test.dummy'
  end
end
