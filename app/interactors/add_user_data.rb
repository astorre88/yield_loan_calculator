class AddUserData
  include Interactor

  def call
    check_params

    init_user

    context.user.save
  end

  def check_params
    context.fail! errors: ['There is no params!'] unless context.params
  end

  def init_user
    context.user = User.new context.params
    context.user.payments.build

    context.fail! errors: context.user.errors.full_messages unless context.user.valid?
  end
end
