module Twitterland
  class TwitterGrader
    include HTTParty
    base_uri 'api.twittergrader.com/api'
    format :json

    def self.grade(username, api_key)
      data = get("/grade/#{username}.json", :query => {:APIKey => api_key})
      data['ErrorMessage'].blank? ? data['Data']['Grade'].to_f : data['ErrorMessage']
    end

  end
end