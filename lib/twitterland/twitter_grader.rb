module Twitterland
  class TwitterGrader
    include HTTParty
    base_uri 'api.twittergrader.com/api'
    format :json

    # Get Twitter Grade for user
    # request your api key at [http://twitter.grader.com/accessrequestform
    #
    #   Twitterland::TwitterGrader.grade('bradleyjoyce', 'OU812')
    def self.grade(username, api_key)
      data = get("/grade/#{username}.json", :query => {:APIKey => api_key})
      data['ErrorMessage'].blank? ? data['Data']['Grade'].to_f : data['ErrorMessage']
    end

  end
end