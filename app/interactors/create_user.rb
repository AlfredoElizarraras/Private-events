class CreateUser
  include Interactor

  def call
    user = User.new(context.user_params)

    if user.save
      context.user = user
    else
      context.message = user.errors.full_messages
      context.fails!
    end
  end

  def rollback
    context.user.destroy
  end
end
