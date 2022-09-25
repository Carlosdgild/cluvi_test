# frozen_string_literal: true

#
# Alexa API Client
#
class AlexaApiClient < ApplicationApiClient
  # TODO: Copiar el API key en el .env
  API_KEY = 'XYZ'

  class << self
    def fetch_rank(url)
      rank = fetch_url_info_with_rank(url)
      return [nil, error] if error

      rank
    end

    private

    def fetch_url_info_with_rank(url)
      log_message(:info, "Getting Alexa rank for URL #{url}")
      # TODO: Implementar con RestClient
    end
  end
end
