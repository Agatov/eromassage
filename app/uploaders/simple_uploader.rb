# encoding: utf-8

class SimpleUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

end