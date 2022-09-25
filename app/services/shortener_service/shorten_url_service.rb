# frozen_string_literal: true

module ShortenerService
  #
  # Shortens a link
  #
  class ShortenUrlService < ApplicationService
    attr_reader :url, :link, :service_error

    def initialize(url)
      @url = url
      @link = nil
      @service_error = nil
    end

    def perform
      shorten_url

      return [service_error, true] if service_error

      link
    end

    private

    def shorten_url
      # TODO: Logica depende de respuesta a la duda
      @link = Link.new(
        url: url,
        short_code: generate_short_code,
        alexa_rank: fetch_alexa_rank
      )

      # return if link already exists # TODO: Logica depende de respuesta a la duda

      save_link
    end

    def generate_short_code
      loop do
        code = SecureRandom.uuid[0..6]
        break code unless Link.exists?(short_code: code)
      end
    end

    def fetch_alexa_rank
      data, error = AwsService::FetchAlexaUrlInfoRankService.perfom(url)
      raise StandardError, "An error has occured fetching Alexa rank" if error

      data
    end

    def save_link
      @service_error = link&.errors&.to_hash unless link.save
    end
  end
end
