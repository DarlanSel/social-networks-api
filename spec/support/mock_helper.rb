require 'webmock/rspec'

twitter_response = [
  { username: '@user1', tweet: 'message_01' },
  { username: '@user2', tweet: 'message_02' },
]

facebook_response = [
  { name: 'Friend 01', status: 'status_01' },
  { name: 'Friend 02', status: 'status_02' },
]

instagram_response = [
  { username: 'hipster1', picture: 'food' },
  { username: 'hipster2', picture: 'coffee' },
]

RSpec.configure do |config|
  config.before(:each, type: :request, status: :success) do
    stub_request(:get, 'https://takehome.io/twitter').to_return(status: 200, body: twitter_response.to_json)
    stub_request(:get, 'https://takehome.io/facebook').to_return(status: 200, body: facebook_response.to_json)
    stub_request(:get, 'https://takehome.io/instagram').to_return(status: 200, body: instagram_response.to_json)
  end

  config.before(:each, type: :request, status: :fail) do
    stub_request(:get, 'https://takehome.io/twitter').to_return(status: 500, body: '')
    stub_request(:get, 'https://takehome.io/facebook').to_return(status: 500, body: '')
    stub_request(:get, 'https://takehome.io/instagram').to_return(status: 500, body: '')
  end
end
