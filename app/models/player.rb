class Player < ActiveRecord::Base

  validates :username, presence: true, allow_blank: false
  validates :language, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  #validates :playerSteamID, uniqueness: true
  scope :one, -> { where(:one => true) }
  scope :two, -> { where(:two => true) }
  scope :three, -> { where(:three => true) }
  scope :four, -> { where(:four => true) }
  scope :five, -> { where(:five => true) }
  
end
