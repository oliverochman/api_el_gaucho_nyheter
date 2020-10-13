RSpec.describe "POST /v1/admin/articles", type: :request do
  let(:journalist) { create(:user, role: "journalist") }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: "application/json" }.merge!(journalist_credentials) }

  describe "successfully with vaild params and headers" do
    before do
      post "/api/v1/admin/articles",
           params: {
             title: "Trump holds first public event since Covid diagnosis",
             lead: "Donald Trump has delivered a speech in front of cheering supporters at the White House in his first public appearance since being hospitalised",
             content: "The event was officially a 'peaceful protest', but looked, critics said, much like a Trump campaign rally.
             The president, who says he is no longer taking medicines against Covid-19, told the crowd he was 'feeling great'.",
             category: "news",
           }, headers: journalist_headers
    end

    it "is expected to return 200 response status" do
      expect(response).to have_http_status 200
    end

    it "is expected to return success message" do
      expect(response_json["message"]).to eq "Article successfully created"
    end

    it "is expected to create article" do
      article = Article.last
      expect(article.title).to eq "Trump holds first public event since Covid diagnosis"
    end

    it "article is expected to be associated with journalist" do
      expect(journalist.articles.first.lead).to eq "Donald Trump has delivered a speech in front of cheering supporters at the White House in his first public appearance since being hospitalised"
    end
  end

  describe "unsuccessfully, missing content" do
    before do
      post "/api/v1/admin/articles",
           params: {
             title: "Trump holds first public event since Covid diagnosis",
             lead: "Donald Trump has delivered a speech in front of cheering supporters at the White House in his first public appearance since being hospitalised",
             content: "",
             category: "news",
           }, headers: journalist_headers
    end

    it "is expected to return 422 response status" do
      expect(response).to have_http_status 422
    end

    it "is expected to return error message" do
      expect(response_json["message"]).to eq "Content can't be blank"
    end
  end

  describe "unauthorized user" do
    let(:unauthorized_user) { create(:user, role: "registered") }
    let(:unauthorized_user_credentials) { unauthorized_user.create_new_auth_token }   
    let(:unauthorized_headers) { { HTTP_ACCEPT: "application/json" }.merge!(unauthorized_user_credentials) }

    before do
      post "/api/v1/admin/articles",
           params: {
             title: "Trump holds first public event since Covid diagnosis",
             lead: "Donald Trump has delivered a speech in front of cheering supporters at the White House in his first public appearance since being hospitalised",
             content: "The event was officially a 'peaceful protest', but looked, critics said, much like a Trump campaign rally.",
             category: "news",
           }, headers: unauthorized_headers
    end

    it "is expected to return 401 response status" do
      expect(response).to have_http_status 401
    end

    it "is expected to return error message" do
      expect(response_json["message"].first).to eq "You need to sign in or sign up before continuing."
    end
  end
end
