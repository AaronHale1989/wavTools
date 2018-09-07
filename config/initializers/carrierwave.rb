require 'fog/aws'
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['S3_ACCESS_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET_KEY'],
        :region => "us-east-2",
        :endpoint => 'https://s3-us-east-2.amazonaws.com'
      }
      config.fog_directory = ENV['S3_BUCKET']
      config.fog_public     = true
      config.cache_dir = "#{Rails.root}/tmp/uploads"

      case Rails.env
  when 'production'
    config.fog_directory = ENV['S3_BUCKET']
    config.asset_host = 'https://s3-us-east-2.amazonaws.com/wavtools'

  when 'development'
    config.fog_directory = ENV['S3_BUCKET']
    config.asset_host = 'https://s3-us-east-2.amazonaws.com/wavtools'
    end
end
