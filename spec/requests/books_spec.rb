require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  # Initialize the test data
  let!(:shelf) { create(:shelf) }
  let!(:books) { create_list(:book, 20, shelf_id: shelf.id) }
  let(:shelf_id) { shelf.id }
  let(:id) { books.first.id }

  # Test suite for GET /shelves/:shelf_id/books
  describe 'GET /shelves/:shelf_id/books' do
    before { get "/shelves/#{shelf_id}/books" }

    context 'when shelf exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all shelf books' do
        expect(json.size).to eq(20)
      end
    end

    context 'when shelf does not exist' do
      let(:shelf_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shelf with 'id'=0/)
      end
    end
  end



  # Test suite for GET /shelves/:shelf_id/books/:id
  describe 'GET /shelves/:shelf_id/books/:id' do
    before { get "/shelves/#{shelf_id}/books/#{id}" }

    context 'when shelf book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the book' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when shelf book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book with/)
      end
    end
  end

  # Test suite for POST /shelves/:shelf_id/books
  describe 'POST /shelves/:shelf_id/books' do
    let(:valid_attributes) { {
        title: 'Test',
        rate: 0,
        author: 'Test',
        genre: 'Test',
        publisher: 'Test',
        shelf_id: shelf_id,
    } }

    context 'when request attributes are valid' do
      before { post "/shelves/#{shelf_id}/books", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/shelves/#{shelf_id}/books", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /shelves/:shelf_id/books/:id
  describe 'PUT /shelves/:shelf_id/books/:id' do
    let(:valid_attributes) { { title: 'TestBook' } }

    before { put "/shelves/#{shelf_id}/books/#{id}", params: valid_attributes }

    context 'when book exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the book' do
        updated_book = Book.find(id)
        expect(updated_book.title).to match(/TestBook/)
      end
    end

    context 'when the book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book/)
      end
    end
  end

  # Test suite for DELETE /shelves/:id
  describe 'DELETE /shelves/:id' do
    before { delete "/shelves/#{shelf_id}/books/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end