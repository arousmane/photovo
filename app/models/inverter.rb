class Inverter < ApplicationRecord
  has_many :records, class_name: 'InverterRecord'

  validates :ref, presence: true
end
