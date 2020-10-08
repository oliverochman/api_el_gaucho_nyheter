RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:articles) { 2.times { create(:article) } }

  describe "GET /api/v1/articles" do
    before do
      get "/api/v1/articles"
    end

    it "is expected to return title" do
      expect(response_json["articles"][0]).to be_truthy
    end

    it "is expected to return lead" do
      expect(response_json["articles"][0]).to have_content "a wonderful lead"
    end

    it "is expected to return content" do
      expect(response_json["articles"][0]).to eq "this is the amazing content"
    end
  end
end
