# frozen_string_literal: true

module UsersHelper
  def user_params
    params.require(:user).permit(:username)
  end

  def previous_created?
    @previous_created.count.positive? ? 'Previous: ' : 'No previous events'
  end

  def upcoming_created?
    @upcoming_created.count.positive? ? 'Upcoming: ' : 'No upcomming events'
  end

  def previous?
    @previous.count.positive? ? 'Previous: ' : 'No previous events'
  end

  def upcoming?
    @upcoming.count.positive? ? 'Upcoming: ' : 'No upcomming events'
  end

  def user_name_in_title
    if !current_user.nil? && current_user.id == @user.id
      "Welcome #{current_user.username}"
    else
      "Profile of #{@user.username}"
    end
  end

  def user_name_in_list
    if !current_user.nil? && @user.id == current_user.id
      'you'
    else
      @user.username
    end
  end
end
