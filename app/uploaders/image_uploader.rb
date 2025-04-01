class ImageUploader < CarrierWave::Uploader::Base
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # Local storage for simplicity
  storage :file

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
     process resize_to_limit: [300, 300]  # Resize to a limit
   end

  # method to convert image to black and white version
   def convert_to_black_and_white
     manipulate! do |img|
       Rails.logger.info("Converting image to black and white.")
       img.colorspace('Gray')  # Convert the image to grayscale
       img
     end
   end

   def generate_histogram_data
     Rails.logger.info("Generating histogram data.")

     manipulate! do |img|
       # Convert the image to grayscale before generating the histogram
       img.colorspace('Gray')

       # Get pixel data
       pixel_data = img.get_pixels.flatten  # Flatten to get all pixel intensities in one array

       # Count the occurrences of each intensity level (0-255)
       histogram_data = Array.new(256, 0)
       pixel_data.each do |pixel|
         histogram_data[pixel] += 1
       end

       Rails.logger.info("Histogram data generated.")

       # Return the histogram data
       return histogram_data
     end
   end

   def generate_rgb_scatter_data
     return [] unless file.present?

     Rails.logger.info("Generating RGB scatter data.")

     image_path = file.file  # Get the actual file path
     return [] unless File.exist?(image_path)   # Ensure the file exists before processing

     # Load the image and resize it to speed up processing
     resized_image = MiniMagick::Image.open(image_path)
     resized_image.resize "200x200"  # Reduce image size to 200x200 pixels

     pixels = resized_image.get_pixels   # Get the pixel data as a 2D array
     scatter_data = { red: [], green: [], blue: [] }  # Initialize hash to store RGB values

     pixels.each_with_index do |row, y|
       row.each_with_index do |pixel, x|
         # Extract RGB values
         red, green, blue = pixel[0], pixel[1], pixel[2]

         # Store the RGB values along with their x-coordinate position
         scatter_data[:red] << { x: x, y: red }
         scatter_data[:green] << { x: x, y: green }
         scatter_data[:blue] << { x: x, y: blue }
       end
     end

     Rails.logger.info("RGB scatter data generated successfully.")
     scatter_data  # Return the structured scatter data
   end

  # Add an allowlist of extensions which are allowed to be uploaded.
   def extension_allowlist
     %w(jpg jpeg gif png)
   end

end
