class UsersController < ApplicationController
  include UsersHelper

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      current_user_set(@user.id)
      redirect_to @user
    else
      render :new
    end
  end

end
