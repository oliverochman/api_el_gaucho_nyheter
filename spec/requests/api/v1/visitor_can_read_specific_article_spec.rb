RSpec.describe Api::V1::ArticlesController, type: :request do
  let!(:articles) { 2.times { create(:article) } }

  describe "GET /api/v1/articles" do
    before do
      get "/api/v1/articles"
    end
    visit_root_path

    context 'article displays' do
      it 'title' do
        expect(page).to have_content 'A very nice title'
      end

      it 'lead' do
        expect(page).to have_content 'This title is the most amazing title that excist'
      end

      it 'content' do
        expect(page).to have_content 'Ella Bohlin inte hållit den sociala distans som Folkhälsomyndigheten rekommenderar.'
      end
    end
  end
end
