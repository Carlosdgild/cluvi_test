# frozen_string_literal: true

module AwsService
  #
  # Fetches Alexa Rank from AWS using UrlInfo action
  #
  class FetchAlexaUrlInfoRankService < ApplicationService
    attr_reader :url, :rank, :failed

    def initialize(url)
      @url = url
      @rank = nil
      @failed = true
    end

    def perform
      fetch_rank

      return if failed

      rank
    end

    private

    # TODO: Implementar
    def fetch_rank
      # AlexaApiClient.fetch_rank(url)
      @failed = false
      nil
    end
  end
end
