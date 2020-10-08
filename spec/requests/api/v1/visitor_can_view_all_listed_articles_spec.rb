RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:articles) {2.times {create(:article)}}
  
  describe 'GET /api/v1/articles' do
    before do
        get '/api/v1/articles'
    end

    it 'should return 200 response' do
      expect(response).to have_http_status 200
    end

    it 'should return a list of articles' do
      expect(response_json['articles'].count).to eq 2
    end

    it 'should return article with title' do
      expect(response_json['articles'][0]).to have_key('title')
    end

    it 'should return article with lead' do
      expect(response_json['articles'][0]).to have_key('lead')
    end
  end
end