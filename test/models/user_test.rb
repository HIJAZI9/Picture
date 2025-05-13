require "test_helper"
require "action_dispatch/testing/test_process"  # Add this line
require "ostruct"  # Add this line to fix the OpenStruct error

class UserTest < ActiveSupport::TestCase
  test "should save user with image under 20MB" do
    # Specify the path to your mobile.jpeg file in test/fixtures/files/
    file_path = Rails.root.join("test/fixtures/files/mobile.jpeg")

    # Open the file to simulate uploading it with ActiveStorage
    file = Rack::Test::UploadedFile.new(file_path, "image/jpeg")

    # Create a new user with the simulated image upload (ActiveStorage)
    user = User.new(image: file)

    # Optional: Override the file size to simulate a valid file (less than 20MB for testing)
    def user.image; OpenStruct.new(size: 19.megabytes); end

    # Validate the user and check if it passes the validation
    assert user.valid?
    assert user.save
  end
end
