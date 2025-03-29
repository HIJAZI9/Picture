class MainController < ApplicationController
  def index
    @user = User.new  # Initialize a new user object
  end

  def create
    @user = User.create(user_params)
    # Check if the user was created successfully
    if @user.persisted?
      # Only redirect to show_uploaded_image_path
      redirect_to show_uploaded_image_path(@user.id), notice: "Image uploaded successfully!"
    else
      # If there was an issue, render the index view again with an alert
      render :index, alert: "Image upload failed."
    end
  end

  def show
    @user = User.find(params[:id])  # Find the user by ID to display the uploaded image
  end

  def delete_user_and_image
    @user = User.find(params[:id])  # You need to find the user before calling destroy
    @user.destroy
    redirect_to root_path, notice: "User and image deleted successfully."
  end

  private

  # Permit the image parameter
  def user_params
    params.require(:user).permit(:image)
  end
end
