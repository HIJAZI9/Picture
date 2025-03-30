class ImageUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file # Local storage for simplicity

  # Set the directory where the uploaded files will be stored
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # to convert any uploaded image into the PNG format.
   process :convert => 'png'
   def filename
     super.chomp(File.extname(super)) + '.png'
   end

  # to resize the uploaded image.
   version :resized_image do
     process :resize_and_pad => [300, 300]
   end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_allowlist
     %w(jpg jpeg gif png)
   end

end
