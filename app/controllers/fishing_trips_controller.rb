class FishingTripsController < ApplicationController
    
    
    def index
       @fishing_trips = FishingTrip.all 
    end
    
    
    def new
        @fishing_trip = FishingTrip.new
    end
    
    
    def create
        @fishing_trip = FishingTrip.new(fishing_trip_params)
        if @fishing_trip.save
            redirect_to @fishing_trip, notice: '募集が完了しました。'
        else
            render :new
        end
    end
    
    
    private
        def fishing_trip_params
            params.require(:fishing_trip).permit(:organizer_id, :title, :description, :location, :start_date)
        end
        
end
