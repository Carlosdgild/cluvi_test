# frozen_string_literal: true

module AwsService
  #
  # Fetches Alexa Rank from AWS using UrlInfo action
  #
  class FetchAlexaUrlInfoRankService < ApplicationService
    attr_reader :url, :rank, :service_error

    def initialize(url)
      @url = url
      @rank = nil
      @service_error = nil
    end

    def perform
      fetch_rank

      return [nil, service_error] if service_error

      rank
    end

    private

    def fetch_rank
      @rank, error = AlexaApiClient.fetch_rank(url)
      if error
        @service_error = error
        return
      end
    end
  end
end
