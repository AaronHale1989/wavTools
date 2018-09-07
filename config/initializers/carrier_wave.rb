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
      config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
