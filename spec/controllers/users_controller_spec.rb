require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'when send right parameters' do
      user_params = {
        user: {
          name: 'John'
        }
      }

      it 'creates user and his payments' do
        post :create, xhr: true, params: user_params

        expect(response).to have_http_status(:created)
      end
    end

    context 'when send wrong parameters' do
      user_params = { user: { name: nil } }

      it 'creates user and his payments' do
        post :create, xhr: true, params: user_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
