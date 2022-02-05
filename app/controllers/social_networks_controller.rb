class SocialNetworksController < ApplicationController
  def index
    render json: { message: 'it is working' }
  end
end
