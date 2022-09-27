# frozen_string_literal: true

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
end
