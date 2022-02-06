module Api
  class SocialNetworkClient
    BASE_URI = 'https://takehome.io'

    def initialize(social_network_path)
      @social_network_path = social_network_path
    end

    def get_feed
      RestClient.get(BASE_URI + @social_network_path)
    rescue StandardError => e
      Rails.logger.error "#{self.class} - Error on 'GET #{@social_network_path}': #{e.message}"
      nil
    end

    def json_feed
      response = get_feed
      response.nil? ? [] : JSON.parse(response.body, symbolize_names: true)
    end
  end
end
