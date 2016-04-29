CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAI7YSCCLFSTIGTAJA',  # if storing key in default fog config file, use ENV['AWS_ACCESS_KEY_ID']
    aws_secret_access_key: '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',  # if storing key in default fog config file, use ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = ['topthat.avatars']
  config.fog_public     = false                                            # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end