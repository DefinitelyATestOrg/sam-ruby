# frozen_string_literal: true

module SamRuby
  module Resources
    class Events
      def initialize(client:)
        @client = client
      end

      # Retrieve an Event
      # 
      # @param event_id [String] The identifier of the Event.
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Models::Event]
      def retrieve(event_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/events/#{event_id}"
        req[:model] = SamRuby::Models::Event
        @client.request(req, opts)
      end

      # List Events
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :associated_object_id Filter Events to those belonging to the object with the provided identifier.
      # @option params [Category] :category
      # @option params [CreatedAt] :created_at
      # @option params [String] :cursor Return the page of entries after this one.
      # @option params [Integer] :limit Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [SamRuby::Page<SamRuby::Models::Event>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/events"
        req[:query] = params
        req[:page] = SamRuby::Page
        req[:model] = SamRuby::Models::Event
        @client.request(req, opts)
      end
    end
  end
end
