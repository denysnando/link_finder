# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET #new' do
    context 'when a user is not logged in' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'assigns a new user' do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    context 'when a user is logged in' do
      it 'redirects to the root path' do
        user = create(:user)
        session[:user_id] = user.id
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid user parameters' do
      it 'creates a new user' do
        user_params = attributes_for(:user)
        expect do
          post :create, params: { user: user_params }
        end.to change(User, :count).by(1)
      end

      it 'sets the session for the user' do
        user_params = attributes_for(:user)
        post :create, params: { user: user_params }
        expect(session[:user_id]).to eq(User.last.id)
      end

      it 'redirects to the root path' do
        user_params = attributes_for(:user)
        post :create, params: { user: user_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid user parameters' do
      it 'does not create a new user' do
        user_params = attributes_for(:user, username: nil)
        expect do
          post :create, params: { user: user_params }
        end.not_to change(User, :count)
      end

      it 'sets a flash alert with error messages' do
        user_params = attributes_for(:user, username: nil)
        post :create, params: { user: user_params }
        expect(flash[:alert]).not_to be_empty
      end

      it 'redirects to the new user path' do
        user_params = attributes_for(:user, username: nil)
        post :create, params: { user: user_params }
        expect(response).to redirect_to(new_user_path)
      end
    end
  end
end
