require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET index' do
    it 'renders the index template' do
      get searches_path
      expect(response).to render_template(:index)
    end
  end

  describe 'POST create' do
    it 'creates a new search' do
      expect do
        post searches_path, params: { search: { query: 'example search' } }
      end.to change(Search, :count).by(1)
    end

    it 'redirects to the index page' do
      post searches_path, params: { search: { query: 'example search' } }
      expect(response).to redirect_to(searches_path)
    end
  end

end
