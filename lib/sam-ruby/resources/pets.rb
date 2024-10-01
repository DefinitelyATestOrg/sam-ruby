# frozen_string_literal: true

module SamRuby
  module Resources
    class Pets
      def initialize(client:)
        @client = client
      end

      # Updates a pet in the store with form data
      #
      # @param pet_id [Integer] ID of pet that needs to be updated
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String, nil] :name Name of pet that needs to be updated
      # @option params [String, nil] :status Status of pet that needs to be updated
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def create(pet_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/pet/#{pet_id}"
        req[:query] = params
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # Returns a single pet
      #
      # @param pet_id [Integer] ID of pet to return
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::Pet]
      def retrieve(pet_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/pet/#{pet_id}"
        req[:model] = SamRuby::Models::Pet
        @client.request(req, opts)
      end

      # Update an existing pet by Id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name
      # @option params [Array<String>] :photo_urls
      # @option params [Integer, nil] :id
      # @option params [Category, nil] :category
      # @option params [Symbol, Status, nil] :status pet status in the store
      # @option params [Array<Tag>, nil] :tags
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::Pet]
      def update(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/pet"
        req[:body] = params
        req[:model] = SamRuby::Models::Pet
        @client.request(req, opts)
      end

      # Deletes a pet
      #
      # @param pet_id [Integer] Pet id to delete
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String, nil] :api_key
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def delete(pet_id, _params = {}, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/pet/#{pet_id}"
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # Multiple status values can be provided with comma separated strings
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Symbol, Status, nil] :status Status values that need to be considered for filter
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Array<SamRuby::Models::Pet>]
      def find_by_status(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/pet/findByStatus"
        req[:query] = params
        req[:model] = SamRuby::ArrayOf.new(SamRuby::Models::Pet)
        @client.request(req, opts)
      end

      # Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3
      #   for testing.
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<String>, nil] :tags Tags to filter by
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Array<SamRuby::Models::Pet>]
      def find_by_tags(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/pet/findByTags"
        req[:query] = params
        req[:model] = SamRuby::ArrayOf.new(SamRuby::Models::Pet)
        @client.request(req, opts)
      end

      # uploads an image
      #
      # @param pet_id [Integer] Path param: ID of pet to update
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :body Body param:
      # @option params [String, nil] :additional_metadata Query param: Additional Metadata
      #
      # @param opts [Hash, SamRuby::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [SamRuby::Models::APIResponse]
      def upload_image(pet_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/pet/#{pet_id}/uploadImage"
        req[:body] = params[:body]
        req[:query] = params.except(:body)
        req[:model] = SamRuby::Models::APIResponse
        @client.request(req, opts)
      end
    end
  end
end
