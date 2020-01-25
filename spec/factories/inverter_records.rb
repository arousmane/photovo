FactoryBot.define do
  factory :inverter_record do
    association :inverter
    energy 100
    produced_at Time.now
  end
end