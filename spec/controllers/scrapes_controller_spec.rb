# frozen_string_literal: true

require 'rails_helper'

describe ScrapesController do
  let(:user) { create(:user) }
  let(:scrape) { create(:scrape, user:) }

  before do
    session[:user_id] = user.id
  end

  describe 'GET #index' do
    it 'assigns scrapes' do
      VCR.use_cassette('google_links', allow_playback_repeats: true) do
        scrapes = create_list(:scrape, 5, user:)
        get :index

        expect(assigns(:scrapes)).to eq(scrapes)
      end
    end

    it 'renders the index template' do
      VCR.use_cassette('google_links') do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new scrape for the current user with a valid URL' do
      valid_url = 'https://www.google.com.br'
      VCR.use_cassette('google_links') do
        post :create, params: { url: valid_url }
      end

      expect(user.scrapes.last.url).to eq(valid_url)
      expect(flash[:alert]).to be_nil
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash alert and redirects with an invalid URL' do
      post :create, params: { url: 'invalid_url' }

      expect(user.scrapes.last).to be_nil
      expect(flash[:alert]).not_to be_nil
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #show' do
    context 'when scrape is found' do
      it 'assigns scrape and scrape_links' do
        VCR.use_cassette('google_links') do
          get :show, params: { id: scrape.id }
          expect(assigns(:scrape)).to eq(scrape)
          expect(assigns(:scrape_links)).to eq(scrape.scrape_links.paginate(page: 1, per_page: 20))
        end
      end

      it 'renders the show template' do
        VCR.use_cassette('google_links') do
          get :show, params: { id: scrape.id }
          expect(response).to render_template(:show)
        end
      end
    end

    context 'when scrape is not found' do
      it 'sets flash[:alert] and redirects to root_path' do
        VCR.use_cassette('google_links') do
          get :show, params: { id: 'invalid_id' }
          expect(flash[:alert]).to eq('Scrape not found')
          expect(response).to redirect_to(root_path)
        end
      end
    end
  end
end
