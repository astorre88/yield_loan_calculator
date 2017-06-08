class CalculationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    head :ok
  end

  private

  def calc_params
    params.require(:sum)
  end
end
