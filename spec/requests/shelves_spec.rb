require 'rails_helper'

RSpec.describe 'Shelves API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:shelves) { create_list(:shelf, 10) }
  let(:shelf_id) { shelves.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /shelves
  describe 'GET /shelves' do
    # update request with headers
    before { get '/shelves', params: {}, headers: headers }

    it 'returns shelves' do
      # Note `json` is a custom helper to parse JSON responses
      expect(response.body).not_to be_empty
      expect(response.body.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /shelves/:id
  describe 'GET /shelves/:id' do
    before { get "/shelves/#{shelf_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the shelf' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(shelf_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:shelf_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shelf/)
      end
    end
  end

  # Test suite for POST /shelves
  describe 'POST /shelves' do
    # valid payload
    let(:valid_attributes) { { title: 'My shelf', created_by: user.id.to_s }.to_json }

    context 'when the request is valid' do
      before { post '/shelves', params: valid_attributes, headers: headers }

      it 'creates a shelf' do
        expect(json['title']).to eq('My shelf')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/shelves', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
            .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /shelves/:id
  describe 'PUT /shelves/:id' do
    let(:valid_attributes) { { title: 'My Shopping shelf' }.to_json }

    context 'when the record exists' do
      before { put "/shelves/#{shelf_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /shelves/:id
  describe 'DELETE /shelves/:id' do
    before { delete "/shelves/#{shelf_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end