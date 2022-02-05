require 'rails_helper'

RSpec.describe 'SocialNetworks', type: :request do
  describe 'GET /index' do
    before { get root_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all social networks' do
      tweets = [
        %(If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate
         a pinecone every single day.),
        %(STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION.),
      ]

      statuses = [
        %(Here's some photos of my holiday. Look how much more fun I'm having than you are!),
        %(I am in a hospital. I will not tell you anything about why I am here.),
      ]

      photos = [
        %(food),
        %(coffee),
        %(coffee),
        %(food),
        %(this one is of a cat),
      ]

      expect(JSON.parse(response.body)).to eq({ twitter: tweets, facebook: statuses, instagram: photos })
    end
  end
end
