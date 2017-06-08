require 'spec_helper'

RSpec.describe CalculateYieldLoan, type: :interactor do
  subject { CalculateYieldLoan }

  before do
    @invested_sum = 1_000_000

    {
      'ЮЛ1' => [191_666.67, 191_666.67, 191_666.67, 191_666.67, 191_666.67, 191_666.67],
      'ЮЛ2' => [191_666.67, 191_666.67, 191_666.67, 525_000.00, 0, 0],
      'ЮЛ3' => [191_666.67, 191_666.67, 208_333.33, 208_333.33, 208_333.33, 208_333.33]
    }.each do |name, payments|
      u = create(:user, name: name)
      payments.each do |amount|
        create(:payment, amount: amount, user: u)
      end
    end

    @result = subject.call(invested_sum: @invested_sum)
  end

  it 'succeeds' do
    expect(@result.success?)
      .to be true
  end

  it 'calculates expected result' do
    expect(@result.expected_result)
      .to eq(0.3)
  end

  it 'calculates expected result' do
    expect(@result.hisotric_result)
      .to be_within(0.002).of(0.31)
  end
end
