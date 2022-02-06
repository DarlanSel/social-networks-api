module Api
  class InstagramClient < SocialNetworkClient
    def initialize
      super '/instagram'
    end

    def photos
      json_feed.map { |post| post[:picture] }
    end
  end
end
