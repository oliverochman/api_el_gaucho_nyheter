RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:article) { create(:article, 
    title: "Presidential debate: Trump refuses to take part in virtual TV event", 
    lead: "US President Donald Trump has refused to take part in a virtual TV debate with his Democratic rival Joe Biden."
  ) }

  describe "GET /api/v1/articles" do
    before do
      get "/api/v1/articles/#{article.id}"
    end

    it "is expected to return title" do
      expect(response_json['title']).to eq 'Presidential debate: Trump refuses to take part in virtual TV event'
    end

    it "is expected to return lead" do
      expect(response_json["lead"]).to eq 'US President Donald Trump has refused to take part in a virtual TV debate with his Democratic rival Joe Biden.'
    end

    it "is expected to return content" do
      expect(response_json["content"]).to eq 'It made the decision after Mr Trump was treated for Covid-19.'
    end
  end
end
