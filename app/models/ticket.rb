class Ticket < ApplicationRecord

  def convert_params(ticket_params)
    self[:request_number] = ticket_params[:request_number]
    self[:sequence_number] = ticket_params[:sequence_number]
    self[:request_type] = ticket_params[:request_type]
    puts '++++1'
    self[:response_due_date_time] = ticket_params[:date_times][:response_due_date_time]
    puts '++++2'
    self[:sacode1] = ticket_params[:service_area][:primary_service_area_code][:sa_code]    
    self[:sacode2] = ticket_params[:service_area][:additional_service_area_codes][:sa_code].join(",")

    self[:company_name] = ticket_params[:excavator][:company_name]
    city = ticket_params[:excavator][:city]
    state = ticket_params[:excavator][:state]
    zip = ticket_params[:excavator][:zip]
    self[:address] = ticket_params[:excavator][:address] + ',' + city + ',' + state + ',' + zip

    puts '----------------------------------'
    puts ticket_params[:excavator]
    self[:crew_on_site] = ticket_params[:excavator][:crew_onsite]

    self[:well_know_text] = ticket_params[:excavation_info][:digsite_info][:well_known_text]

  end
end

