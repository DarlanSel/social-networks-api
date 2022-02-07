require 'rails_helper'

RSpec.describe 'SocialNetworks', type: :request do
  describe 'GET /index' do
    before :each do
      get root_path
    end

    describe 'with success api consume', status: :success do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns all social networks' do
        tweets = %w[message_01 message_02]
        statuses = %w[status_01 status_02]
        photos = %w[food coffee]

        res = JSON.parse(response.body, symbolize_names: true)

        expect(res[:twitter]).to eq(tweets)
        expect(res[:facebook]).to eq(statuses)
        expect(res[:instagram]).to eq(photos)
      end
    end

    describe 'with failing api consume', status: :fail do
      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns empty arrays for all social networks' do
        res = JSON.parse(response.body, symbolize_names: true)

        expect(res[:twitter]).to eq([])
        expect(res[:facebook]).to eq([])
        expect(res[:instagram]).to eq([])
      end
    end
  end
end
