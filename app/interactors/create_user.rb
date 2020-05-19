class CreateUser
  include Interactor

  def call
    user = User.create(context.user_params)

    if user.persisted?
      context.user = user
    else
      context.fails!
    end
  end

  def rollback
    context.user.destroy
  end
end
