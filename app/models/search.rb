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
    players = players.where("language = ? OR \"languageTwo\" = ?", language, language) if language.present?
    
    players = players.where(location: location) if location.present?
    
    if style.present? and style == 'Any'
      players = players.where("style = ? OR style = ? OR style = ? OR style = ?", 'Any', 'Pubs', 'Comp', 'Learning')
    elsif style.present? and style == 'Pubs' 
      players = players.where("style = ? OR style = ?", 'Any', 'Pubs')
    elsif style.present? and style == 'Comp'
      players = players.where("style = ? OR style = ?", 'Any', 'Comp')
    elsif style.present? and style == 'Learning'
      players = players.where("style = ? OR style = ?", 'Any', 'Learning')
    end
        
    
    
  end

  
end
