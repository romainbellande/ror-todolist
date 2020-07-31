require 'swagger_helper'

RSpec.describe 'api/v1/boards', type: :request do
  path '/v1/boards' do

    post 'Creates a board' do
      tags 'Boards'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :board, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string }
        },
        required: [ 'title' ]
      }

      response '200', 'board created' do
        schema '$ref' => '#/components/schemas/BoardCreated'

        let(:board) { { title: 'foo' } }

        run_test!
      end

      response '400', 'bad request' do
        schema '$ref' => '#/components/schemas/ErrorsObject'

        let(:board) { { description: 'foo' } }

        run_test!
      end
    end
  end
end
