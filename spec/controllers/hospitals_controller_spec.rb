# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
  let(:valid_attributes) do
    {
      address: '24-593 Federation Drive',
      state: 'CA',
      city: 'San Francisco',
      name: 'Starfleet Academy'
    }
  end

  let(:invalid_attributes) do
    valid_attributes.merge(state: 'INVALID')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      hospital = Hospital.create!(valid_attributes)
      get(:index, params: {}, session: valid_session)
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      hospital = Hospital.create!(valid_attributes)
      get :show, params: { id: hospital.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Hospital' do
        expect do
          post :create, params: { hospital: valid_attributes }, session: valid_session
        end.to change(Hospital, :count).by(1)
      end

      it 'renders a JSON response with the new hospital' do
        post :create, params: { hospital: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(hospital_url(Hospital.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new hospital' do
        post :create, params: { hospital: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          address: '1 United Nations Plz',
          state: 'NY',
          city: 'New York',
          name: 'The Klingon Embassy (Earth)'
        }
      end

      it 'updates the requested hospital' do
        hospital = Hospital.create!(valid_attributes)

        put :update, params: { id: hospital.to_param, hospital: new_attributes }, session: valid_session
        hospital.reload

        expect(hospital).to have_attributes(new_attributes)
      end

      it 'renders a JSON response with the hospital' do
        hospital = Hospital.create! valid_attributes

        put :update, params: { id: hospital.to_param, hospital: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the hospital' do
        hospital = Hospital.create! valid_attributes

        put :update, params: { id: hospital.to_param, hospital: invalid_attributes }, session: valid_session

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested hospital' do
      hospital = Hospital.create!(valid_attributes)
      expect do
        delete :destroy, params: { id: hospital.to_param }, session: valid_session
      end.to change(Hospital, :count).by(-1)
    end
  end
end
