# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base

  include Uploader

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :small do
    process resize_to_fill: [200, 200]
  end

  version :medium do
    process resize_to_fit: [1200, 800]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
