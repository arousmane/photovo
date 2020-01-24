class Inverter < ApplicationRecord
  has_many :records, class_name: 'InverterRecord'
end
