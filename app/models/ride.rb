class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates_presence_of :user_id, :attraction_id

  def take_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      return "Thanks for riding the #{attraction.name}!"
    end
  end
end
