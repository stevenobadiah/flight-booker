class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        #@flight_dates = Flight.all.pluck(:departure_date).strftime("%m/%d/%Y").uniq.sort
        #@flight_times = Flight.all.pluck(:departure_date).strftime("%H:%M").uniq.sort
        @flight_times = Flight.all.pluck(:departure_date).uniq.sort
        @airports = Airport.all.map {|airport| [airport.code, airport.id]}
        @flight_dates = Flight.all.order(:departure_date).distinct.pluck(:departure_date).map! {|date| [date.strftime("%B %d %Y"), date] }
        @date_options = @flight_times.map {|datetime| [datetime.strftime("%m/%d/%Y")]}.uniq
        @num_tickets = flight_params[:num_passengers]

        #@default_origin = @airports.first
        #@default_destination = @airports.first
        #@default_tickets = 3
        #@default_date = "Choose a Date"

        #@take_off_options = Flight.all.map {|flight| [flight.date_formatted , flight.departure_date]}.uniq
        #@months_array = Flight.all.map { |flight| flight.departure_date.month }.uniq.sort
        #@days_array = Flight.all.map { |flight| flight.departure_date.day }.uniq.sort
        #@available_flights = []

        #@available_flights = @flights.where(from_airport_id: params[:from_airport_id])
        #    .where(to_airport_id: params[:to_airport_id])
        #    .search_by_month(params[:month])
        #    .search_by_day(params[:day])
    
        if params[:commit]
            #@default_origin = flight_params[:origin_id]
            #@default_destination = flight_params[:destination_id]
            #@default_tickets = flight_params[:num_passengers]
            #@default_date = flight_params[:departure_date]
            if params[:origin_id] == params[:destination_id] && params[:departure_date].nil? == true
                @available_flights =  "Boi"
            elsif params[:origin_id] == params[:destination_id] && params[:departure_date].nil? == false
                @available_flights =  Flight.where(departure_date: params[:departure_date]).order(:departure_date)
                #appears as entire date string
                @date_check = params[:departure_date]
            elsif params[:departure_date] = ""
                @available_flights =  Flight.where(origin_id: params[:origin_id], destination_id: params[:destination_id]).order(:departure_date)
            else
                @available_flights =  Flight.where(date: params[:departure_date], origin_id: params[:origin_id], destination_id: params[:destination_id]).order(:departure_date)
            end
        end
    end

    private

    def show
        @flight = Event.find(params[:id])
    end

    def flight_params
        params.permit(:origin_id, :destination_id, :departure_date, :num_passengers, :id) 
    end
end
