class Team < ActiveRecord::Base
  validates :location, presence: true, allow_blank: false
  validates :language, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false, uniqueness: true
  
  scope :one, -> { where(:one => true) }
  scope :two, -> { where(:two => true) }
  scope :three, -> { where(:three => true) }
  scope :four, -> { where(:four => true) }
  scope :five, -> { where(:five => true) }
  scope :by_language, -> language { where(:language => language) }
  scope :by_location, -> location { where(:location => location) }
  scope :by_style, -> style {where(:style => style) }
  scope :by_languageTwo, -> languageTwo { where(:languageTwo => languageTwo) }
end
