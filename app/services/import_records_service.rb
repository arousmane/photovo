require 'csv'

class ImportRecordsService < Base
  def initialize(file)
    @data = CSV.read(file.path, headers: true)
  end

  def call
    InverterRecord.import!(build_records)
    true
  rescue
    false
  end

  private

  def build_records
    @data.map do |record|
      InverterRecord.new(
        energy:      record['energy'],
        produced_at: record['datetime'],
        inverter_id: inverters_ids[record['identifier']]
      )
    end
  end

  def inverters_ids
    @inverters_ids ||= Inverter.all.map do |inverter|
      [inverter.ref, inverter.id]
    end.to_h
  end
end