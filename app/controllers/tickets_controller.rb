class TicketsController < ViewController

  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
    # GET /tickets
    # GET /tickets.json
    def index
      @tickets = Ticket.all
    end
  
    # GET /tickets/1
    # GET /tickets/1.json
    # POLYGON ((-9388407.6010849569 4046158.9036691156, -9388407.6010757331 4045598.9683762509, -9387944.1299591586 4045598.9683860973, -9387944.129966408 4046158.9036577442, -9388407.6010849569 4046158.9036691156))
    
    def show
      @polygon = @ticket.well_know_text

      # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      #   marker.lat user.latitude
      #   marker.lng user.longitude
      # end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def ticket_params
        params.require(:ticket).permit(:request_number, :sequence_number, :request_type, :response_due_date_time, :sacode1, :sacode2, :company_name, :address, :crew_on_site, :well_know_text, :created_at, :updated_at)
      end
end
