# Clean DB
User.destroy_all

# Seed DB
{
  'ЮЛ1' => [191_666.67, 191_666.67, 191_666.67, 191_666.67, 191_666.67, 191_666.67],
  'ЮЛ2' => [191_666.67, 191_666.67, 191_666.67, 525_000.00, 0, 0],
  'ЮЛ3' => [191_666.67, 191_666.67, 208_333.33, 208_333.33, 208_333.33, 208_333.33]
}.each do |name, payments|
  u = User.new name: name
  payments.each do |amount|
    u.payments.build amount: amount
  end
  u.save!
end
