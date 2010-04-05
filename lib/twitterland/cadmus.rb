module Twitterland
  class Cadmus
    include HTTParty
    base_uri 'http://thecadmus.com/api'
    format :json
  
    def self.posts(options={})
      response = get("/posts", :query => options)
      handle_response(response)
      response.map{|p| Hashie::Mash.new(p)}
    end
    
    def self.handle_response(response)
      case response.code.to_i
      when 401
        raise Twitterland::Unauthorized.new(response.body)
      when 500
        raise Twitterland::General.new(response.body)
      end
    end
    
  end
end