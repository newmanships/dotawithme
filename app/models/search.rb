class Search < ActiveRecord::Base
  
  def players
    @players ||= find_players
    
  end
  
  
  
  private

  def find_players
    Player.find(:all, :conditions => conditions)
  end

  def one_conditions
    ["players.one?"] unless one.blank?
  end
  
  def two_conditions
    ["players.two?"] unless two.blank?
  end
  
  def three_conditions
    ["players.three?"] unless three.blank?
  end
  
  def four_conditions
    ["players.four?"] unless four.blank?
  end
  
  def five_conditions
    ["players.five?"] unless five.blank?
  end

  
  def language_conditions
    ["players.language = ?", language] unless language.blank?
  end
  
  def location_conditions
    ["players.location = ?", location] unless location.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options] 
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
    
    
end
