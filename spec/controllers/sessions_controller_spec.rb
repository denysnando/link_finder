# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController do
  describe 'GET #new' do
    context 'when a user is logged in' do
      it 'redirects to root_path' do
        user = create(:user)
        session[:user_id] = user.id

        get :new

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when no user is logged in' do
      it 'renders the new template' do
        get :new

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }

      it 'logs in the user and redirects to root_path' do
        post :create, params: { user: { email: 'test@example.com', password: 'password123' } }

        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'does not log in the user and sets a flash message' do
        create(:user, email: 'test@example.com', password: 'password123')

        post :create, params: { user: { email: 'test@example.com', password: 'wrong_password' } }

        expect(session[:user_id]).to be_nil
        expect(flash[:alert]).to eq('Invalid username/email or password')
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root_path' do
      user = create(:user)
      session[:user_id] = user.id

      delete :destroy

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
