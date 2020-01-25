class InverterRecordsController < ApplicationController
  include Authenticable

  before_action :set_dates, only: %i(index)
  before_action :set_date, only: %i(index)

  def index
    @productions_per_hours = InverterRecord.where("date(produced_at) = ?", @date).group(:produced_at).sum(:energy)
    @production_total = InverterRecord.where("date(produced_at) = ?", @date).sum(:energy)
  end
  
  def import
    if ImportRecordsService.call(params[:datafile])
      flash[:notice] = 'File successfully imported'
    else 
      flash[:alert]  = 'File not imported. Please, retry!'
    end

    redirect_to root_url
  end

  private

  def set_date
    @date ||= params[:date] || @dates.first
  end

  def set_dates
    @dates ||= InverterRecord.select('date(produced_at) as date').distinct.order('date DESC').map(&:date)
  end
end
