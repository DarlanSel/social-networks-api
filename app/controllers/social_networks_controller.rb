class SocialNetworksController < ApplicationController
  def index
    threads = {
      twitter: Thread.new { Thread.current[:result] = TwitterClient.new.tweets },
      facebook: Thread.new { Thread.current[:result] = FacebookClient.new.statuses },
      instagram: Thread.new { Thread.current[:result] = InstagramClient.new.photos },
    }

    response = {}

    threads.each { |net, tr| response[net] = tr.join[:result] }

    render json: response
  end
end
