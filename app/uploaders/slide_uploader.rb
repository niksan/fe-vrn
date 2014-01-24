# encoding: utf-8

class SlideUploader < CarrierWave::Uploader::Base

  include UploadImage

  version :thumb do
    process resize_to_fill: [100, 100]
  end

  version :small do
    process resize_to_fill: [190, 130]
  end

  version :medium do
    process resize_to_fill: [940, 200]
  end

end
