class MainController < ApplicationController
  def index
    @user = User.new  # Initialize a new user object
  end

  def create

    # Check if an image was selected
    unless params[:user] && params[:user][:image].present?
      flash[:alert] = "Please choose an (jpg,jpeg,gif or png) image first."
      redirect_to root_path and return
    end

    @user = User.create(user_params)

    # Check if the user was created successfully
    if @user.persisted?
      # Only redirect to show_uploaded_image_path
      redirect_to show_uploaded_image_path(@user.id), notice: "Image uploaded successfully!"
    else
      # If there was an issue, render the index view again with an alert
      flash[:alert] = "Failed to upload image."
      render :index, alert: "Image upload failed."
    end
  end

  def show
    @user = User.find(params[:id])  # Find the user by ID to display the uploaded image

    # Check if the user has an uploaded image
    if @user.image.present?
      # Generate histogram data from the user's image
      @histogram_data = @user.image.generate_histogram_data

      # Generate scatter plot data from the user's image
      @scatter_data = @user.image.generate_rgb_scatter_data
    end
  end


  private

  # Permit the image parameter
  def user_params
    params.require(:user).permit(:image)
  end
end
