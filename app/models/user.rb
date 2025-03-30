class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :image

  # Custom file size validation
  validate :image_size

  private

  # Check the image size of the uploaded image
  def image_size
    if image.size > 20.megabyte
      errors.add(:image, "should be less than 20MB")
    end
  end

end
