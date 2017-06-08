class CalculateYieldLoan
  include Interactor

  ANNUAL_RATE = 0.3
  PENNY_RATE = 0.5
  MONTHS = 6

  def call
    context.monthly_payment_sum = count_payment_sum

    first_user = User.first
    context.expected_result = to_percents (check_user(first_user) * 3) / (context.invested_sum * 3) / MONTHS * 12

    users = User.all
    context.hisotric_result = to_percents users.map { |u| check_user(u) }.reduce(:+) / (users.count * context.invested_sum) / MONTHS * 12
  end

  def to_percents(result)
    (result * 100).round
  end

  def check_user(user)
    payments = user.payments

    quick_client = early_payed?(payments.count)

    sum = if quick_client
      const_calc * payments.count
    else
      check_payments(payments)
    end
  end

  def check_payments(payments)
    overdued_months = payments.where('amount > ?', context.monthly_payment_sum).count

    if overdued_months > 0
      const_calc * (MONTHS - overdued_months) + penny_const_calc * overdued_months
    else
      const_calc * MONTHS
    end
  end

  def early_payed?(payments_count)
    payments_count < MONTHS
  end

  def count_payment_sum
    (context.invested_sum + context.invested_sum * ANNUAL_RATE) / MONTHS
  end

  def const_calc
    context.invested_sum * ANNUAL_RATE / 12
  end

  def penny_const_calc
    context.invested_sum * PENNY_RATE / 12
  end
end
