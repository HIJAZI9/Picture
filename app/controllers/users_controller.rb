class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  # DELETE /users/:id
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Finds the user by ID before specific actions (destroy)
  def set_user
    @user = User.find(params[:id])
  end
end
