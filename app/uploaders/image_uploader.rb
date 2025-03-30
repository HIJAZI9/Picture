class ImageUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file # Local storage for simplicity

  # Set the directory where the uploaded files will be stored
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # to resize the uploaded image.
   version :thumb do
     process resize_to_fit: [300, 300]
   end

  # black and white version
   version :black_and_white do
     process :convert_to_black_and_white
     process resize_to_limit: [300, 300]  # Resize to a limit of 800x800 (or any size you want)
   end

  # method to convert image to black and white version
   def convert_to_black_and_white
     manipulate! do |img|
       Rails.logger.info("Converting image to black and white...")
       img.colorspace('Gray')  # Convert the image to grayscale
       img
     end
   end
  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_allowlist
     %w(jpg jpeg gif png)
   end

end
