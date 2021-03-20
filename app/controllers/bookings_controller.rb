class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        #params[:num_passengers].to_i.times { @booking.passengers.build }
        #@passengers = params[:num_passengers].to_i
        params[:num_passengers].to_i.times do 
            @booking.passengers.build
        end
    end

    def create
        #@booking = Booking.new(booking_params)
        @booking = Booking.new(flight_id: params[:flight_id].to_i)
        @flight = Flight.find(params[:flight_id])

        booking_params[:passengers_attributes].each do |passenger|
          @booking.passengers.build(passenger[1]) 
        end
      
        @booking.save

        if @booking.save
          @booking.passengers.each do |passenger| 
            PassengerMailer.thank_you_email(passenger).deliver_now
          end
          flash.now[:success] = "Succesfully booked a flight!"
          redirect_to booking_path(@booking)
        else
          flash.now[:error] = "Missing fields!"
          render :new
        end

        #redirect_to booking_path(@booking)
    end
    
    def show
        @booking = Booking.find(params[:id])
        @flight = @booking.flight
    end

    #def passengers_params
    #    params.require(:booking).permit(passengers_attributes: [:name, :email])
    #end

    private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
