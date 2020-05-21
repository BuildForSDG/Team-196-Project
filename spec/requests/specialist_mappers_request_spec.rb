# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SpecialistMappers', type: :request do
  let(:headers) { valid_headers }
  let!(:specialist_mappers) { create_list(:specialist_mapper, 20) }
  let!(:specializations) { create_list(:specialization, 4) }
  let!(:user) { create(:user) }
  let!(:specialization_id) { specializations.first.id }
  let!(:user_id) { user.id }
  let(:id) { specialist_mappers.first.id }

  describe 'GET /specialist_mappers' do
    before { get '/specialist_mappers', params: {}, headers: headers }

    describe 'when records exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all specialist_mapper records' do
        expect(json['total_entries']).to eq(20)
      end
    end
  end

  describe 'GET /specialist_mappers/:id' do
    before { get "/specialist_mappers/#{id}", params: {}, headers: headers }

    context 'when specialist_mapper item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the specialist_mapper record' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when specialist_mapper record does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SpecialistMapper/)
      end
    end
  end

  describe 'POST /specialist_mappers' do
    let(:valid_attributes) { { specialist_id: user_id, specialization_id: specialization_id }.to_json }

    context 'when request attributes are valid' do
      before do
        post '/specialist_mappers', params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post '/specialist_mappers', params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Specialist must exist, Specialist can't be blank, Specialization must exist, Specialization can't be blank/)
      end
    end

    describe 'PUT /specialist_mappers/:id' do
      let(:valid_attributes) { { specialization_id: specializations.last.id }.to_json }

      before do
        put "/specialist_mappers/#{id}", params: valid_attributes, headers: headers
      end

      context 'when record exists' do
        it 'returns status code 204' do
          expect(response).to have_http_status(200)
        end

        it 'updates the record' do
          expect(json['specialization_id']).to match(specializations.last.id)
        end
      end

      context 'when the item does not exist' do
        let(:id) { 0 }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find SpecialistMapper/)
        end
      end
    end
  end

  describe 'DELETE /specialist_mappers/:id' do
    before { delete "/specialist_mappers/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
