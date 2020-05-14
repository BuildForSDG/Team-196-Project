require 'rails_helper'

RSpec.describe "Records", type: :request do
    let!(:user) { create(:user) }
    let!(:records) { create_list(:records, 20, user_id: user.id) }
    let(:user_id) { user.id }
    let(:id){ records.first.id }

    # test suite for get /user/:user_id/records

    describe 'GET /user/:user_id/records' do
        before { get "/user/#{user_id}/records" }

        context 'when records exists' do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns all user records' do
                expect(json.size).to eq(20)
            end
        end 

        context 'when user does not exist' do
            let(:user_id) { 0 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find user/)
            end 
        end
    end 

    # Test suite for GET /user/:user_id/records/:id 
    describe '/user/:user_id/records/:id' do
        before { get "/user/#{user_id}/records/#{id}"}

        context 'when user item exists' do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns the user record' do
                expect(json['id']).to eq(id)
            end
        end

        context 'when user item does not exist' do
            let(:id) { 0 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find record/)
            end
        end
    end 

    # Test suite for put /user/:user_id/records 

    describe 'POST /user/:user_id/records' do
        let(:valid_attributes){{ description: 'I have autism', diagnosis: false }}

        context 'when request attributes are valid' do
            before { post "/user/#{user_id}/records", params: valid_attributes }

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end
        
        context 'when an invalid request' do
            before { post "/user/#{user_id}/records", params: {} }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a failure message' do
                expect(response.body).to match(/Validation failed: description can't be blank/)

            end
        end
    end

    describe 'PUT /user/:user_id/records/:id' do
        let(:valid_attributes) {{ description: 'I have Scritzophrania' }}

        before { put "/user/#{user_id}/records/#{id}", params: valid_attributes }

        context 'when record exists' do
            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end

            it 'updates the record' do
                updated_item =  Record.find(id)
                expect(updated_item.description).to match(/I have Scritzophrania/)
            end     
        end

        context 'when the item does not exist' do
            let(:id) { 0 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end 

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't fint record/)
            end
        end
    end

    describe 'DELETE /user/:id' do
        before { delete "/user/#{user_id}/records/#{id}" }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
