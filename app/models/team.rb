class Team < ActiveRecord::Base
  validates :location, presence: true, allow_blank: false
  validates :language, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false, uniqueness: true
end
