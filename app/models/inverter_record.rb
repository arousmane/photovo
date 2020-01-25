class InverterRecord < ApplicationRecord
  belongs_to :inverter

  validates :energy, presence: true
  validates :produced_at, presence: true
  validates :inverter_id, presence: true
end
