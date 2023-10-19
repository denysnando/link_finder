# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController do
  controller(described_class) do
    before_action :require_user

    def index
      render plain: 'Test'
    end
  end

  describe 'require_user' do
    context 'when a user is logged in' do
      it 'does not redirect' do
        user = create(:user)
        session[:user_id] = user.id

        get :index

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to the login page' do
        get :index

        expect(response).to redirect_to(login_path)
      end
    end
  end
end
