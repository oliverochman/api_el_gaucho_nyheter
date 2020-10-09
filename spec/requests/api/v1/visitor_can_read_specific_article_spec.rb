RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) {
    create(:article,
           title: "Presidential debate: Trump refuses to take part in virtual TV event",
           lead: "US President Donald Trump has refused to take part in a virtual TV debate with his Democratic rival Joe Biden.",
           content: "It made the decision after Mr Trump was treated for Covid-19.")
  }

  describe "GET /api/v1/articles/article.id Successfully" do
    before do
      get "/api/v1/articles/#{article.id}"
    end

    it "should return 200 response" do
      expect(response).to have_http_status 200
    end

    it "is expected to return title" do
      expect(response_json["article"]["title"]).to eq "Presidential debate: Trump refuses to take part in virtual TV event"
    end

    it "is expected to return lead" do
      expect(response_json["article"]["lead"]).to eq "US President Donald Trump has refused to take part in a virtual TV debate with his Democratic rival Joe Biden."
    end

    it "is expected to return content" do
      expect(response_json["article"]["content"]).to eq "It made the decision after Mr Trump was treated for Covid-19."
    end
  end

  describe "GET /api/v1/articles/article.id - Unsuccessfully" do
    before do
      get "/api/v1/articles/invalid_id"
    end

    it "expected to show error message" do
      expect(response_json["error"]).to eq "Article does not exist"
    end

    it "should return status 404" do
      expect(response).to have_http_status 404
    end
  end
end
