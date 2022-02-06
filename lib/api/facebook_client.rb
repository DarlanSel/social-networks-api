module Api
  class FacebookClient < SocialNetworkClient
    def initialize
      super '/facebook'
    end

    def statuses
      json_feed.map { |post| post[:status] }
    end
  end
end
