require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should save user with image under 20MB" do
    file_path = Rails.root.join("test/fixtures/files/mobile.jpeg")
    file = File.open(file_path)

    user = User.new(image: file)

    assert user.valid?, -> { "User should be valid. Errors: #{user.errors.full_messages.join(', ')}" }
    assert user.save, "User should save successfully"
  end
end
