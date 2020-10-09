RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article1) { create(:article, category: "news") }
  let!(:article2) { create(:article, category: "news") }
  let!(:article3) { create(:article, category: "sports") }

  describe "GET /api/v1/articles" do
    before do
      get "/api/v1/articles/#{article.news}"
    end

    it "should return 200 response" do
      expect(response).to have_http_status 200
    end

    it "should be 2 articles in new" do
      expect(response_json["articles"].count).to eq 2
    end

    it "is expected to return news" do
      expect(response_json["articles"][0]["category"]).to eq "news"
    end
  end

  describe "GET /api/v1/articles" do
    before do
      get "/api/v1/articles/#{article.sports}"
    end

    it "should be 2 articles in new" do
      expect(response_json["articles"].count).to eq 1
    end

    it "is expected to return news" do
      expect(response_json["articles"][2]["category"]).to eq "sports"
    end
  end
end
