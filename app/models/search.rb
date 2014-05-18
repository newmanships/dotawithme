class Search < ActiveRecord::Base
  
  def players
    @players ||= find_players
    
  end
  
  
  
  private

  def find_players
    players = Player.order(:username)
    players = players.where("one = ?", true) if one.present?
    players = players.where("two = ?", true) if two.present?
    players = players.where("three = ?", true) if three.present?
    players = players.where("four = ?", true) if four.present?
    players = players.where("five = ?", true) if five.present?
    players = players.where(language: language) if language.present?
    players = players.where(location: location) if location.present?
    players = players.where(style: style) if style.present?
    
    
  end

  
end
