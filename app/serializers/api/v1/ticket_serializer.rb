module Api
  module V1
    class TicketSerializer < ActiveModel::Serializer
      attributes :id,
        :request_number,
        :sequence_number,
        :request_type,
        :response_due_date_time,
        :sacode1,
        :sacode2,
        :company_name,
        :address,
        :crew_on_site,
        :well_know_text
    end
  end
end
