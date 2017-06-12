class UsersController < ApplicationController
  def create
    result = AddUserData.call params: user_params

    respond_to do |format|
      if result.success?
        format.html
        format.js { render :create, locals: { message: 'Пользователь добавлен' }, status: :created }
      else
        format.html
        format.js { render :error, locals: { message: result.errors }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, payments_attributes: [:id, :overdued, :_destroy])
  end
end
