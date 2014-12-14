class CaseController < ApplicationController
  include ActionController::MimeResponds

  before_action :set_cases

  def index
    respond_to do |format|
      format.html {  throw Exception } # do not respond to html requests
      format.json { render json: @cases}
    end
  end

  private

  def set_cases
    #returns cases within 5 miles of the passed longitude and latitude
    @cases = params[:near].present? ? Case.near(get_date_from_timestamp(timestamp),5) : Case.all
    @cases = @cases.where(case_params) if case_params.present?
    @cases = @cases.where('opened >= ?',get_date_from_timestamp(params[:since])) if params[:since].present?
  end

  def get_date_from_timestamp(timestamp)
    return Time.at(timestamp.to_i).to_datetime
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def case_params
    params.permit(:case_id, :opened, :closed, :updated, :status, :responsible_agency, :category, :request_type,
                  :neighborhood, :request_detail, :address, :supervisor_district, :source, :media_url, :longitude,
                  :latitude)
  end
end
