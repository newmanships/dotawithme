class Player < ActiveRecord::Base

  validates :username, presence: true, allow_blank: false
  validates :language, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :solommr, presence: true, allow_blank: false
  #validates :playerSteamID, uniqueness: true
  scope :one, -> { where(:one => true) }
  scope :two, -> { where(:two => true) }
  scope :three, -> { where(:three => true) }
  scope :four, -> { where(:four => true) }
  scope :five, -> { where(:five => true) }
  scope :by_language, -> language { where(:language => language) }
  scope :by_languageTwo, -> languageTwo { where(:languageTwo => languageTwo) }
  scope :by_location, -> location { where(:location => location) }
  scope :by_style, -> style {where(:style => style) }
  has_many :messages
  
  def self.online_status
	@accountIDs = Player.pluck(:playerSteamID)
	
	$i = 0
	
 	$total = @accountIDs.count

	until $i == $total do
		@apicall = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_WEB_API_KEY']}&steamids="
		
		$j = 0
		until $j == 50
			if $i <= $total
				@apicall = @apicall + @accountIDs[$i].to_s + ","
				$i += 1
			end
			$j += 1
		end
			
		url = URI.parse(@apicall)
		res = Net::HTTP::get(url)
		test = JSON.load(res)['response']['players']

		$i2 = 0
		until $i2 == test.length
			 if test[$i2]['personastate'].to_s == "1"
				 Player.where(playerSteamID: test[$i2]['steamid']).update_all(online: true)
			 else
			 	Player.where(playerSteamID: test[$i2]['steamid']).update_all(online: false)
			 end
			 $i2 += 1
		end
		sleep(8)
	end                                                                    
                                                                             
#       test = JSON.load(res)['response']['players'][0]['personastate']
# 	@data = JSON.load(res)
# 		File.write('test.txt', apicall)       
  end
  
end
