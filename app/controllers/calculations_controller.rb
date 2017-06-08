class CalculationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    result = CalculateYieldLoan.call invested_sum: calc_params[:sum]

    respond_to do |format|
      if result.success?
        format.html
        format.js {
          render :create, locals: {
            expected_result: result.expected_result,
            hisotric_result: result.hisotric_result,
            message: 'Расчёт готов'
          },
          status: :created
        }
      else
        format.html
        format.js { render :error, locals: { message: result.errors }, status: :unprocessable_entity }
      end
    end
  end

  private

  def calc_params
    params.require(:sum)
  end
end
