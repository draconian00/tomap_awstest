CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI2HMCWVQL7IF22EA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
    
  }
  config.fog_directory  = 'tomapprofile'                          # required
 
end