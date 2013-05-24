class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  #def default_url
  #"/images/fallback/" + [version_name, "default.jpeg"].compact.join('_')
  #end

  # Create different versions of your uploaded files:

  version :full do
    process :resize_to_fit => [500, 500]
  end

  version :preview do
    process :resize_to_fill => [115, 115]
  end

  version :large do
    process :resize_to_fill => [128, 128]
  end

  version :thumb do
    process :resize_to_fill => [64, 64]
  end

  version :small do
    process :resize_to_fill => [48, 48]
  end

  version :mini do
    process :resize_to_fill => [32, 32]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
