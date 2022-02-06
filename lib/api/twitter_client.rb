module Api
  class TwitterClient < SocialNetworkClient
    def initialize
      super '/twitter'
    end

    def tweets
      json_feed.map { |tweet| tweet[:tweet] }
    end
  end
end
