class PassengerMailer < ApplicationMailer
    default from: 'passengeremailer@test.com'
  
    def thank_you_email(passenger)
      @passenger = passenger
      @booking = @passenger.booking
      @flight = @booking.flight
      mail(to: @passenger.email, subject: "Thank You from Flite")
    end
end
