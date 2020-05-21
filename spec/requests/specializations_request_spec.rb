# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Specializations', type: :request do
  let(:headers) { valid_headers }
  let!(:specializations) { create_list(:specialization, 20) }
  let!(:user) { create(:user) }
  let(:id) { specializations.first.id }

  describe 'GET /specializations' do
    before { get '/specializations', params: {}, headers: headers }

    describe 'Returns all specializaion records' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all specializations records' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'GET /specializations/:id' do
    before { get "/specializations/#{id}", params: {}, headers: headers }

    context 'when specialization record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the specialization record' do
        expect(json['id']).to eq(id)
      end
    end
    
    context 'when specialization record does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Specialization/)
      end
    end
  end

  describe 'POST /specializations' do
    let(:valid_attributes) { { description: Faker::Lorem.sentence, name: Faker::Name.name }.to_json }

    context 'when request attributes are valid' do
      before do
        post "/specializations", params: valid_attributes, headers: headers
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/specializations", params: { }, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank, Description can't be blank/)
      end
    end

    describe 'PUT /specializations/:id' do
      desc = Faker::Lorem.sentence
      let(:valid_attributes) { { description: desc }.to_json }

      before do
        put "/specializations/#{id}", params: valid_attributes, headers: headers
      end

      context 'when record exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
  
        it 'updates the record' do
          expect(json['description']).to match(desc)
        end
      end

      context 'when the item does not exist' do
        let(:id) { 0 }
  
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
  
        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Specialization/)
        end
      end

      describe 'DELETE /specializations/:id' do
        before { delete "/specializations/#{id}", params: {}, headers: headers }

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  end
end
