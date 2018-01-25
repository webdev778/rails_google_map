module Api
  module V1
    class TicketsController < ApiController
      skip_before_action :auth_with_token! # uncomment to secure

      def create
        ticket = Ticket.new
        ticket.convert_params(ticket_params)     
        if ticket.save
          render json: ticket, status: :created
        else
          render_error(ticket.errors.full_messages[0], :unprocessable_entity)
        end
      end

      private

      def ticket_params
        params.permit(:request_number, 
                      :sequence_number, 
                      :request_type, 
                      date_times:[
                        :response_due_date_time
                      ], 
                      service_area:[
                        primary_service_area_code:[
                          :sa_code
                        ], 
                        additional_service_area_codes:[
                          :sa_code => []
                        ]
                      ],
                      excavator:[
                        :company_name, 
                        :address, 
                        :city, 
                        :state, 
                        :zip, 
                        :crew_onsite
                      ],
                      excavation_info:[
                        digsite_info:[
                          :well_known_text
                        ]
                      ])
      end
    end
  end
end
