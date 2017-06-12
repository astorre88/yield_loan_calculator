require 'spec_helper'

RSpec.describe CalculateYieldLoan, type: :interactor do
  subject { CalculateYieldLoan }

  before do
    @invested_sum = 1_000_000

    {
      'ЮЛ1' => [false] * 6,
      'ЮЛ2' => [false] * 4,
      'ЮЛ3' => [false] * 2 + [true] * 4
    }.each do |name, statuses|
      u = create(:user, name: name)
      statuses.each do |status|
        create(:payment, overdued: status, user: u)
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
      .to eq(30)
  end

  it 'calculates expected result' do
    expect(@result.hisotric_result)
      .to eq(31)
  end
end
