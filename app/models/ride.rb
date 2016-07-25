class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      ride_success
      "Enjoy the ride!"
    end
  end

  def ride_success
    new_tickets = (self.user.tickets - self.attraction.tickets)
    new_happiness = (self.user.happiness + self.attraction.happiness_rating)
    new_nausea = (self.user.nausea + self.attraction.nausea_rating)
    self.user.update(tickets: new_tickets, happiness: new_happiness, nausea: new_nausea)
  end
end
