# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
  let(:starfleet_attrs) do
    {
      address: '24-593 Federation Drive',
      state: 'CA',
      city: 'San Francisco',
      name: 'Starfleet Academy'
    }
  end

  let(:klingon_attrs) do
    {
      address: '1 United Nations Plz',
      state: 'NY',
      city: 'New York',
      name: 'The Klingon Embassy (Earth)'
    }
  end

  let(:valid_attrs) do
    starfleet_attrs
  end

  let(:invalid_attrs) do
    valid_attrs.merge(state: 'INVALID')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    before do
      Hospital.create!(starfleet_attrs)
      Hospital.create!(klingon_attrs)
    end

    context 'request all records' do
      before do
        get(:index, params: {}, session: valid_session)

        @json = JSON.parse(response.body, symbolize_keys: true)
      end

      it 'returns a success response' do
        expect(response).to be_successful
      end

      it 'returns two records' do
        expect(@json.count).to eq(2)
      end
    end

    context 'filter by city' do
      before do
        get(:index, params: { city: starfleet_attrs[:city] }, session: valid_session)
        @json = JSON.parse(response.body, symbolize_keys: true)
      end

      it 'returns a success response' do
        expect(response).to be_successful
      end

      it 'returns correct record count' do
        expect(@json.count).to eq(1)
      end

      it 'returns correct record' do
        expect(@json.first.fetch('name')).to eq(starfleet_attrs[:name])
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      hospital = Hospital.create!(valid_attrs)
      get :show, params: { id: hospital.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Hospital' do
        expect do
          post :create, params: { hospital: valid_attrs }, session: valid_session
        end.to change(Hospital, :count).by(1)
      end

      it 'renders a JSON response with the new hospital' do
        post :create, params: { hospital: valid_attrs }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(hospital_url(Hospital.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new hospital' do
        post :create, params: { hospital: invalid_attrs }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attrs) do
        klingon_attrs
      end

      it 'updates the requested hospital' do
        hospital = Hospital.create!(valid_attrs)

        put :update, params: { id: hospital.to_param, hospital: new_attrs }, session: valid_session
        hospital.reload

        expect(hospital).to have_attributes(new_attrs)
      end

      it 'renders a JSON response with the hospital' do
        hospital = Hospital.create! valid_attrs

        put :update, params: { id: hospital.to_param, hospital: valid_attrs }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the hospital' do
        hospital = Hospital.create! valid_attrs

        put :update, params: { id: hospital.to_param, hospital: invalid_attrs }, session: valid_session

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested hospital' do
      hospital = Hospital.create!(valid_attrs)
      expect do
        delete :destroy, params: { id: hospital.to_param }, session: valid_session
      end.to change(Hospital, :count).by(-1)
    end
  end
end
