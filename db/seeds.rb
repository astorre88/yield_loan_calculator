# Clean DB
User.destroy_all

{
  'ЮЛ1' => [false] * 6,
  'ЮЛ2' => [false] * 4,
  'ЮЛ3' => [false] * 2 + [true] * 4
}.each do |name, statuses|
  u = User.new name: name
  statuses.each do |status|
    u.payments.build overdued: status
  end
  u.save!
end
