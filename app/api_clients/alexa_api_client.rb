# frozen_string_literal: true

#
# Alexa API Client
#
class AlexaApiClient < ApplicationApiClient
  API_KEY = ENV.fetch("ALEXA_API_KEY", "ALEXA_API_KEY")

  class << self
    attr_reader :response, :error

    def fetch_rank(url)
      rank = fetch_url_info_with_rank(url)
      return [nil, error] if error

      rank
    end

    private

    def fetch_url_info_with_rank(url)
      log_message(:info, "Getting Alexa rank for URL '#{url}'")

      @response = get_req(
        "https://awis.api.alexa.com/api?Action=UrlInfo&ResponseGroup=Rank&Output=json&Url=#{url}",
        { content_type: :json, accept: :json, "x-api-key" => API_KEY }
      )

      if response.code != 200
        log_message(:error, "Alexa rank for URL '#{url}' could not be fetched")
        @error = "Could not fetch Alexa rank"
        return
      end

      begin
        rank = Integer(
          json_response[:Awis][:Results][:Result][:Alexa][:TrafficData][:Rank].presence || 0
        )
      rescue NoMethodError => e
        log_message(:error, "Alexa rank for URL '#{url}' could not be fetched. #{e.message}")
        @error = "Could not fetch Alexa rank"
        return
      end

      log_message(:info, "Alexa rank for URL '#{url}': #{rank}")

      rank
    end
  end
end
