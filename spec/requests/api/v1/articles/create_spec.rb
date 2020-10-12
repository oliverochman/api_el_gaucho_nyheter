RSpec.describe "POST /api/v1/articles", type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'successfully with valid params' do
    before do
      post '/api/v1/articles',
      params: {
        article: {
          title: 'Article title',
          content: 'Article content'  
        }
      },
      headers: headers 
    end

    it 'is expected to return 201 response status' do
      expect(response.status).to eq 201
    end

    it 'is expected to return success message' do
      expect(response_json['message']).to eq 'Artcile successfully created!'
    end
  end
end
