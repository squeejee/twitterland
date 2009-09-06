module Twitterland
  class Thumbfight
    include HTTParty
    base_uri 'thumbfight.com'
    format :json
    
    # Get Thumbfight analysis for 1 or 2 search terms
    #
    #   Twitterland::Thumbfight.fight(args)
    def self.fight(*args)
      params = {}
      params[:challenger1] = args[0] if args[0]
      params[:challenger2] = args[1] if args[1]
      Mash.new get("/fight.json", :query => params)
    end
  
  end
end