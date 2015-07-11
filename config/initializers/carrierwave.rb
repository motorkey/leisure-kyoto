CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAJP3N4SCVIYM3RACA',
    :aws_secret_access_key  => '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',
    :region => 'ap-northeast-1'
  }
  config.fog_directory = 'leisure-images'
end
