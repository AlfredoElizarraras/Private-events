class UsersController < ApplicationController
  include UsersHelper
  include ApplicationHelper

  def show
    @user = User.find(params[:id])
    @previous = @user.past_events
    @upcoming = @user.upcoming_events 
    @previous_created = @user.past_created_events
    @upcoming_created = @user.upcoming_created_events 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      current_user_set(@user.id)
      if visited_event.nil?
        redirect_to current_user
      else
        redirect_to visited_event
        visited_event_clear
      end
    else
      render :new
    end
  end

  def sign_in
    @user = User.new
  end

  def logging
    @user = User.find_by_username(params[:user][:username])

    if !@user.nil?
      current_user_set(@user.id)
      if visited_event.nil?
        redirect_to current_user
      else
        redirect_to visited_event
        visited_event_clear
      end
    else
      flash[:error]= "Could not find the user."
      @user = User.new( { username: params[:user][:username] } )
      render 'users/sign_in'
    end
  end

  def sign_out
    user_sign_out
    redirect_to root_path
  end

end
